abstract class ServerUrlParser {
  static String url(String accountName) {
    return accountName.contains('://') ? accountName : 'https://$accountName.webim.ru';
  }
}
