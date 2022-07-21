import 'dart:async';

import 'package:clean_arch/app/app_prefs.dart';
import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/prsentation/resources/assets_manager.dart';
import 'package:clean_arch/prsentation/resources/color_manager.dart';
import 'package:clean_arch/prsentation/resources/constants_manager.dart';
import 'package:clean_arch/prsentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

late Timer _timer;



class _SplashScreenState extends State<SplashScreen> {
    final _appPrefs = getIT<AppPreferences>();

  void _startTimer(){
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay),() => _goNext());

  }

  void _goNext() {
    if (!_appPrefs.isOnboardingScreenViewed()) {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    }
    // else if (_appPrefs.isLoggedIn()) {
    else  {
      Navigator.pushReplacementNamed(context, Routes.forgotPasswordRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
      body: const Center(child:const Image(image: AssetImage(ImageAssets.splashImage),),),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

  }

}


