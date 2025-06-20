import 'package:billiards/core/settings.dart';
import 'package:billiards/entities/user/repository/i_user_repository.dart';
import 'package:billiards/entities/user/repository/seed_user_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<void> toolUserRepository(Ref ref) async {
  final isClear = ref.read(isClearProvider);
  final isSeeding = ref.read(isSeedingProvider);

  if (isClear || isSeeding) {
    final userRepository = ref.read(userRepositoryProvider);
    await userRepository.clear();
  }

  if (isSeeding) {
    await seedUserRepository(ref);
  }
}
