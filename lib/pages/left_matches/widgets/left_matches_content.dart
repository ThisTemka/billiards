import 'package:billiards/pages/left_matches/widgets/left_matches_list.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/group/group_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeftMatchesContent extends ConsumerWidget {
  const LeftMatchesContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GroupWidget(
      type: GroupType.free,
      children: [
        LeftMatchesList(),
      ],
    );
  }
}
