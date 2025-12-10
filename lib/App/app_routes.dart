import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes (RouteSettings settings) {
    late Widget widget;

    if(settings.name == "") {
      widget = SizedBox();
    }
    return MaterialPageRoute(builder: (ctx) => widget);
  }
}