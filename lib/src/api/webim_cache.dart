import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';

import 'package:webim_sdk/src/domain/delta_response.dart';
import 'package:webim_sdk/src/domain/message_event.dart';

import 'package:webim_sdk/webim_sdk.dart';

class WebimCache {
  final List<Message> messageList;
  int readingSince;
  int readingBefore;

  final StreamController<MessageEvent> eventStream;

  WebimCache({
    @required this.messageList,
    this.eventStream,
  });

  int get oldestTimestamp => messageList.isEmpty
      ? -1
      : messageList.map<int>((message) => message.tsSeconds.round()).reduce(min);

  int get newestTimestamp => messageList.isEmpty
      ? -1
      : messageList.map<int>((message) => message.tsSeconds.round()).reduce(max);

  void replaceWithMessageList(List<Message> list) {
    messageList.clear();
    messageList.addAll(list);
    eventStream.add(MessageEvent.fullUpdate(List.from(messageList)..sort()));
  }

  List<MessageEvent> addMessageList(List<DeltaItem> list) {
    final modifiedEventList = <MessageEvent>[];
    for (var item in list) {
      if (item.objectType == DeltaItemType.CHAT_MESSAGE) {
        if (item.event == Event.DELETE) {
          Message existMsg = messageList.firstWhere(
            (element) {
              if (item.data == null) return element == Message(serverId: item.id);
              if (item.data is Message)
                return element == Message(serverId: item.id, clientSideId: item.data?.clientSideId);
              return false;
            },
            orElse: () => null,
          );
          if (existMsg == null && item.data != null && item.data is Message) {
            existMsg = messageList.firstWhere(
              (element) => element == item.data,
              orElse: () => null,
            );
          }
          if (existMsg != null) {
            messageList.remove(existMsg);
            modifiedEventList.add(MessageEvent.removed(existMsg));
            eventStream.add(MessageEvent.removed(existMsg));
          }
        } else {
          final message = item.data as Message;
          final existMsg = messageList.firstWhere(
            (element) => element == message,
            orElse: () => null,
          );
          if (existMsg == null) {
            modifiedEventList.add(MessageEvent.added(message));
            messageList.add(message);
            eventStream.add(MessageEvent.added(message));
          } else if (existMsg == message) {
            messageList.remove(existMsg);
            messageList.add(message);
            eventStream.add(MessageEvent.changed(from: existMsg, to: message));
          } else {
            modifiedEventList.add(MessageEvent.changed(from: existMsg, to: message));
            messageList.remove(existMsg);
            messageList.add(message);
            eventStream.add(MessageEvent.changed(from: existMsg, to: message));
          }
        }
      }
    }

    return modifiedEventList;
  }

  List<Message> get sendingMessage => messageList
      .where((message) =>
          message.status == WebimMessageState.sending && message.kind == WMMessageKind.VISITOR)
      .toList();

  List<Message> get sendingFileMessages => messageList
      .where((message) =>
          message.status == WebimMessageState.sending &&
          message.kind == WMMessageKind.FILE_FROM_VISITOR)
      .toList();

  void setReadingSince(int timeStamp) {
    readingSince = timeStamp;
  }

  void setReadingBefore(int timeStamp) {
    readingBefore = timeStamp;
  }
}
