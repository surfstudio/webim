class WebimException implements Exception {
  WebimException(this.message);

  final String message;
}

class WebimBuilderException extends WebimException {
  WebimBuilderException(String message) : super(message);
}

class WebimTypeException extends WebimException {
  WebimTypeException(String message) : super(message);
}
