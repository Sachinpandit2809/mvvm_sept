class AppException implements Exception {
  final _message;
  final _prefix;
  AppException(
      [this._message,
      this._prefix]); // i think this is optional parameter in fuctions
  @override
  String toString() {
    return '$_message$_prefix';
  }

  String toStringMessage() {
    // confused here
    return '$_message$_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? message)
      : super(message, "Error during Communication");
}

class BadRequestException extends AppException {
  BadRequestException(String? message) : super(message, "Invalid request");
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? message)
      : super(message, "Unauthorised request");
}

class InvalidInputException extends AppException {
  InvalidInputException(String? message) : super(message, "Invalid input");
}
