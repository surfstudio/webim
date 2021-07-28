import 'package:flutter_test/flutter_test.dart';

import 'package:webim_sdk/src/webim_session.dart';

void main() {
  test(
    'Build session test',
    () async {
      final buider = WebimSession.builder
        // ..account = 'https://chat.smpbank.ru'
        ..account = 'demo'
        // ..deviceId = '9f26db07-3b52-4f41-8222-1c017b90dea7'
        ..visitorFields =
            '{"id":"fc283b99ff97436a8ce4e88e1b280cd4","icon":{"color":"#e061f4","shape":"asterisk"},"stored":null,"hasProvidedFields":false,"creationTs":1627457757.3607411,"modificationTs":1627457757.3608217}'
        ..location = 'mobile';
      final session = buider.build();
      session.resume;
      await Future.delayed(Duration(seconds: 10000));
    },
  );
}
