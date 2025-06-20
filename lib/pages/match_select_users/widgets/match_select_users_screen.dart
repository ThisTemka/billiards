import 'package:billiards/pages/match_select_users/match_select_users_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/blocks/screen/screen.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';
import 'package:get/get.dart';

class MatchSelectUsersScreen extends ConsumerWidget {
  final Widget content;

  const MatchSelectUsersScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenWidget(
      header: ScreenHeader(
        title: MatchSelectUsersTranslations.selectPlayersTitle.tr,
        isAnimated: true,
      ),
      content: content,
    );
  }
}
