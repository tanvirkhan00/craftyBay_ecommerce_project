import 'package:ecommerce_project/features/common/presentation/provider/main_nav_container_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/presentation/widgets/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  static const String name = "/wish-list-screen";

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_,__) {
        context.read<MainNavContainerProvider>().backHome();
    },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WishList"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
      
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return FittedBox(child: ProductCard());
              }),
        ),
      ),
    );
  }
}
