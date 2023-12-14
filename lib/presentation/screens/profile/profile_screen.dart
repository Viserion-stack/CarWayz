import 'package:car_wayz/core/theme/theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static Page<void> page() => const MaterialPage<void>(child: ProfileScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Profile screen',
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.palette.textOnPrimaryColor)),
          ),
        ],
      ),
    );
  }
}
