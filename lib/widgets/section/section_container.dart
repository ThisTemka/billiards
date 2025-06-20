import 'package:billiards/widgets/section/section_header.dart';
import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SectionContainer(
      {super.key, required this.title, this.children = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: title,
        ),
        ...children,
      ],
    );
  }
}
