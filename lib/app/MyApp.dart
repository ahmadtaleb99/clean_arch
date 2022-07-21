import 'package:clean_arch/prsentation/resources/routes_manager.dart';
import 'package:clean_arch/prsentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {

  MyApp._internal();

  static final _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(375, 667),
    builder: (context , child ){
      return MaterialApp(

        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: getApplicationTheme(),

      );
    });
  }
}
