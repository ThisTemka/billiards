import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/match_select_users/managers/match_select_users_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchSelectUsersManagerProvider =
    Provider.autoDispose<IMatchSelectUsersManager>(
        (ref) => MatchSelectUsersManager(ref));

abstract interface class IMatchSelectUsersManager {
  Future<void> startNewMatch();
  Future<void> createUser(String name, int userInputIndex);
  Future<void> loadState();
  void changeQuery(String query, int userInputIndex);
  void selectUser(IUser user, int userInputIndex);
  void focusUserInput(bool focused, int userInputIndex);
}
