import 'package:flutter/material.dart';

class product_search_field extends StatelessWidget {
  const product_search_field({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: Colors.grey.withAlpha(50),
          filled: true,
          prefixIcon: Icon(Icons.search),
          hintText: "Search ......",
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none
          )
      ),
    );
  }
}