import 'package:billiards/pages/round_turn/entities/state/round_turn_state.dart';
import 'package:billiards/pages/round_turn/widgets/round_turn_controls.dart';
import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:billiards/widgets/section/section_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundTurnContent extends ConsumerWidget {
  const RoundTurnContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(roundTurnStateProvider);

    return ScreenContent(
      child: [
        Column(
          children: [
            SectionContainer(
              title: state.player!.user.name,
            ),
            SizedBox(height: 16.h),
            RoundTurnControls(),
          ],
        ),
      ],
    );
  }
}
