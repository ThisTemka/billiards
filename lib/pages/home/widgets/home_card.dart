import 'package:billiards/widgets/container/container_body.dart';
import 'package:billiards/widgets/container/container_type.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/icon/icon.dart';
import 'package:billiards/widgets/text/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/widgets/container/container.dart';

class HomeCard extends ConsumerWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const HomeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContainerWidget(
      type: ContainerType.menuChoose,
      onTap: () => onTap(),
      body: ContainerBody(
        child: GroupWidget(
          children: [
            IconWidget(
              icon: icon,
            ),
            TextWidget(
              data: title,
            ),
          ],
        ),
      ),
    );
  }
}
