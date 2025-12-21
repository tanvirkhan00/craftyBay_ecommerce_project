import 'package:ecommerce_project/App/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 8,
          children: [
            SvgPicture.asset(AssetPaths.navLogoSvg),
            Spacer(),
            CircleIconButton(
              icon: Icons.person,
              onTap: () {  },
            ),
            CircleIconButton(
              icon: Icons.call,
              onTap: () {  },
            ),
            CircleIconButton(
              icon: Icons.notification_add,
              onTap: () {  },
            ),
          ],
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key, required this.icon, required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.grey.withAlpha(50),
        child: Icon(icon, color: Colors.grey,),
      ),
    );
  }
}
