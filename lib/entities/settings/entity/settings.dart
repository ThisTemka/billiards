import 'package:billiards/entities/settings/entity/i_settings.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:get/get.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Settings implements ISettings {
  @override
  late int id;

  @override
  @Transient()
  ThemeType get theme => ThemeType.values[themeId];
  final int themeId;

  @override
  @Transient()
  LanguageType get language => LanguageType.values[languageId];
  final int languageId;

  Settings({
    required this.id,
    required this.themeId,
    required this.languageId,
  });

  Settings.create({
    this.id = 0,
    ThemeType? theme,
    LanguageType? language,
  })  : themeId = theme?.index ??
            (Get.isPlatformDarkMode ? ThemeType.dark : ThemeType.light).index,
        languageId = language?.index ?? LanguageType.en.index;

  @override
  ISettings copyWith({
    ThemeType? theme,
    LanguageType? language,
  }) {
    return Settings.create(
      id: id,
      theme: theme ?? this.theme,
      language: language ?? this.language,
    );
  }
}
