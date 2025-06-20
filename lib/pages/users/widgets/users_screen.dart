import 'package:billiards/pages/users/users_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/blocks/screen/screen.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';

class UsersScreen extends ConsumerWidget {
  final Widget content;

  const UsersScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenWidget(
      header: ScreenHeader(
        title: UsersTranslations.screenTitle,
        isAnimated: true,
      ),
      content: content,
    );
  }
}
