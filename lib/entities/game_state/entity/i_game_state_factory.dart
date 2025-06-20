import 'package:billiards/entities/game_state/entity/game_state.dart';
import 'package:billiards/entities/game_state/entity/game_status.dart';
import 'package:billiards/entities/game_state/entity/i_game_state.dart';
import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:riverpod/riverpod.dart';

final gameStateFactoryProvider = Provider.autoDispose<IGameStateFactory>((ref) {
  return GameState.create;
});

typedef IGameStateFactory = IGameState Function({
  IMatch? currentMatch,
  IRound? currentRound,
  IPlayer? currentPlayer,
  GameStatus gameStatus,
});
