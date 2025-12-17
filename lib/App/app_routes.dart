import 'package:ecommerce_project/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:ecommerce_project/features/auth/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes (RouteSettings settings) {
    late Widget widget = SizedBox();

    if(settings.name == SplashScreen.name) {
      widget = SplashScreen();
    } else if (settings.name == SignUpScreen.name) {
      widget = SignUpScreen();
    }


    return MaterialPageRoute(builder: (ctx) => widget);
  }
}