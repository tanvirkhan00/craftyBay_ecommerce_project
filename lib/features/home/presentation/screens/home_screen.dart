import 'package:ecommerce_project/App/app_colors.dart';
import 'package:ecommerce_project/App/asset_paths.dart';
import 'package:ecommerce_project/App/constants.dart';
import 'package:ecommerce_project/features/common/presentation/provider/main_nav_container_provider.dart';
import 'package:ecommerce_project/features/home/presentation/widgets/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/widgets/category_card.dart';
import '../../../common/presentation/widgets/product_card.dart';
import '../widgets/circle_icon_button.dart';
import '../widgets/product_search_field.dart';
import '../widgets/section_header.dart';

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
            spacing: 8,
            children: [
              const SizedBox(height: 4),
              product_search_field(),
              const SizedBox(height: 4),
              homeCarouselSlider(),
              sectionHeader(
                title: 'Category',
                onTapSeeAll: () {
                  context.read<MainNavContainerProvider>().changeToCategories();
                },
              ),
              _buildCategoryList(),
              sectionHeader(title: 'Popular', onTapSeeAll: () {}),
              SizedBox(
                height: 175,
                child: ListView.builder(
                  scrollDirection: .horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                  return ProductCard();
                }),
              )


            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navLogoSvg),
      actions: [
        CircleIconButton(icon: Icons.person, onTap: () {}),
        const SizedBox(width: 8),
        CircleIconButton(icon: Icons.call, onTap: () {}),
        const SizedBox(width: 8),
        CircleIconButton(icon: Icons.notification_add, onTap: () {}),
        const SizedBox(width: 8),
      ],
    );
  }
}


class _buildCategoryList extends StatelessWidget {
  const _buildCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryCard();
        },
        separatorBuilder: (context, index) => SizedBox(width: 8),
      ),
    );
  }
}
