import 'package:flutter/material.dart';

class sectionHeader extends StatelessWidget {
  const sectionHeader({
    super.key, required this.title, required this.onTapSeeAll,
  });

  final String title ;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextTheme.of(context).titleMedium?.copyWith(fontWeight: .w600),),
        TextButton(onPressed: onTapSeeAll , child: Text("See All")),
      ],
    );
  }
}
