import 'dart:async';

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


  void _startTimer(){
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay),() => _goNext());

  }

  void _goNext() => Navigator.pushReplacementNamed(context, Routes.onBoarding);


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
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

}


