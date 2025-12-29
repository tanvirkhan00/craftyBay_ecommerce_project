import 'package:flutter/material.dart';
import '../../../../../App/app_colors.dart';
import '../../../../../App/asset_paths.dart';
import '../../../../../App/constants.dart';
import 'inc_dec_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Card(
      elevation: 3,
      shadowColor: AppColors.themeColor.withAlpha(40),
      color: Colors.black12,
      child: Row(
        children: [
          Image.asset(
            AssetPaths.shoeImage,
            height: 100,
            width: 100,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "New Special Shoe",
                          maxLines: 1,
                          overflow: .ellipsis,
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: .w500,
                          ),
                        ),
                        Text("Color: Red, Size: XL", style: textTheme.titleSmall?.copyWith(color: Colors.grey),),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "${Constants.takaSign}600",
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: .w600,
                        color: AppColors.themeColor,
                      ),
                    ),
                    IncDecButton(onChange: (int value) {  },)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
