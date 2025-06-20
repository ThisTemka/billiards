import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersTranslationsProvider =
    Provider.autoDispose((ref) => UsersTranslations());

class UsersTranslations {
  static const String listUsersTitle = 'users';
  static const String listHasntUsers = 'no_users';
  static const String screenTitle = 'users';
}
