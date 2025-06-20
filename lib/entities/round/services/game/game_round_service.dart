import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/round/entity/i_round_factory.dart';
import 'package:billiards/entities/round/repository/i_round_repository.dart';
import 'package:billiards/entities/round/services/game/i_game_round_service.dart';
import 'package:riverpod/riverpod.dart';

class GameRoundService implements IGameRoundService {
  final Ref ref;
  final IRoundRepository repository;

  GameRoundService(this.ref, this.repository);

  IRoundFactory get factory => ref.read(roundFactoryProvider);
  Future<void> update(IRound round) async => await repository.update(round);

  @override
  Future<IRound> startRound(List<IPlayer> players) async {
    final round = factory(players: players, start: DateTime.now());
    await repository.add(round);
    return round;
  }

  @override
  Future<void> endRound(IRound round) async {
    await update(round.copyWith(end: DateTime.now()));
  }
}
