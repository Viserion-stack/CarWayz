import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});
  static Page<void> page() => const MaterialPage<void>(child: AddScreen());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Home screen'),
          ),
        ],
      ),
    );
  }
}
