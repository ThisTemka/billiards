import 'package:billiards/entities/settings/entity/i_settings.dart';
import 'package:billiards/entities/settings/entity/settings.dart';
import 'package:billiards/entities/settings/repository/settings_repository.dart';
import 'package:billiards/services/store/main/services/use/providered_wrapper/i_providered_use_store_service_wrapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final toolingSettingsRepositoryProvider =
    Provider.autoDispose<IToolingSettingsRepository>((ref) {
  final store = ref.watch(provideredUseStoreServiceProvider);
  final repository = store.getProvideredRepository<Settings>(ref);
  return SettingsRepository(repository);
});

abstract interface class IToolingSettingsRepository {
  Future<bool> has();
  Future<int> add(ISettings settings);
  Future<int> reset();
}
