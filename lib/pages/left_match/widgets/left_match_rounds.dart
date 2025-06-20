import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/left_match/left_match_translations.dart';
import 'package:billiards/pages/left_match/managers/i_left_match_manager.dart';
import 'package:billiards/widgets/container/container.dart';
import 'package:billiards/widgets/container/container_body.dart';
import 'package:billiards/widgets/container/header/container_header.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/group/group_type.dart';
import 'package:billiards/widgets/list/item/list_item_type.dart';
import 'package:billiards/widgets/list/list.dart';
import 'package:billiards/widgets/list/item/list_item.dart';
import 'package:billiards/widgets/text/text.dart';
import 'package:billiards/widgets/text/text_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class LeftMatchRounds extends ConsumerWidget {
  final List<IRound> rounds;

  const LeftMatchRounds({super.key, required this.rounds});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(leftMatchManagerProvider);

    return ContainerWidget(
      header: ContainerHeader(
        title: LeftMatchTranslations.rounds.tr,
      ),
      body: ContainerBody(
        child: ListWidget(
            emptyText: LeftMatchTranslations.noRounds.tr,
            items: rounds,
            builder: (round, int index) => ListItem(
                  onTap: () => manager.navigateToRound(round),
                  type: ListItemType.rounded,
                  child: GroupWidget(
                    type: GroupType.free,
                    children: [
                      TextWidget(
                        data: '${LeftMatchTranslations.round.tr} ${index + 1}',
                        type: TextType.smallBody,
                      ),
                      TextWidget(
                        data: '${round.start.hour}:${round.start.minute}',
                        type: TextType.smallBody,
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
