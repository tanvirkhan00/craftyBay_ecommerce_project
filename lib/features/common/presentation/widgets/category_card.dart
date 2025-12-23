import 'package:flutter/material.dart';

import '../../../../App/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation:0,
          color: AppColors.themeColor.withAlpha(40),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(Icons.computer, size: 28, color: AppColors.themeColor,),
          ),
        ),
        Text("Computer", style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.themeColor),)
      ],
    );
  }
}
