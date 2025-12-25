import 'package:flutter/material.dart';

import '../../../../App/app_colors.dart';
import '../../../../App/asset_paths.dart';
import '../../../../App/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      Wrap(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20,),
                          Text("4.3", style: TextStyle(color: Colors.black),)
                        ],
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5)
                        ),
                        color: AppColors.themeColor,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(Icons.favorite_outline, size: 18,),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}