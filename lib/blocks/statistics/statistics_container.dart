import 'package:flutter/material.dart';

class StatisticsContainer extends StatelessWidget {
  final List<Widget> children;
  const StatisticsContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children,
    );
  }
}
