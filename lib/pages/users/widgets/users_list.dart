import 'package:billiards/pages/users/entities/state/users_state.dart';
import 'package:billiards/pages/users/users_translations.dart';
import 'package:billiards/pages/users/widgets/users_item.dart';
import 'package:billiards/widgets/list/list.dart';
import 'package:billiards/widgets/list/item/list_item.dart';
import 'package:billiards/widgets/section/section_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersList extends ConsumerWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersStateProvider).users;

    return SectionContainer(title: UsersTranslations.listUsersTitle, children: [
      ListWidget(
        emptyText: UsersTranslations.listHasntUsers,
        items: users.asMap().entries.map((entry) {
          final index = entry.key;
          final user = entry.value;
          return ListItem(index: index, children: [
            UsersItem(
              user: user,
              index: index,
            )
          ]);
        }).toList(),
      ),
    ]);
  }
}
