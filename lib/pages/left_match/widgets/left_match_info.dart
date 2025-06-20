import 'package:billiards/pages/left_match/left_match_translations.dart';
import 'package:billiards/widgets/container/container.dart';
import 'package:billiards/widgets/container/container_body.dart';
import 'package:billiards/widgets/container/header/container_header.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/text/text.dart';
import 'package:billiards/widgets/text/text_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class LeftMatchInfo extends ConsumerWidget {
  final String firstPlayerName;
  final String secondPlayerName;
  final DateTime start;
  final DateTime? end;

  const LeftMatchInfo({
    super.key,
    required this.firstPlayerName,
    required this.secondPlayerName,
    required this.start,
    this.end,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContainerWidget(
      header: ContainerHeader(
        title: LeftMatchTranslations.leftMatchInfoTitle.tr,
      ),
      body: ContainerBody(
        child: GroupWidget(
          children: [
            ContainerWidget(
              header: ContainerHeader(
                title: LeftMatchTranslations.players.tr,
              ),
              body: ContainerBody(
                child: TextWidget(
                  data:
                      '$firstPlayerName ${LeftMatchTranslations.vs.tr} $secondPlayerName',
                  type: TextType.mediumBody,
                ),
              ),
            ),
            ContainerWidget(
              header: ContainerHeader(
                title: LeftMatchTranslations.startDate.tr,
              ),
              body: ContainerBody(
                child: TextWidget(
                  data: '${start.day}.${start.month}.${start.year}',
                  type: TextType.mediumBody,
                ),
              ),
            ),
            if (end != null)
              ContainerWidget(
                header: ContainerHeader(
                  title: LeftMatchTranslations.endDate.tr,
                ),
                body: ContainerBody(
                  child: TextWidget(
                    data: '${end!.day}.${end!.month}.${end!.year}',
                    type: TextType.mediumBody,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
