import 'dart:convert';
import 'dart:developer';

import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/data/data_source/local_data_source.dart';
import 'package:clean_arch/data/responses/responses.dart';
import 'package:clean_arch/prsentation/resources/assets_manager.dart';
import 'package:clean_arch/prsentation/resources/constants_manager.dart';
import 'package:clean_arch/prsentation/resources/language_manager.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app/MyApp.dart';
import 'data/network/dio_factory.dart';


Future<void> test() async {
  var cached = CachedItem('data', cacheTimeInSeconds: 6000);
  log(cached.isValidCache.toString());
  await Future.delayed(Duration(seconds: 5));
  log(cached.isValidCache.toString());

}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModules();


  runApp(EasyLocalization(
    supportedLocales: const [englishLocale,arabicLocale],
    path: LanguageAssets.languageAssetBase,
    child: MyApp() ,) );
}
