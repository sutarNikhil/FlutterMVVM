class AppException implements Exception {
  final message;
  final prefix;
  AppException([this.prefix, this.message]);

  @override
  String toString() {
    return '$prefix: $message';
  }
}

class FetchDataException extends AppException {
  FetchDataException({String? message}) : super('failed to connect', message);
}

class BadRequestException extends AppException {
  BadRequestException({String? message}) : super('Invalid request', message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException({String? message})
      : super('Unauthorized request', message);
}
