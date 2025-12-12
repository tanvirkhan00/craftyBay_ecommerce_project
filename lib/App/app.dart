import 'package:ecommerce_project/App/app_routes.dart';
import 'package:ecommerce_project/App/app_theme.dart';
import 'package:ecommerce_project/App/provider/language_provider.dart';
import 'package:ecommerce_project/features/auth/presentation/screen/splash_screen.dart';
import 'package:ecommerce_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LanguageProvider())],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            // router
            // theme
            initialRoute: SplashScreen.name,
            onGenerateRoute: AppRoutes.routes,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: .light,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [Locale("en"), Locale("bn")],
            locale: languageProvider.currentLocal,
          );
        }
      ),
    );
  }
}
