import 'package:billiards/core/settings.dart';
import 'package:billiards/entities/game_state/entity/i_game_state_factory.dart';
import 'package:billiards/entities/game_state/repository/i_tooling_game_state_repository.dart';
import 'package:billiards/entities/game_state/repository/seed_game_state_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<void> toolGameStateRepository(Ref ref) async {
  final isClear = ref.read(isClearProvider);
  final isSeeding = ref.read(isSeedingProvider);

  final repository = ref.read(toolingGameStateRepositoryProvider);

  if (await repository.has()) {
    final factory = ref.read(gameStateFactoryProvider);
    final entity = factory();
    await repository.add(entity);
  }

  if (isClear) {
    await repository.reset();
  }

  if (isSeeding) {
    await seedGameStateRepository(ref);
  }
}
