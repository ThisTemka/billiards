import 'package:billiards/pages/left_matches/left_matches_translations.dart';
import 'package:billiards/widgets/action/action.dart';
import 'package:billiards/widgets/container/container.dart';
import 'package:billiards/widgets/container/container_body.dart';
import 'package:billiards/widgets/container/container_type.dart';
import 'package:billiards/widgets/container/footer/container_footer.dart';
import 'package:billiards/widgets/container/footer/container_footer_type.dart';
import 'package:billiards/widgets/container/header/container_header.dart';
import 'package:billiards/widgets/container/header/container_header_type.dart';
import 'package:billiards/widgets/flex/flex.dart';
import 'package:billiards/widgets/flex/flex_type.dart';
import 'package:billiards/widgets/flex/item/flex_item.dart';
import 'package:billiards/widgets/flex/item/flex_item_type.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/group/group_type.dart';
import 'package:billiards/widgets/text/text.dart';
import 'package:billiards/widgets/text/text_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/widgets/title/player_title.dart';

class LeftMatchesCard extends ConsumerWidget {
  final IMatch match;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const LeftMatchesCard({
    super.key,
    required this.match,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContainerWidget(
      onTap: () => onTap(),
      header: ContainerHeader(
        type: ContainerHeaderType.card,
        title: DateFormat('dd.MM.yyyy HH:mm').format(match.start),
        actions: [
          ActionWidget(
            icon: Icons.delete,
            onPressed: onDelete,
          ),
        ],
      ),
      body: ContainerBody(
        child: FlexWidget(
          type: FlexType.row,
          items: [
            FlexItem(
              type: FlexItemType.expanded,
              child: PlayerTitle(
                playerName: match.users[0].name,
                score: match.firstPlayerWins,
                isWinner: match.firstPlayerWins > match.secondPlayerWins,
              ),
            ),
            FlexItem(
              child: TextWidget(
                data: LeftMatchesTranslations.vs.tr,
                type: TextType.largeTitle,
              ),
            ),
            FlexItem(
              type: FlexItemType.expanded,
              child: PlayerTitle(
                playerName: match.users[1].name,
                score: match.secondPlayerWins,
                isWinner: match.secondPlayerWins > match.firstPlayerWins,
              ),
            ),
          ],
        ),
      ),
      footer: ContainerFooter(
        type: ContainerFooterType.card,
        child: GroupWidget(
          type: GroupType.card,
          children: [
            ContainerWidget(
              type: ContainerType.text,
              body: ContainerBody(
                child: TextWidget(
                  data:
                      '${match.rounds.length} ${LeftMatchesTranslations.rounds.tr}',
                  type: TextType.mediumLabel,
                ),
              ),
            ),
            ContainerWidget(
              type: ContainerType.subtext,
              body: ContainerBody(
                child: TextWidget(
                  data:
                      '${LeftMatchesTranslations.winner.tr}: ${match.firstPlayerWins > match.secondPlayerWins ? match.users[0].name : match.users[1].name}',
                  type: TextType.mediumLabel,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
