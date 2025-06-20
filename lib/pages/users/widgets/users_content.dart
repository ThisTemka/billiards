import 'package:billiards/pages/users/widgets/users_list.dart';
import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersContent extends ConsumerWidget {
  const UsersContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenContent(
      child: [UsersList()],
    );
  }
}
