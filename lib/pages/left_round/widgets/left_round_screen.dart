import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:billiards/pages/left_round/left_round_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/blocks/screen/screen.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';
import 'package:get/get.dart';

class LeftRoundScreen extends ConsumerWidget {
  final ScreenContent content;

  const LeftRoundScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenWidget(
      header: ScreenHeader(
        title: LeftRoundTranslations.leftRound.tr,
        isAnimated: true,
      ),
      content: content,
    );
  }
}
