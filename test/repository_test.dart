import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:webim_sdk/src/domain/chat_action.dart';
import 'package:webim_sdk/src/domain/default_response.dart';
import 'package:webim_sdk/src/domain/upload_response.dart';
import 'package:webim_sdk/src/domain/history_response.dart';
import 'package:webim_sdk/src/domain/delta_response.dart';
import 'package:webim_sdk/src/api/webim_repository.dart';

void main() {
  getLogin();

  sendMessage();

  getDeltaGroup();

  getDelta('d1c175dcf68d43159cbe8e015906adc0', '7f0f7d9b025240f0983b646072a4c97a');

  getHistorySince();

  hetHistoryBefore();

  uploadFile();

  setChatVisitorRead();
}

void setChatVisitorRead() async {
// #region

  // *** Request ***
  // uri: https://demo.webim.ru/l/v/m/action
  // method: POST
  // responseType: ResponseType.json
  // followRedirects: true
  // connectTimeout: 0
  // receiveTimeout: 0
  // extra: {}
  // headers:
  //  content-type: application/x-www-form-urlencoded
  // data:
  // {action: chat.read_by_visitor, page-id: fa6026bb331243e8814d98baf6600d6d, auth-token: 6201ab127b6347abb94e68bac7fe2906}
  //
  // *** Response ***
  // uri: https://demo.webim.ru/l/v/m/action
  // statusCode: 200
  // headers:
  //  connection: keep-alive
  //  date: Sat, 24 Jul 2021 23:43:09 GMT
  //  content-length: 16
  //  x-frame-options: SAMEORIGIN
  //  content-type: application/json; charset=UTF-8
  //  x-webim-version: 10.3.36
  //  x-time: 0.002
  //  server: nginx
  // Response Text:
  // {"result":"ok"}

  // I/WEBIM LOG: 27 Jul 2021 13:38:53:430 GMT+03:00 D/WEBIM LOG:
  //   Webim request:
  //   HTTP method - POST
  //   URL - https://demo.webim.ru/l/v/m/action
  //   Parameters:
  //   action=chat.read_by_visitor
  //   page-id=6677f9f78e6b4e54b4f52bff5a6f6ac6
  //   auth-token=f741a53c21aa484b8d5c64d68e6dddb6
  // I/WEBIM LOG: 27 Jul 2021 13:38:53:464 GMT+03:00 D/WEBIM LOG:
  //   Webim response:
  //   https://demo.webim.ru/l/v/m/action
  //   Parameters:
  //   action=chat.read_by_visitor
  //   page-id=6677f9f78e6b4e54b4f52bff5a6f6ac6
  //   auth-token=f741a53c21aa484b8d5c64d68e6dddb6
  //   HTTP code - 200
  //   Message: OK
  //   JSON:
  //   {
  //     "result": "ok"
  //   }

// #endregion
  return test(
    'setChatVisitorRead',
    () async {
      final repository = _createRepository();
      final result = await repository.setChatRead(
        action: ChatAction.ACTION_CHAT_READ_BY_VISITOR.value,
        pageId: 'fa6026bb331243e8814d98baf6600d6d',
        authorizationToken: '6201ab127b6347abb94e68bac7fe2906',
      );

      expect(result != null, true);
      expect(result is DefaultResponse, true);
    },
  );
}

void uploadFile() {
// #region

  // I/WEBIM LOG: 24 Jul 2021 18:10:42:973 GMT+03:00 D/WEBIM LOG:
  //     Webim request:
  //     HTTP method - POST
  //     URL - https://demo.webim.ru/l/v/m/upload
  //     Parameters:
  //     chat-mode=online
  //     client-side-id=ba5f36b9-86ac-4e15-8a85-bd848f6fe163
  //     page-id=9c5c08f4286a4a0bb4fbfe07b2fd4776
  //     auth-token=6201ab127b6347abb94e68bac7fe2906
  // I/WEBIM LOG: 24 Jul 2021 18:10:43:134 GMT+03:00 D/WEBIM LOG:
  //     Webim response:
  //     https://demo.webim.ru/l/v/m/upload
  //     Parameters:
  //     chat-mode=online
  //     client-side-id=ba5f36b9-86ac-4e15-8a85-bd848f6fe163
  //     page-id=9c5c08f4286a4a0bb4fbfe07b2fd4776
  //     auth-token=6201ab127b6347abb94e68bac7fe2906
  //     HTTP code - 200
  //     Message: OK
  //     JSON:
  //     {
  //       "result": "ok",
  //       "data": {
  //         "guid": "dfe45d16b2354ea68d4761307fa53f8f",
  //         "filename": "IMG_20210724_180937.jpg",
  //         "content_type": "image\/jpeg",
  //         "client_content_type": "image\/jpeg",
  //         "size": 145329,
  //         "visitor_id": "45dc035a85874bca803c2aa2e4dd1392",
  //         "image": {
  //           "size": {
  //             "width": 960,
  //             "height": 1280
  //           }
  //         }
  //       }
  //     }

  // #endregion

  return test(
    'uploadFile',
    () async {
      final repository = _createRepository();
      final file = File('test/asset/img.jpeg');
      final result = await repository.uploadFile(
        file: file,
        chatMode: 'online',
        clientSideId: 'ba5f36b9-86ac-4e15-8a85-bd848f6fe169',
        pageId: 'fa6026bb331243e8814d98baf6600d6d',
        authorizationToken: '6201ab127b6347abb94e68bac7fe2906',
      );

      expect(result != null, true);
      expect(result is UploadResponse, true);
    },
  );
}

void hetHistoryBefore() {
// #region hetHistoryBefore request log

  // *** Request ***
  // uri: https://demo.webim.ru/l/v/m/history?page-id=c4c8ebbffe5c41fd969a8364e081a1b4&auth-token=6201ab127b6347abb94e68bac7fe2906&before-ts=1627133784372107
  // method: GET

// #endregion
  return test(
    'getHistoryBefore',
    () async {
      final repository = _createRepository();
      final result = await repository.getHistoryBefore(
        'c4c8ebbffe5c41fd969a8364e081a1b4',
        '6201ab127b6347abb94e68bac7fe2906',
        // 1627130511930,
        DateTime.now().microsecondsSinceEpoch,
      );

      expect(result != null, true);
      expect(result is HistoryBeforeResponse, true);
    },
  );
}

void getHistorySince() {
  // #region get history since request log

  // I/WEBIM LOG: 24 Jul 2021 15:44:38:058 GMT+03:00 D/WEBIM LOG:
  // Webim request:
  // HTTP method - GET
  // URL - https://demo.webim.ru/l/v/m/history?page-id=c4c8ebbffe5c41fd969a8364e081a1b4&auth-token=6201ab127b6347abb94e68bac7fe2906&since=1627130511930745

  // #endregion
  return test(
    'getHistorySince',
    () async {
      final repository = _createRepository();
      final result = await repository.getHistorySince(
        'c4c8ebbffe5c41fd969a8364e081a1b4',
        '6201ab127b6347abb94e68bac7fe2906',
        '1627130511930745',
      );

      expect(result != null, true);
      expect(result is HistorySinceResponse, true);
    },
  );
}

Future<void> sendMessage() async {
  return test(
    'sendMessage',
    () async {
      // #region send message request

      // D/WEBIM   (26984): Webim request:
      // D/WEBIM   (26984): HTTP method - POST
      // D/WEBIM   (26984): URL - https://demo.webim.ru/l/v/m/action
      // D/WEBIM   (26984): Parameters:
      // D/WEBIM   (26984): action=chat.message
      // D/WEBIM   (26984): message=AndX2%20Test%20test%20message
      // D/WEBIM   (26984): client-side-id=13ede407-b5e6-4b97-87d3-bb88083eb460
      // D/WEBIM   (26984): page-id=21aa6dec2e204a298969d4f906dc0f6d
      // D/WEBIM   (26984): auth-token=d1c175dcf68d43159cbe8e015906adc0
      // D/WEBIM   (26984): 24 Jul 2021 14:57:09:724 GMT+03:00 D/WEBIM LOG:

      // #endregion

      final repository = _createRepository();
      final result = await repository.sendMessage(
        action: 'chat.message',
        authorizationToken: '6201ab127b6347abb94e68bac7fe2906',
        pageId: '9c5c08f4286a4a0bb4fbfe07b2fd4776',
        clientSideId: '13ede407-b5e6-4b97-87d3-bb88083eb460',
        message: 'AndX2 Test test message',
      );

      expect(result != null, true);
      expect(result is DefaultResponse, true);
    },
  );
}

getDeltaGroup() {
  return group(
    'getDeltaGroup',
    () {
      String authToken = 'd1c175dcf68d43159cbe8e015906adc0';
      String pageId = '7f0f7d9b025240f0983b646072a4c97a';

      setUpAll(
        () async {
          final loginResponse = await _createRepository().getLogin(
            event: 'init',
            pushService: 'gcm',
            platform: 'android',
            visitorFieldsJsonString:
                '%7B%22id%22%3A%223dc3ef50eccd413fb4c440dc3c8491ff%22%2C%22icon%22%3A%7B%22color%22%3A%22%23eeef65%22%2C%22shape%22%3A%22triangle%22%7D%2C%22stored%22%3Atrue%2C%22hasProvidedFields%22%3Afalse%2C%22creationTs%22%3A1626071726.808413%2C%22modificationTs%22%3A1626071726.8084671%7D',
            location: 'mobile',
            visitSessionId: 'af53d60b77ef4fab886881db072c9912',
            title: 'Android%20Client',
            since: 0,
            isToRespondImmediately: true,
            deviceId: '89d8f156-0ff2-4dca-889c-dc4e7d59f6fc',
          );
          authToken = loginResponse.fullUpdate.authToken;
          authToken = loginResponse.fullUpdate.pageId;
        },
      );

      getDelta(authToken, pageId);
    },
  );
}

Future<void> getDelta(
  String authToken,
  String pageId,
) async {
  return test(
    'getDelta',
    () async {
      // #region request log

// *** Request ***
// uri: https://demo.webim.ru/l/v/m/delta?since=11&page-id=94f1bf3bc8f3407faba9cb72faf64fa2&auth-token=f741a53c21aa484b8d5c64d68e6dddb6&ts=1627377561447
// method: GET
// responseType: ResponseType.json
// followRedirects: true
// connectTimeout: 0
// receiveTimeout: 0
// extra: {}
// headers:
//  content-type: application/json; charset=utf-8
// data:
// {}

// *** Response ***
// uri: https://demo.webim.ru/l/v/m/delta?since=11&page-id=94f1bf3bc8f3407faba9cb72faf64fa2&auth-token=f741a53c21aa484b8d5c64d68e6dddb6&ts=1627377561447
// statusCode: 200
// headers:
//  connection: keep-alive
//  cache-control: max-age=10
//  date: Tue, 27 Jul 2021 09:19:37 GMT
//  transfer-encoding: chunked
//  content-encoding: gzip
//  vary: Accept-Encoding
//  etag: W/"69fc5e0516d485cf29654d16787e1f7472e04191"
//  content-type: application/json; charset=UTF-8
//  x-webim-version: 10.3.36
//  x-cache: MISS
//  server: nginx
//  expires: Tue, 27 Jul 2021 09:19:47 GMT
// Response Text:
// {"revision":12,"deltaList":[{"objectType":"CHAT_MESSAGE","event":"add","id":"2c999ea180c848d5aa85c5da5bc6f8b9","data":{"id":"2c999ea180c848d5aa85c5da5bc6f8b9","clientSideId":"06bd27ca-04c9-4a16-abf5-6ea9d35fa0b7","channelSideId":null,"kind":"visitor","name":"Посетитель","avatar":null,"authorId":null,"text":"dsfbsdfbdfb","sessionId":"560f5ecb228a47c391bd4d428e1f9d89","ts":1627377577.359863,"modifiedTs":1627377577.359863,"canBeReplied":true,"canBeEdited":true,"edited":false,"read":false}}]}

      // #endregion

      final repository = _createRepository();
      final result = await repository.getDelta(
        since: 4,
        pageId: pageId,
        authorizationToken: authToken,
        timestamp: 1627117770601,
      );

      expect(result != null, true);
      expect(result is DeltaResponse, true);
    },
  );
}

Future<void> getLogin() async {
// #region request log

// D/WEBIM   (26984): Specified Webim server – https://demo.webim.ru
// D/WEBIM   (26984): 24 Jul 2021 12:04:49:431 GMT+03:00 D/WEBIM LOG:
// D/WEBIM   (26984): Webim request:
// D/WEBIM   (26984): HTTP method - GET
// D/WEBIM   (26984): URL - https://demo.webim.ru/l/v/m/history?page-id=d7eca2d814344f61b3806a2009fd68c2&auth-token=75aa0bcfb78f4f999c480a8255ea844c&since=1626962219842293
// D/WEBIM   (26984): 24 Jul 2021 12:04:49:431 GMT+03:00 D/WEBIM LOG:
// D/WEBIM   (26984): Webim request:
// D/WEBIM   (26984): HTTP method - GET
// D/WEBIM   (26984): URL - https://demo.webim.ru/l/v/m/delta?event=init&
// push-service=gcm&
// platform=android&
// visitor=%7B%22id%22%3A%223dc3ef50eccd413fb4c440dc3c8491ff%22%2C%22icon%22%3A%7B%22color%22%3A%22%23eeef65%22%2C%22shape%22%3A%22triangle%22%7D%2C%22stored%22%3Atrue%2C%22hasProvidedFields%22%3Afalse%2C%22creationTs%22%3A1626071726.808413%2C%22modificationTs%22%3A1626071726.8084671%7D&
// location=mobile&
// visit-session-id=af53d60b77ef4fab886881db072c9912&
// title=Android%20Client&
// since=0&
// respond-immediately=true&
// device-id=89d8f156-0ff2-4dca-889c-dc4e7d59f6fc

// #endregion

  return test('getLogin', () async {
    final repository = _createRepository();
    final result = await repository.getLogin(
      event: 'init',
      pushService: 'gcm',
      platform: 'android',
      visitorFieldsJsonString:
          '%7B%22id%22%3A%223dc3ef50eccd413fb4c440dc3c8491ff%22%2C%22icon%22%3A%7B%22color%22%3A%22%23eeef65%22%2C%22shape%22%3A%22triangle%22%7D%2C%22stored%22%3Atrue%2C%22hasProvidedFields%22%3Afalse%2C%22creationTs%22%3A1626071726.808413%2C%22modificationTs%22%3A1626071726.8084671%7D',
      location: 'mobile',
      visitSessionId: 'af53d60b77ef4fab886881db072c9912',
      title: 'Android%20Client',
      since: 0,
      isToRespondImmediately: true,
      deviceId: '89d8f156-0ff2-4dca-889c-dc4e7d59f6fc',
    );

    expect(result != null, true);
    expect(result is DeltaResponse, true);
  });
}

WebimRepository _createRepository() {
  final dio = Dio(BaseOptions(baseUrl: 'https://demo.webim.ru'))
    ..interceptors.addAll([
      if (kDebugMode)
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
    ]);
  return WebimRepository(dio);
}
