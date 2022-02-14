import 'package:meta/meta.dart';

import 'package:webim_sdk/src/domain/delta_response.dart';
import 'package:webim_sdk/webim_sdk.dart';

abstract class MessageEvent {
  factory MessageEvent.removedAll() => MessageEventRemovedAll();

  factory MessageEvent.fullUpdate(List<Message> list) => MessageEventFullUpdate(list);

  factory MessageEvent.removed(Message message) => MessageEventRemoved(message);

  factory MessageEvent.added(Message message) => MessageEventAdded(message);

  factory MessageEvent._null() => MessageEventNull();

  factory MessageEvent.changed({
    required Message from,
    required Message to,
  }) =>
      MessageEventChanged(from, to);

  factory MessageEvent.fromDeltaItem(DeltaItem item) {
    switch (item.event) {
      case Event.ADD:
        return MessageEventAdded(item.data);
      case Event.DELETE:
        return MessageEventRemoved(item.data);
      case Event.UPDATE:
        return MessageEventChanged(null, item.data);
      default:
        return MessageEvent._null();
    }
  }
}

@immutable
class MessageEventAdded implements MessageEvent {
  const MessageEventAdded(this.message);

  final Message message;
}

@immutable
class MessageEventFullUpdate implements MessageEvent {
  const MessageEventFullUpdate(this.list);

  final List<Message> list;
}

@immutable
class MessageEventChanged implements MessageEvent {
  const MessageEventChanged(this.from, this.to);

  final Message? from;
  final Message? to;
}

@immutable
class MessageEventRemoved implements MessageEvent {
  const MessageEventRemoved(this.message);

  final Message message;
}

@immutable
class MessageEventRemovedAll implements MessageEvent {}

@immutable
class MessageEventNull implements MessageEvent {}
