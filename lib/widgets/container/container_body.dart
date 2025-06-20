import 'package:flutter/material.dart';

class ContainerBody extends StatelessWidget {
  final Widget child;

  const ContainerBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
