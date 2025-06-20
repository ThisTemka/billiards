import 'package:billiards/core/settings.dart';
import 'package:billiards/entities/settings/entity/i_settings_factory.dart';
import 'package:billiards/entities/settings/repository/i_tooling_settings_repository.dart';
import 'package:billiards/entities/settings/repository/seed_settings_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<void> toolSettingsRepository(Ref ref) async {
  final isClear = ref.read(isClearProvider);
  final isSeeding = ref.read(isSeedingProvider);

  final repository = ref.read(toolingSettingsRepositoryProvider);
  final hasEntity = await repository.has();

  if (!hasEntity) {
    final factory = ref.read(settingsFactoryProvider);
    final entity = factory();
    await repository.add(entity);
  }

  if (isClear) {
    await repository.reset();
  }

  if (isSeeding) {
    await seedSettingsRepository(ref);
  }
}
