import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
   Locale _currentLocal = Locale("en");

   Locale get currentLocal => _currentLocal;

   Future<void> loadInitialLanguage() async {
     Locale locale = await _getLocal();
     _currentLocal = locale ;

     ChangeNotifier();
   }

   void changeLocal(Locale newLocale) {
     if(_currentLocal == newLocale) return;

     _currentLocal = newLocale;
     _saveLocal(_currentLocal.languageCode);

     notifyListeners();
   }

   Future<void> _saveLocal(String locale) async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     await sharedPreferences.setString("local", locale);
   }
   
   Future<Locale> _getLocal() async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     String savedLocal = sharedPreferences.getString("local") ?? "en";
     return Locale(savedLocal);
   }
}