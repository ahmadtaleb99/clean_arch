import 'dart:convert';

import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/data/responses/responses.dart';
import 'package:clean_arch/prsentation/resources/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'app/MyApp.dart';
import 'data/network/dio_factory.dart';


Future<void> test() async {
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

  final _result = await dio.fetch(
          Options(method: 'POST', headers: {}, extra: {})
              .compose(dio.options, '/customer/forget-password',
              queryParameters: {}, data:{'username': 'ahmad.taleb1@hotmail.com'})
           );
  Map s= _result.data;
  final res = ForgetPasswordResponse.fromJson(jsonDecode(_result.data));
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModules();
  runApp( MyApp() );
}
