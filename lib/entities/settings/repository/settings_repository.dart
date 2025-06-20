import 'package:billiards/entities/settings/entity/i_settings.dart';
import 'package:billiards/entities/settings/repository/i_settings_repository.dart';
import 'package:billiards/entities/settings/repository/i_tooling_settings_repository.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:get/get.dart';

class SettingsRepository
    implements ISettingsRepository, IToolingSettingsRepository {
  final IRepository<ISettings> _repository;

  SettingsRepository(this._repository);

  @override
  Future<bool> has() async => (await _repository.getAll()).isNotEmpty;

  @override
  Future<int> add(ISettings settings) => _repository.add(settings);

  @override
  Future<ISettings> get() async {
    return (await _repository.getAll()).first;
  }

  @override
  Future<int> update(ISettings settings) async =>
      await _repository.update(settings);

  @override
  Future<int> reset() async {
    final entity = await get();
    final resetedEntity = entity.copyWith(
      theme: Get.isPlatformDarkMode ? ThemeType.dark : ThemeType.light,
      language: LanguageType.fromLocale(Get.deviceLocale!),
    );
    return await update(resetedEntity);
  }
}
