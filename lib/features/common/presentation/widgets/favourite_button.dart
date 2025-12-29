import 'package:flutter/material.dart';

import '../../../../App/app_colors.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5)
      ),
      color: AppColors.themeColor,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Icon(Icons.favorite_outline, size: 18,),
      ),
    );
  }
}