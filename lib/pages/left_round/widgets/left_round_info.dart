import 'package:billiards/pages/left_round/entities/state/left_round_state.dart';
import 'package:billiards/pages/left_round/left_round_translations.dart';
import 'package:billiards/pages/left_round/managers/i_left_round_manager.dart';
import 'package:billiards/widgets/action/action.dart';
import 'package:billiards/widgets/flex/flex.dart';
import 'package:billiards/widgets/flex/flex_type.dart';
import 'package:billiards/widgets/flex/item/flex_item.dart';
import 'package:billiards/widgets/flex/item/flex_item_type.dart';
import 'package:billiards/widgets/text/text.dart';
import 'package:billiards/widgets/text/text_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class LeftRoundInfo extends ConsumerWidget {
  const LeftRoundInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(leftRoundStateProvider);
    final manager = ref.read(leftRoundManagerProvider);

    return FlexWidget(
      type: FlexType.card,
      items: [
        FlexItem(
          child: ActionWidget(
            onPressed: () => manager.navigateToBack(),
            icon: Icons.arrow_back,
          ),
        ),
        FlexItem(
          type: FlexItemType.expanded,
          child: TextWidget(
            data: '${LeftRoundTranslations.round.tr} ${state.roundIndex! + 1}',
            type: TextType.mediumTitle,
          ),
        ),
      ],
    );
  }
}
