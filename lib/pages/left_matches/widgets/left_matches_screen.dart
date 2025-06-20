import 'package:billiards/pages/left_matches/left_matches_translations.dart';
import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/blocks/screen/screen.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';
import 'package:get/get.dart';

class LeftMatchesScreen extends ConsumerWidget {
  final ScreenContent content;

  const LeftMatchesScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenWidget(
      header: ScreenHeader(
        title: LeftMatchesTranslations.leftMatchesTitle.tr,
      ),
      content: content,
    );
  }
}
