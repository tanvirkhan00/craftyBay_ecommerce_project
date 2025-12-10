// Initial Setup

// 1. Folder Structure.
// 2. Firebase Setup.
// 3. Firebase Crashlytics.
// 4. Firebase Analytics.
// 5. Localization.
// 6. Theme.
// 7. Routing.
// 9. Network Caller.

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:ecommerce_project/App/app.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(CraftyBay());
}