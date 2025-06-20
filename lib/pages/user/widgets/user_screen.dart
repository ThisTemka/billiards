import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/user/widgets/user_page_header.dart';
import 'package:billiards/blocks/screen/screen.dart';

class UserScreen extends ConsumerWidget {
  final Widget content;

  const UserScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenWidget(
      header: UserPageHeader(),
      content: content,
    );
  }
}
