import 'dart:math' as math;

import 'package:car_wayz/core/constants/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashScreen extends HookWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: AppMotion.splashAnimation);

    controller.forward();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: controller,
            child: const Center(
              child: Text('Splash screen'),
            ),
            builder: (context, child) => Transform.rotate(
              angle: controller.value * 2.0 * math.pi,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
