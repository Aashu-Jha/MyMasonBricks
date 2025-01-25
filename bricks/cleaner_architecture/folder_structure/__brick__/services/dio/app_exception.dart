abstract class AppException implements Exception {
  AppException({required this.message, this.code});

  final String message;
  final String? code;
}

class NetworkException extends AppException {
  NetworkException({
    required super.message,
    this.statusCode,
    super.code,
  });

  factory NetworkException.fromStatusCode(int statusCode, {String? message}) {
    switch (statusCode) {
      case 400:
        return NetworkException(
          message: message ?? 'Bad request',
          statusCode: statusCode,
          code: 'BAD_REQUEST',
        );
      case 401:
        return NetworkException(
          message: 'Unauthorized',
          statusCode: statusCode,
          code: 'UNAUTHORIZED',
        );
      case 403:
        return NetworkException(
          message: 'Forbidden',
          statusCode: statusCode,
          code: 'FORBIDDEN',
        );
      case 404:
        return NetworkException(
          message: 'Not found',
          statusCode: statusCode,
          code: 'NOT_FOUND',
        );
      case 500:
        return NetworkException(
          message: 'Internal server error',
          statusCode: statusCode,
          code: 'INTERNAL_SERVER_ERROR',
        );
      default:
        return NetworkException(
          message: 'Something went wrong',
          statusCode: statusCode,
          code: 'UNKNOWN_ERROR',
        );
    }
  }
  final int? statusCode;
}
