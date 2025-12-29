import 'package:ecommerce_project/features/cart/presentation/widgets/inc_dec_button.dart';
import 'package:ecommerce_project/features/common/presentation/widgets/favourite_button.dart';
import 'package:ecommerce_project/features/product/presentation/widgets/color_picker.dart';
import 'package:ecommerce_project/features/product/presentation/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';

import '../../../../App/app_colors.dart';
import '../../../../App/constants.dart';
import '../../../common/presentation/widgets/rating_point.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = "/product-details-screen";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 8,
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text("Nike Shoe - New Edition 2026"),
                            ),
                            IncDecButton(onChange: (newValue) {}),
                          ],
                        ),
                        Row(
                          children: [
                            RatingPoint(),
                            TextButton(
                              onPressed: () {},
                              child: Text("Reviews"),
                            ),
                            FavouriteButton(),
                          ],
                        ),
                        Text(
                          "Color:",
                          style: TextTheme.of(context).titleMedium,
                        ),
                        const SizedBox(height: 4),
                        ColorPicker(
                          colors: ['Black', 'White', 'Red'],
                          onChange: (selectedColor) {},
                        ),
                        const SizedBox(height: 8),
                        Text("Size:", style: TextTheme.of(context).titleMedium),
                        const SizedBox(height: 4),
                        SizePicker(
                          sizes: ['S', 'M', 'L', 'XL', '2XL'],
                          onChange: (selectedSize) {},
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Description:",
                          style: TextTheme.of(context).titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                        style: TextStyle(color: Colors.grey)
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildTotalPriceAndAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildTotalPriceAndAddToCartSection() {
    final textTheme = TextTheme.of(context);
    return Container(
      padding: .all(10),
      decoration: BoxDecoration(color: AppColors.themeColor.withAlpha(90)),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text("Price", style: textTheme.bodyLarge),
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
            width: 140,
            child: FilledButton(
              onPressed: () {},
              child: Text("Add To Cart", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
