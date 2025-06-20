import 'package:billiards/pages/home/widgets/home_menu.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GroupWidget(
      children: [HomeMenu()],
    );
  }
}
