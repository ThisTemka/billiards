import 'package:billiards/pages/round_select_turn/entities/state/round_select_turn_state.dart';
import 'package:billiards/pages/round_select_turn/managers/i_round_select_turn_manager.dart';
import 'package:billiards/pages/round_select_turn/round_select_turn_translations.dart';
import 'package:billiards/widgets/list/list.dart';
import 'package:billiards/widgets/list/item/list_item.dart';
import 'package:billiards/blocks/screen/page_action.dart';
import 'package:billiards/widgets/section/section_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class RoundSelectTurnSelectTurn extends ConsumerWidget {
  const RoundSelectTurnSelectTurn({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(roundSelectTurnStateProvider);
    final manager = ref.read(roundSelectTurnManagerProvider);
    return SectionContainer(
        title: RoundSelectTurnTranslations.selectPlayerTurn.tr,
        children: [
          ListWidget(
              items: state.players.asMap().entries.map((entry) {
            final index = entry.key;
            final player = entry.value;
            return ListItem(index: index, children: [
              PageAction(
                label: player.user.name,
                icon: Icons.person,
                onPressed: () => manager.selectPlayer(player),
              )
            ]);
          }).toList())
        ]);
  }
}
