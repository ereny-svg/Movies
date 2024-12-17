import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong',style: TextStyle(color: Colors.red),));
  }
}