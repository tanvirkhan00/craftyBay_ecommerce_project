import 'package:ecommerce_project/App/app_routes.dart';
import 'package:ecommerce_project/App/app_theme.dart';
import 'package:ecommerce_project/features/auth/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // router
      // theme
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoutes.routes,
        theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: .light,
    );
  }
}
