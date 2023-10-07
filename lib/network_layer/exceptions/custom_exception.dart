import "package:dio/dio.dart";
import "package:flutter/foundation.dart";

abstract class ExceptionDescriber extends DioException {
  String? _statusMessage;
  int? _statusCode;

  ExceptionDescriber(String? statusMessage, int? statusCode,
      {required RequestOptions r})
      : super(requestOptions: r) {
    _statusCode = statusCode;
    _statusMessage = statusMessage;
  }

  String getStatusMessage() {
    return _statusMessage ?? 'empty STATUS MESSAGE';
  }

  int getStatusCode() {
    return _statusCode ?? 0;
  }
}

class BadRequestException extends ExceptionDescriber {
  BadRequestException(super.statusMessage, super.statusCode,
      {required super.r});
}

class NetworkException extends ExceptionDescriber {
  NetworkException(super.statusMessage, super.statusCode, {required super.r});
}

class ConnectionTimeOutException extends ExceptionDescriber {
  ConnectionTimeOutException(super.statusMessage, super.statusCode,
      {required super.r});
}
