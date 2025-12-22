import 'package:ecommerce_project/App/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/circle_icon_button.dart';
import '../widgets/product_search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16,),
                product_search_field()
              ],
            ),
          )
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navLogoSvg),
      actions: [
        CircleIconButton(
          icon: Icons.person,
          onTap: () {  },
        ),
        const SizedBox(width: 8,),
        CircleIconButton(
          icon: Icons.call,
          onTap: () {  },
        ),
        const SizedBox(width: 8,),
        CircleIconButton(
          icon: Icons.notification_add,
          onTap: () {  },
        ),
        const SizedBox(width: 8,),
      ],
    );
  }
}

