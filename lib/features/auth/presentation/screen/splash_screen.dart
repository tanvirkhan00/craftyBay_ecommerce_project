import 'package:ecommerce_project/features/common/presentation/widgets/language_selector.dart';
import 'package:ecommerce_project/l10n/app_localizations.dart';
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

        child: Row(
          mainAxisAlignment: .spaceAround,
          children: [
            Text(AppLocalizations.of(context)!.hello),
            LanguageSelector()
          ],
        ),
      ),
    );
  }
}
