

import 'package:clean_arch/prsentation/resources/constants_manager.dart';
import 'package:dio/dio.dart';

import 'data/network/dio_factory.dart';


void main() async {
  final  dio= Dio();

  Map<String, String> headers = {
    CONTENT_TYPE: APPLICATION_JSON,
    ACCEPT: APPLICATION_JSON,
  };
  dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: headers,
      receiveTimeout: AppConstants.apiTimeOut,
      sendTimeout: AppConstants.apiTimeOut);
  var response = await dio.post('/customer/forget-password', data: {'username': 'ahmad.taleb1@hotmail.com'});
}

void t(){}

