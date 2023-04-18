class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return super.toString();
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}
class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, 'Error During Communication');
}
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Error During Communication');
}