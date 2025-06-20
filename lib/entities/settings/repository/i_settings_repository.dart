import 'package:billiards/entities/settings/entity/i_settings.dart';
import 'package:billiards/entities/settings/entity/settings.dart';
import 'package:billiards/entities/settings/repository/settings_repository.dart';
import 'package:billiards/services/store/main/services/use/providered_wrapper/i_providered_use_store_service_wrapper.dart';
import 'package:riverpod/riverpod.dart';

final settingsRepositoryProvider =
    Provider.autoDispose<ISettingsRepository>((ref) {
  final store = ref.watch(provideredUseStoreServiceProvider);
  final repository = store.getProvideredRepository<Settings>(ref);
  return SettingsRepository(repository);
});

abstract interface class ISettingsRepository {
  Future<ISettings> get();
  Future<int> update(ISettings settings);
  Future<int> reset();
}
