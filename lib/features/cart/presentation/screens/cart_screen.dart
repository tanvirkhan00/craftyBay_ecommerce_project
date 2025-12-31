import 'package:ecommerce_project/App/app_colors.dart';
import 'package:ecommerce_project/App/constants.dart';
import 'package:ecommerce_project/features/common/presentation/provider/main_nav_container_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_,__) {
        context.read<MainNavContainerProvider>().backHome();
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(title: Text("Cart")),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CartItem();
                },
              ),
            ),
            _buildTotalPriceAndCheckOutSection(),
          ],
        ),
      ),
    );
  }

  Container _buildTotalPriceAndCheckOutSection() {
    final textTheme = TextTheme.of(context);
    return Container(
          padding: .all(10),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withAlpha(90),
          ),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text("Total Price", style: textTheme.bodyLarge),
                  Text(
                    "${Constants.takaSign}600",
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: .w600,
                      color: AppColors.themeColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 120,
                child: FilledButton(
                  onPressed: () {},
                  child: Text(
                    "CheckOut",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}

