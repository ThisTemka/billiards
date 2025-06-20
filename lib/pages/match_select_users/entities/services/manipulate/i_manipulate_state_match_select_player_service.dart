import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/match_select_users/entities/services/manipulate/manipulate_state_match_select_player_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateStateMatchSelectPlayerServiceProvider =
    Provider.autoDispose<IManipulateStateMatchSelectPlayerService>(
        (ref) => ManipulateStateMatchSelectPlayerService(ref));

abstract interface class IManipulateStateMatchSelectPlayerService {
  void initializeState(List<IUser> users);
  void focusUserInput(bool focused, int userIndex);
  void selectUser(IUser user, int userIndex);
  void filterUsers(String query);
  IUser? getUser(String query);
  void clearFilteredUsers();
}
