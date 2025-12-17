import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../App/asset_paths.dart';

class appLogo extends StatelessWidget {
  const appLogo({
    super.key, this.width, this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        AssetPaths.logoSvg,
        width: width ?? 100,
        height: height,
    );
  }
}
