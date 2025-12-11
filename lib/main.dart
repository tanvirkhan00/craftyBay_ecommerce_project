// Initial Setup

// 1. Folder Structure.
// 2. Firebase Setup.
// 3. Firebase Crashlytics.
// 4. Firebase Analytics.
// 5. Localization.
// 6. Theme.
// 7. Routing.
// 9. Network Caller.

import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'firebase_options.dart';
import 'package:ecommerce_project/App/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // The following lines are the same as previously explained in "Handling uncaught errors"
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: false);
    return true;
  };

  runApp(CraftyBay());
}
