import 'package:car_wayz/core/theme/theme.dart';
import 'package:car_wayz/presentation/common/app_assets.dart';
import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  static const _appBarHeight = 80.0;
  static const _appBarLogoSize = 30.0;
  static const _appBarLogoTopPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.palette.primaryColor),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: _appBarLogoTopPadding),
          child: SizedBox(
            height: _appBarLogoSize,
            child: context.svgImage(
              AppAssets.logoText,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_appBarHeight);
}
