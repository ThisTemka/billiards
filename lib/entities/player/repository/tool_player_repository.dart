import 'package:billiards/core/settings.dart';
import 'package:billiards/entities/player/repository/i_player_repository.dart';
import 'package:billiards/entities/player/repository/seed_player_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<void> toolPlayerRepository(Ref ref) async {
  final isClear = ref.read(isClearProvider);
  final isSeeding = ref.read(isSeedingProvider);

  if (isClear || isSeeding) {
    final playerRepository = ref.read(playerRepositoryProvider);
    await playerRepository.clear();
  }

  if (isSeeding) {
    await seedPlayerRepository(ref);
  }
}
