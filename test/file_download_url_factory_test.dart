import 'package:flutter_test/flutter_test.dart';
import 'package:webim_sdk/src/util/file_download_url_factory.dart';

void main() {
  shaHash();
}

void shaHash() {
  //
  return test('shaHash', () {
    final hash = FileDownloadUrlFactory(
            serverUrl: 'https://demo.webim.ru',
            pageId: '9c5c08f4286a4a0bb4fbfe07b2fd4776',
            authToken: '6201ab127b6347abb94e68bac7fe2906')
        .sha("dfe45d16b2354ea68d4761307fa53f8f", "6201ab127b6347abb94e68bac7fe2906");

    expect(hash == '1e75134a82e80fc2275933e1298ff807ccd4ca9c57bc4821eaf31f6682a8a9c1', true);
  });
}
