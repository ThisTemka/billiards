import 'package:billiards/pages/round_turn/managers/i_round_turn_manager.dart';
import 'package:billiards/pages/round_turn/round_turn_translations.dart';
import 'package:billiards/blocks/screen/page_action.dart';
import 'package:billiards/blocks/screen/page_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/blocks/screen/screen.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';
import 'package:get/get.dart';

class RoundTurnScreen extends ConsumerWidget {
  final Widget content;

  const RoundTurnScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(roundTurnManagerProvider);
    return ScreenWidget(
      header: ScreenHeader(
        title: RoundTurnTranslations.roundTurn.tr,
        isAnimated: true,
        trailing: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => manager.navigateToHome(),
        ),
      ),
      content: content,
      actions: PageActions(
        actions: [
          PageAction(
            label: RoundTurnTranslations.completeTurn.tr,
            icon: Icons.stop_circle_outlined,
            onPressed: () => manager.completeTurn(),
          ),
        ],
      ),
    );
  }
}
