import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/managers/manipulate_game/i_turn.dart';
import 'package:billiards/managers/manipulate_game/manipulate_game_manager.dart';
import 'package:riverpod/riverpod.dart';

final manipulateGameManagerProvider =
    Provider.autoDispose<IManipulateGameManager>((ref) {
  return ManipulateGameManager(ref);
});

abstract interface class IManipulateGameManager {
  Future<void> openMatch(List<IUser> users);
  Future<void> openRound();
  Future<void> nextRound();
  Future<void> selectPlayer(IPlayer player);
  Future<void> completeTurn(ITurn turn);
  Future<void> closeRound();
  Future<void> closeMatch();
}
