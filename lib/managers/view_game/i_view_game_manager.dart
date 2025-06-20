import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/managers/view_game/view_game_manager.dart';
import 'package:riverpod/riverpod.dart';

final viewGameManagerProvider = Provider.autoDispose<IViewGameManager>((ref) {
  return ViewGameManager(ref);
});

abstract interface class IViewGameManager {
  Future<IRound?> getCurrentRound();
  Future<IMatch?> getCurrentMatch();
  Future<IPlayer?> getCurrentPlayer();
  Future<bool> hasUnfinishedMatch();
  Future<bool> hasCurrentPlayer();
}
