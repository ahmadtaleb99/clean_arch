import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/prsentation/forgot_password/view/forgot_password_screen.dart';
import 'package:clean_arch/prsentation/login/view/login_screen.dart';
import 'package:clean_arch/prsentation/main/main_screen.dart';
import 'package:clean_arch/prsentation/onboarding_screen/view/onboarding_screen.dart';
import 'package:clean_arch/prsentation/register/register_screen.dart';
import 'package:clean_arch/prsentation/resources/strings_manager.dart';
import 'package:clean_arch/prsentation/splash/splash_screen.dart';
import 'package:clean_arch/prsentation/store_details/store_details_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoarding = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}
class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgotPasswordRoute:
        initForgetPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsScreen());

      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(
                AppStrings.noRouteFound),
          ),
          body: const Center(
              child: Text(
                  AppStrings.noRouteFound)),
        ));
  }
}