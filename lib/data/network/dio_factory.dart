//setting for dio we will give to Api Client

// ignore_for_file: constant_identifier_names

import 'package:clean_arch/app/app_prefs.dart';
import 'package:clean_arch/prsentation/resources/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';



const String APPLICATION_JSON = "application/json";
// ignore: constant_identifier_names
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "langauge";
class DioFactory {
  
  final AppPreferences _appPrefs ;
  Future<Dio> getDio () async {

    final  dio= Dio();
    final appLanguage = _appPrefs.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: "SEND TOKEN HERE",
      DEFAULT_LANGUAGE: appLanguage
    };

    dio.options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        headers: headers,
        receiveTimeout: AppConstants.apiTimeOut,
        sendTimeout: AppConstants.apiTimeOut);


    //loggging in debug mode
    if(!kReleaseMode){
      dio.interceptors.add(PrettyDioLogger(
        request : true,
         requestHeader : true,
         requestBody : true,
         responseHeader : true,
         responseBody : true,
      ));
    }



    return dio;
  }

  DioFactory(this._appPrefs);
}