import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:meta/meta.dart';

/// Access time duration for file download (seconds)
const _accessDuration = 300;

class FileDownloadUrlFactory {
  final String pageId;
  final String authToken;
  final String serverUrl;

  FileDownloadUrlFactory({
    @required this.pageId,
    @required this.authToken,
    @required this.serverUrl,
  });

  String url(String fileName, String guid) {
    final fileUrl = StringBuffer();
    fileUrl.write(Uri.parse(serverUrl));
    fileUrl.write('l/v/m/download/');
    fileUrl.write(guid);
    fileUrl.write('/');
    fileUrl.write(Uri.encodeFull(fileName));
    fileUrl.write('?');

    final expires = DateTime.now().millisecondsSinceEpoch ~/ 1000 + _accessDuration;
    final data = '$guid$expires';
    final hash = sha(data, authToken);

    fileUrl.write('page-id=$pageId');
    fileUrl.write('&expires=$expires');
    fileUrl.write('&hash=$hash');

    return fileUrl.toString();
  }

  String sha(String data, String key) {
    final hmacSha256 = Hmac(sha256, utf8.encode(key));
    final digest = hmacSha256.convert(utf8.encode(data));

    final hash = StringBuffer();

    for (int element in digest.bytes) {
      hash.write(element.toRadixString(16).padLeft(2, '0'));
    }

    return hash.toString();
  }
}
