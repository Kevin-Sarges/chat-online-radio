class Error implements Exception {
  final String message;

  Error(this.message);

  @override
  String toString() => 'AuthException(message: $message)';
}
