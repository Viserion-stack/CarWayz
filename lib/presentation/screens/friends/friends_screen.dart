import 'package:car_wayz/core/theme/theme.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  static Page<void> page() => const MaterialPage<void>(child: FriendsScreen());
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Friends screen',
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.palette.textOnPrimaryColor)),
          ),
        ],
      ),
    );
  }
}
