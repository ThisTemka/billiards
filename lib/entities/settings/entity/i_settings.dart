import 'package:billiards/services/store/main/services/use/i_entity.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';

abstract interface class ISettings implements IEntity {
  ThemeType get theme;
  LanguageType get language;

  ISettings copyWith({
    ThemeType? theme,
    LanguageType? language,
  });
}
