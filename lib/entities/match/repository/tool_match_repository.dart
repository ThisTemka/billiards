import 'package:billiards/core/settings.dart';
import 'package:billiards/entities/match/repository/i_match_repository.dart';
import 'package:billiards/entities/match/repository/seed_match_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<void> toolMatchRepository(Ref ref) async {
  final isClear = ref.read(isClearProvider);
  final isSeeding = ref.read(isSeedingProvider);

  if (isClear || isSeeding) {
    final matchRepository = ref.read(matchRepositoryProvider);
    await matchRepository.clear();
  }

  if (isSeeding) {
    await seedMatchRepository(ref);
  }
}
