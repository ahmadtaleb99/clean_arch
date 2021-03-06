import 'package:clean_arch/prsentation/resources/color_manager.dart';
import 'package:clean_arch/prsentation/resources/style_manager.dart';
import 'package:clean_arch/prsentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,



    // cardview theme

    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    //app bar
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),

    //button  theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    // text theme
    textTheme: TextTheme(

        overline: getLightStyle(color: ColorManager.white, fontSize: FontSize.s22),
        headline1: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
        headline2: getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
        subtitle1: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
        subtitle2: getSemiBoldStyle(color: ColorManager.primary, fontSize: FontSize.s18),

        caption: getRegularStyle(color: ColorManager.grey1),
        bodyText1: getRegularStyle(color: ColorManager.grey),
        bodyText2: getRegularStyle(color: ColorManager.primary),
        headline3: getBoldStyle(color: ColorManager.primary)

    ),

    //input decoration
    inputDecorationTheme: InputDecorationTheme(

      // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
        getRegularStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
        labelStyle:
        getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.lightGrey.withOpacity(0.5), width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10)))),
    // label style


  );
}
