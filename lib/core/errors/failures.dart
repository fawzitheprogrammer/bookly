import 'package:dio/dio.dart';

abstract class Failure {
  final String failureMessage;

  Failure({required this.failureMessage});
}

class ServerFailure extends Failure {
  @override
  String failureMessage;

  ServerFailure({required this.failureMessage}) : super(failureMessage: '');

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            failureMessage: 'Connection time out, Please try again!');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            failureMessage: 'Send time out, Please try again!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            failureMessage: 'Receive time out, Please try again!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.hashCode, dioError.response);
      case DioExceptionType.cancel:
        return ServerFailure(
            failureMessage: 'You request was canceled, Please try again!');
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') == null) {
          return ServerFailure(failureMessage: 'No Internet Connection.');
        }
        return ServerFailure(
            failureMessage: 'Unexpected Error, Please try again');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            failureMessage: 'Opps There was an error, please try again later');
      default:
        return ServerFailure(
            failureMessage: 'Opps There was an error, please try again later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic reponse) {
    if (statusCode == 401 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(failureMessage: reponse['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          failureMessage: 'Your request not found, Please try again!');
    } else if (statusCode == 500) {
      return ServerFailure(
          failureMessage: 'Internal server error, Please try again!');
    } else {
      return ServerFailure(
          failureMessage: 'Opps There was an error, please try again later');
    }
  }
}
