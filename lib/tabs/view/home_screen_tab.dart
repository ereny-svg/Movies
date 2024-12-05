import 'package:flutter/material.dart';

class HomeScreenTab extends StatelessWidget {
  static const String routeName = '/home_tab';
  const HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Screen Tab', style: TextStyle(color: Colors.amber),));
  }
}