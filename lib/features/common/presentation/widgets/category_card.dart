import 'package:ecommerce_project/features/category/data/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../App/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel,});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation:0,
          color: AppColors.themeColor.withAlpha(40),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Image.network(categoryModel.icon, width: 30, height: 30,
              errorBuilder: (_, _, _) => Icon(Icons.error, color: Colors.grey, size: 30,),
            ),
          ),
        ),
        Text(categoryModel.title,
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.w400, color: AppColors.themeColor, overflow: .ellipsis),
        )
      ],
    );
  }
}
