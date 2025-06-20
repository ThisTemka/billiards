import 'package:billiards/core/settings.dart';
import 'package:billiards/entities/round/repository/i_round_repository.dart';
import 'package:billiards/entities/round/repository/seed_round_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<void> toolRoundRepository(Ref ref) async {
  final isClear = ref.read(isClearProvider);
  final isSeeding = ref.read(isSeedingProvider);

  if (isClear || isSeeding) {
    final roundRepository = ref.read(roundRepositoryProvider);
    await roundRepository.clear();
  }

  if (isSeeding) {
    await seedRoundRepository(ref);
  }
}
