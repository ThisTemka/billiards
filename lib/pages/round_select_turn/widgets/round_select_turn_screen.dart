import 'package:billiards/pages/round_select_turn/round_select_turn_translations.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/blocks/screen/screen.dart';
import 'package:get/get.dart';

class RoundSelectTurnScreen extends ConsumerWidget {
  final Widget content;

  const RoundSelectTurnScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenWidget(
      header: ScreenHeader(
        title: RoundSelectTurnTranslations.selectPlayerTurnTitle.tr,
        isAnimated: true,
      ),
      content: content,
    );
  }
}
