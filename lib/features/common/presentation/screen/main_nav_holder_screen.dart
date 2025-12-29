import 'package:ecommerce_project/App/app_colors.dart';
import 'package:ecommerce_project/features/category/presentation/screens/category_list_screen.dart';
import 'package:ecommerce_project/features/common/presentation/provider/main_nav_container_provider.dart';
import 'package:ecommerce_project/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_project/features/product/wishList/presentation/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../cart/presentation/screens/cart_screen.dart';

class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});

  static const String name = "/mainNavHolderScreen";

  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {
 final List<Widget> _screen = [
   HomeScreen(),
   CategoryListScreen(),
   CartScreen(),
   WishListScreen(),
 ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavContainerProvider>(
      builder: (context, mainNavContainerProvider,_) {
        return Scaffold(
          body: _screen[mainNavContainerProvider.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
              selectedItemColor: AppColors.themeColor,
              currentIndex: mainNavContainerProvider.selectedIndex,
              onTap: mainNavContainerProvider.changeItem,
              items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carts"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded), label: "Wishlist"),
          ]),
        );
      }
    );
  }
}
