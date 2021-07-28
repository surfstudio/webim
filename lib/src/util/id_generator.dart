import 'package:uuid/uuid.dart';

class IdGenerator {
  static String get messageClientSideId {
    final uuid = Uuid();
    return uuid.v4().replaceAll('-', '');
  }
}
