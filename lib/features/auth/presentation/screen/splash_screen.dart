import 'package:ecommerce_project/features/common/presentation/screen/main_nav_holder_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = "/splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveNextScreen();
  }

  Future<void> _moveNextScreen()async {
    await Future.delayed(Duration(seconds:2));
    Navigator.pushReplacementNamed(
        context, MainNavHolderScreen.name
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            appLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}

