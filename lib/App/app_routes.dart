import 'package:ecommerce_project/features/auth/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes (RouteSettings settings) {
    late Widget widget = SizedBox();

    if(settings.name == SplashScreen.name) {
      widget = SplashScreen();
    }
    return MaterialPageRoute(builder: (ctx) => widget);
  }
}