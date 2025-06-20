import 'package:billiards/pages/round_turn/entities/state/round_turn_state.dart';
import 'package:billiards/pages/round_turn/managers/i_round_turn_manager.dart';
import 'package:billiards/pages/round_turn/round_turn_translations.dart';
import 'package:billiards/widgets/controls/counter_control.dart';
import 'package:billiards/widgets/controls/toggle_control.dart';
import 'package:billiards/widgets/list/list.dart';
import 'package:billiards/widgets/list/item/list_item.dart';
import 'package:billiards/widgets/section/section_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class RoundTurnControls extends ConsumerWidget {
  const RoundTurnControls({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(roundTurnStateProvider);
    final manager = ref.read(roundTurnManagerProvider);

    return SectionContainer(
        title: RoundTurnTranslations.gameControls.tr,
        children: [
          ListWidget(
            items: [
              ListItem(children: [
                CounterControl(
                  label: RoundTurnTranslations.currentBalls.tr,
                  icon: Icons.add_circle_outline,
                  value: state.currentBalls,
                  onIncrement: () => manager.incrementCurrentBall(),
                  onDecrement: () => manager.decrementCurrentBall(),
                ),
              ]),
              ListItem(children: [
                CounterControl(
                  label: RoundTurnTranslations.randomBalls.tr,
                  icon: Icons.casino_outlined,
                  value: state.randomBalls,
                  onIncrement: () => manager.incrementRandomBall(),
                  onDecrement: () => manager.decrementRandomBall(),
                ),
              ]),
              ListItem(children: [
                CounterControl(
                  label: RoundTurnTranslations.enemyBalls.tr,
                  icon: Icons.person_outline,
                  value: state.enemyBalls,
                  onIncrement: () => manager.incrementEnemyBall(),
                  onDecrement: () => manager.decrementEnemyBall(),
                ),
              ]),
              ListItem(children: [
                ToggleControl(
                  label: RoundTurnTranslations.whiteBall.tr,
                  icon: Icons.circle_outlined,
                  isSelected: state.whiteBall,
                  onToggle: () => manager.toggleWhiteBall(),
                ),
              ]),
              ListItem(children: [
                ToggleControl(
                  label: RoundTurnTranslations.blackBall.tr,
                  icon: Icons.circle,
                  isSelected: state.blackBall,
                  onToggle: () => manager.toggleBlackBall(),
                ),
              ]),
              ListItem(children: [
                ToggleControl(
                  label: RoundTurnTranslations.tableExit.tr,
                  icon: Icons.exit_to_app,
                  isSelected: state.tableExit,
                  onToggle: () => manager.toggleTableExit(),
                ),
              ]),
              ListItem(children: [
                ToggleControl(
                  label: RoundTurnTranslations.touchBall.tr,
                  icon: Icons.touch_app,
                  isSelected: state.touchBall,
                  onToggle: () => manager.toggleTouchBall(),
                ),
              ]),
            ],
          )
        ]);
  }
}
