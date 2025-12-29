import 'package:ecommerce_project/features/common/presentation/widgets/rating_point.dart';
import 'package:ecommerce_project/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../App/app_colors.dart';
import '../../../../App/asset_paths.dart';
import '../../../../App/constants.dart';
import 'favourite_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      } ,
      child: SizedBox(
        width: 150,
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withAlpha(50),
                  image: DecorationImage(
                      image: AssetImage(AssetPaths.shoeImage)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Nike Shoe RG3434 - New Arrival", style: TextStyle(color: Colors.black),maxLines: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${Constants.takaSign}3000", style: TextStyle(color: AppColors.themeColor),),
                        RatingPoint(),
                        FavouriteButton()
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

