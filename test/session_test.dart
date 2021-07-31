import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:webim_sdk/src/webim_session.dart';

void main() {
  createSession();

  test(
    'upload-download file',
    () async {
      final session = _createSession();
      await Future.delayed(Duration(seconds: 5));

      final file = File('test/asset/img.png');
      session.uploadFile(file);

      await Future.delayed(Duration(seconds: 5));

      while (true) {
        await Future.delayed(Duration(seconds: 5));
        final uploadedFileMessage = session.messageThread.firstWhere(
          (message) => message?.data?.file?.desc?.guid != null,
          orElse: () => null,
        );
        if (uploadedFileMessage != null) {
          final url = session.messageFileDownloadUrl(uploadedFileMessage);
          print(url);

          final request = await HttpClient().getUrl(Uri.parse(url));
          final response = await request.close();
          response.pipe(File('result/${uploadedFileMessage.data.file.desc.filename}').openWrite());

          final resultFile = File('result/${uploadedFileMessage.data.file.desc.filename}');
          expect(resultFile != null, true);
        }
      }
    },
    timeout: Timeout(Duration(seconds: 40)),
  );
}

// https://demo.webim.ru/l/v/m/download/4cd1180ff13b49c7a421e30472124407/img.png?page-id=3b00878d78c0478b940e11aedbbd2c79&expires=1627690097&hash=97edd2cfb980a865135ccd8085f8ae8a42609ec2c1bc25bb6dc2d1ff2cd02cb7
// https://demo.webim.ru/l/v/m/download/44fd8313c01c4737989b282a40b81b0e/img.png?page-id=3b00878d78c0478b940e11aedbbd2c79&expires=1627689147&hash=2f0bb4f7331912d0a83f780203a7d0bec8d397fa802e3f5fc44355a9350f2519
void createSession() {
  return test(
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
      session.resume();
      await Future.delayed(Duration(seconds: 10000));
    },
  );
}

WebimSession _createSession() {
  final buider = WebimSession.builder
    ..account = 'demo'
    // ..visitorFields =
    //     '{"id":"fc283b99ff97436a8ce4e88e1b280cd4","icon":{"color":"#e061f4","shape":"asterisk"},"stored":null,"hasProvidedFields":false,"creationTs":1627457757.3607411,"modificationTs":1627457757.3608217}'
    ..location = 'mobile';
  final session = buider.build();
  session.resume();
  return session;
}
