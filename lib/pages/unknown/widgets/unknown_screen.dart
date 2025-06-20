import 'package:billiards/pages/unknown/unknown_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/blocks/screen/screen.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';
import 'package:get/get.dart';

class UnknownScreen extends ConsumerWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenWidget(
      header: ScreenHeader(
        title: UnknownTranslations.unknownPage.tr,
        isAnimated: true,
      ),
      content: Center(
        child: Text(UnknownTranslations.unknownPageDescription.tr),
      ),
    );
  }
}
