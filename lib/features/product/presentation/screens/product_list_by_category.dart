import 'package:ecommerce_project/features/common/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListByCategory extends StatefulWidget {
  const ProductListByCategory({super.key});

  static const String name = "/product-list-by-category";

  @override
  State<ProductListByCategory> createState() => _ProductListByCategoryState();
}

class _ProductListByCategoryState extends State<ProductListByCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Shoes"),
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
    );
  }
}
