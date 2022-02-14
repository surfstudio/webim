import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:webim_sdk/webim_sdk.dart';

void main() {
  test(
    'messare file parsing test',
    () {
// #region json

      const src = '''
      {
            "id": "3657411af7434d3ca34acf2534d99a26",
            "clientSideId": "62f8e933-5538-441c-87b3-20a2a555ba9a",
            "channelSideId": null,
            "kind": "file_visitor",
            "name": "Посетитель",
            "avatar": null,
            "authorId": null,
            "text": "{\"guid\": \"d9cc80d8873842ad9a1727e97a0cd518\", \"filename\": \"MWWM_\\u0418\\u043d\\u043d\\u043e\\u043f\\u043e\\u043b\\u0438\\u0441.pdf\", \"content_type\": \"application\/pdf\", \"client_content_type\": \"application\/pdf\", \"size\": 7714821, \"visitor_id\": \"45dc035a85874bca803c2aa2e4dd1392\"}",
            "sessionId": "560f5ecb228a47c391bd4d428e1f9d89",
            "ts": 1.627382334322194E9,
            "modifiedTs": 1.627382334322194E9,
            "data": {
              "file": {
                "state": "ready",
                "progress": 100,
                "desc": {
                  "guid": "d9cc80d8873842ad9a1727e97a0cd518",
                  "filename": "MWWM_Иннополис.pdf",
                  "content_type": "application\/pdf",
                  "client_content_type": "application\/pdf",
                  "size": 7714821,
                  "visitor_id": "45dc035a85874bca803c2aa2e4dd1392"
                },
                "page_id": "6677f9f78e6b4e54b4f52bff5a6f6ac6"
              }
            },
            "canBeReplied": true,
            "canBeEdited": true,
            "edited": false,
            "read": false
          }
      ''';

// #endregion

      final json = jsonDecode(src.replaceAll('"{', '{').replaceAll('}"', '}'));
      final message = Message.fromJson(json);

      expect(message.data?.file?.desc?.guid == 'd9cc80d8873842ad9a1727e97a0cd518', true);
    },
  );
}
