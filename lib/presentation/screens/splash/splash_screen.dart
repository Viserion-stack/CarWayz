import 'dart:math' as math;

import 'package:car_wayz/core/constants/app_const.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({super.key});
  static Page<void> page() => const MaterialPage<void>(child: SplashScreen());


  @override
  Widget build(BuildContext context) {


    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Splash screen'),
          ),
        ],
      ),
    );
  }
}
