import 'package:ecommerce_project/features/auth/presentation/screen/otp_screen.dart';
import 'package:ecommerce_project/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:ecommerce_project/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:ecommerce_project/features/auth/presentation/screen/splash_screen.dart';
import 'package:ecommerce_project/features/common/presentation/screen/main_nav_holder_screen.dart';
import 'package:ecommerce_project/features/product/presentation/screens/product_list_by_category.dart';
import 'package:ecommerce_project/features/product/wishList/presentation/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes (RouteSettings settings) {
    late Widget widget = SizedBox();

    if(settings.name == SplashScreen.name) {
      widget = SplashScreen();
    } else if (settings.name == SignUpScreen.name) {
      widget = SignUpScreen();
    } else if (settings.name == SignInScreen.name) {
      widget = SignInScreen();
    } else if (settings.name == OtpScreen.name) {
      widget = OtpScreen();
    } else if (settings.name == MainNavHolderScreen.name) {
      widget = MainNavHolderScreen();
    }else if (settings.name == ProductListByCategory.name) {
      widget = ProductListByCategory();
    }else if (settings.name == WishListScreen.name) {
      widget = WishListScreen();
    }


    return MaterialPageRoute(builder: (ctx) => widget);
  }
}