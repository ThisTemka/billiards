import 'package:billiards/entities/player/repository/i_player_repository.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/round/entity/i_round_factory.dart';
import 'package:billiards/entities/round/repository/i_round_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<List<int>> seedRoundRepository(Ref ref) async {
  final repository = ref.read(roundRepositoryProvider);
  final rounds = await _create(ref);
  return repository.addAll(rounds);
}

Future<List<IRound>> _create(Ref ref) async {
  final factory = ref.read(roundFactoryProvider);
  final players = await ref.read(playerRepositoryProvider).getAll();

  return [
    factory(
      players: [
        players[0],
        players[1],
      ],
      start: DateTime.now(),
    ).copyWith(end: DateTime.now().add(Duration(minutes: 10))),
  ];
}
