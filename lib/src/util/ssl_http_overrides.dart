import 'dart:io';

class SslHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }

  static T runSslOverridesZoned<T>(T Function() function) {
    if (Platform.isAndroid) {
      HttpOverrides.runZoned(
        () {
          return function();
        },
        createHttpClient: (SecurityContext c) => SslHttpOverrides().createHttpClient(c),
      );
    }
    return function();
  }
}
