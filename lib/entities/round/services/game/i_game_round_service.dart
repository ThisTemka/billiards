import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/round/repository/i_round_repository.dart';
import 'package:billiards/entities/round/services/game/game_round_service.dart';
import 'package:riverpod/riverpod.dart';

final gameRoundServiceProvider = Provider.autoDispose<IGameRoundService>((ref) {
  final repository = ref.read(roundRepositoryProvider);
  return GameRoundService(ref, repository);
});

abstract interface class IGameRoundService {
  Future<IRound> startRound(List<IPlayer> players);
  Future<void> endRound(IRound round);
}
