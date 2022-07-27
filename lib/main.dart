import 'dart:convert';
import 'dart:developer';

import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/data/data_source/local_data_source.dart';
import 'package:clean_arch/data/responses/responses.dart';
import 'package:clean_arch/prsentation/resources/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'app/MyApp.dart';
import 'data/network/dio_factory.dart';


Future<void> test() async {
  var cached = CachedItem('data', cacheTime: 6000);
  log(cached.isValidCache.toString());
  await Future.delayed(Duration(seconds: 7));
  log(cached.isValidCache.toString());

}
Future<void> main() async {
  test();
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModules();
  runApp( MyApp() );
}
