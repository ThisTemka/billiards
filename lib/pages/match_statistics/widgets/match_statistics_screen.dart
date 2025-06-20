import 'package:billiards/pages/match_statistics/managers/i_match_statistics_manager.dart';
import 'package:billiards/pages/match_statistics/match_statistics_translations.dart';
import 'package:billiards/blocks/screen/page_action.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/blocks/screen/screen.dart';
import 'package:billiards/blocks/screen/page_actions.dart';
import 'package:get/get.dart';

class MatchStatisticsScreen extends ConsumerWidget {
  final Widget content;

  const MatchStatisticsScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(matchStatisticsManagerProvider);
    return ScreenWidget(
      header: ScreenHeader(
        title: MatchStatisticsTranslations.matchStatistics.tr,
        isAnimated: true,
      ),
      content: content,
      actions: PageActions(
        actions: [
          PageAction(
            label: MatchStatisticsTranslations.newMatch.tr,
            icon: Icons.add_circle_outline,
            onPressed: () => manager.startNewMatch(),
          ),
          PageAction(
            label: MatchStatisticsTranslations.exit.tr,
            icon: Icons.exit_to_app,
            onPressed: () => manager.exit(),
          ),
        ],
      ),
    );
  }
}
