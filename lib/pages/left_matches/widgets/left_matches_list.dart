import 'package:billiards/pages/left_matches/entities/state/left_matches_state.dart';
import 'package:billiards/pages/left_matches/left_matches_translations.dart';
import 'package:billiards/pages/left_matches/managers/i_left_matches_manager.dart';
import 'package:billiards/pages/left_matches/widgets/left_matches_card.dart';
import 'package:billiards/widgets/container/container.dart';
import 'package:billiards/widgets/container/container_body.dart';
import 'package:billiards/widgets/container/header/container_header.dart';
import 'package:billiards/widgets/list/list.dart';
import 'package:billiards/widgets/list/item/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class LeftMatchesList extends ConsumerWidget {
  const LeftMatchesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(leftMatchesStateProvider);
    final manager = ref.read(leftMatchesManagerProvider);
    return ContainerWidget(
      header: ContainerHeader(
        title: LeftMatchesTranslations.leftMatches.tr,
      ),
      body: ContainerBody(
        child: ListWidget(
          emptyText: LeftMatchesTranslations.noMatches.tr,
          items: state.matches,
          builder: (match, index) => ListItem(
            child: LeftMatchesCard(
              match: match,
              onDelete: () => manager.deleteMatch(match),
              onTap: () => manager.openMatch(match),
            ),
          ),
        ),
      ),
    );
  }
}
