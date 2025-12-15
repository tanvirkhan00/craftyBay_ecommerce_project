
import 'package:ecommerce_project/features/common/presentation/widgets/theme_selector.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = "/splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 100,),
            Text(
              "Select Theme",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ThemeSelector(),
          ],
        ),
      ),
    );
  }
}
