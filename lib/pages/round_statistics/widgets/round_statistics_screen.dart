import 'package:billiards/pages/round_statistics/managers/i_round_statistics_manager.dart';
import 'package:billiards/blocks/screen/page_action.dart';
import 'package:billiards/blocks/screen/page_actions.dart';
import 'package:billiards/blocks/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';

class RoundStatisticsScreen extends ConsumerWidget {
  final Widget content;

  const RoundStatisticsScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(roundStatisticsManagerProvider);

    return ScreenWidget(
        header: const ScreenHeader(
          title: 'round_statistics',
          isAnimated: true,
        ),
        content: content,
        actions: PageActions(
          actions: [
            PageAction(
              icon: Icons.close,
              onPressed: () => manager.closeMatch(),
              label: 'close',
            ),
            PageAction(
              icon: Icons.arrow_forward,
              onPressed: () => manager.nextRound(),
              label: 'next_round',
            ),
          ],
        ));
  }
}
