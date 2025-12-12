import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
   Locale _currentLocal = Locale("en");

   Locale get currentLocal => _currentLocal;

   void changeLocal(Locale newLocale) {
     if(_currentLocal == newLocale) return;

     _currentLocal = newLocale;
     notifyListeners();
   }
}