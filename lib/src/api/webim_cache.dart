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

  int get oldestTimestamp =>
      messageList.map<int>((message) => message.tsSeconds.round()).reduce(min);

  int get newestTimestamp =>
      messageList.map<int>((message) => message.tsSeconds.round()).reduce(max);

  void replaceWithMessageList(List<Message> list) {
    messageList.clear();
    messageList.addAll(list);
    eventStream.add(MessageEvent.fullUpdate(List.from(messageList)..sort()));
  }

  List<MessageEvent> addMessageList(List<DeltaItem> list) {
    final modifiedEventList = <MessageEvent>[];
    for (var item in list) {
      if (item.objectType == DeltaItemType.CHAT_MESSAGE) {
        final message = item.data as Message;
        final existMsg = messageList.firstWhere(
          (element) => message.clientSideId == element.clientSideId,
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
    print(messageList);
    return modifiedEventList;
  }

  List<Message> get sendingMessage => messageList
      .where((message) =>
          message.status == WebimMessageState.sending && message.kind == WMMessageKind.VISITOR)
      .toList();

  List<Message> get sendingFileMessages => messageList
      .where((message) =>
          message.status == WebimMessageState.sending && message.kind == WMMessageKind.FILE_FROM_VISITOR)
      .toList();

  void setReadingSince(int timeStamp) {
    readingSince = timeStamp;
  }

  void setReadingBefore(int timeStamp) {
    readingBefore = timeStamp;
  }
}
