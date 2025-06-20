import 'package:billiards/entities/settings/entity/i_settings.dart';
import 'package:billiards/entities/settings/repository/i_settings_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<int> seedSettingsRepository(Ref ref) async {
  final repository = ref.read(settingsRepositoryProvider);
  final settings = await repository.get();
  final newSettings = _update(settings);
  return await repository.update(newSettings);
}

ISettings _update(ISettings settings) {
  final newSettings = settings.copyWith();
  return newSettings;
}
