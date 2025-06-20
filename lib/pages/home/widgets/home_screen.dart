import 'package:billiards/pages/home/home_translations.dart';
import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/blocks/screen/screen.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';
import 'package:get/get.dart';

class HomeScreen extends ConsumerWidget {
  final ScreenContent content;

  const HomeScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenWidget(
        header: ScreenHeader(
          title: HomeTranslations.homeTitle.tr,
          subtitle: HomeTranslations.homeSubtitle.tr,
        ),
        content: content);
  }
}
