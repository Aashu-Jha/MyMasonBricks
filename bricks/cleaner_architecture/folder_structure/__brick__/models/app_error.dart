import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  const AppError(this.appErrorType, this.message);

  factory AppError.fromStatusCode(int? statusCode, String message) {
    if (statusCode == null) {
      return AppError(AppErrorType.unknown, message);
    }
    switch (statusCode) {
      case 400:
        return AppError(AppErrorType.api, message);
      case 401:
        return AppError(AppErrorType.unauthorised, message);
      case 403:
        return AppError(AppErrorType.sessionDenied, message);
      case 404:
        return AppError(AppErrorType.api, message);
      case 420:
        return AppError(AppErrorType.network, message);
      case 430:
        return AppError(AppErrorType.format, message);
      case 500:
        return AppError(AppErrorType.server, message);
      default:
        return AppError(AppErrorType.unknown, message);
    }
  }

  final AppErrorType appErrorType;
  final String message;

  @override
  List<Object> get props => [appErrorType, message];
}

enum AppErrorType {
  api,
  network,
  server,
  format,
  database,
  unauthorised,
  sessionDenied,
  unknown,
}
