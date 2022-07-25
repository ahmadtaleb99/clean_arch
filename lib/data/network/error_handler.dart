// ignore_for_file: constant_identifier_names

import 'package:clean_arch/data/network/failure.dart';
import 'package:dio/dio.dart';




class ErrorHandler implements Exception{

    late Failure failure;
  ErrorHandler.handle(dynamic error){
    //error from api or from dio
    if(error is DioError){
          failure = _handleDioError(error);
          print(error.type);
    }
  }


  Failure _handleDioError(DioError error){
    switch(error.type){

      case DioErrorType.connectTimeout:
        return ErrorType.CONNECT_TIMEOUT.getFailure();
        break;
      case DioErrorType.sendTimeout:
        return ErrorType.SEND_TIMEOUT.getFailure();

      case DioErrorType.receiveTimeout:
        return ErrorType.RECEIVE_TIMEOUT.getFailure();

      case DioErrorType.cancel:
        return ErrorType.CANCEL.getFailure();

      case DioErrorType.other:
        return ErrorType.CONNECT_TIMEOUT.getFailure();

      case DioErrorType.response:
        if(error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null) {
          return Failure(error.response!.statusCode!,(error.response!.statusMessage!));

        }
        return Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN);


    }

  }
}





enum ErrorType {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION
}

extension ErrorTypeExtenstion on ErrorType {
  Failure getFailure() {
    switch (this) {
      case ErrorType.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);

      case ErrorType.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);

      case ErrorType.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);

      case ErrorType.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);

      case ErrorType.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);

      case ErrorType.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);

      case ErrorType.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);

      case ErrorType.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);

      case ErrorType.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);

      case ErrorType.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);

      case ErrorType.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);

      case ErrorType.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);

      case ErrorType.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTHORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // f
  // local status code
  static const int CONNECT_TIMEOUT = -1; //
  static const int CANCEL = -2; //
  static const int RECEIVE_TIMEOUT = -3; //
  static const int SEND_TIMEOUT = -4; //
  static const int CACHE_ERROR = -5; //
  static const int NO_INTERNET_CONNECTION = -6; //
  static const int UNKNOWN = -7; //
}

class ResponseMessage {
  static const String SUCCESS = "success"; // success with data
  static const String NO_CONTENT =
      "success"; // success with no data (no content)
  static const String BAD_REQUEST =
      "Bad request, Try again later"; // failure, API rejected request
  static const String UNAUTHORISED =
      "User is unauthorised, Try again later"; // failure, user is not authorised
  static const String FORBIDDEN =
      "Forbidden request, Try again later"; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      "Some thing went wrong, Try again later"; // failure, crash in server side
  static const String NOT_FOUND =
      "Some thing went wrong, Try again later"; // failure, crash in server side
  // local status code
  static const String CONNECT_TIMEOUT = "Time out error, Try again later";
  static const String CANCEL = "Request was cancelled, Try again later";
  static const String RECEIVE_TIMEOUT = "Time out error, Try again later";
  static const String SEND_TIMEOUT = "Time out error, Try again later";
  static const String CACHE_ERROR = "Cache error, Try again later";
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection";
  static const String UNKNOWN = "Some thing went wrong, Try again later";
}


//response coming from api if http req is valid
class ApiInternal{
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}