import 'package:billiards/entities/settings/entity/i_settings.dart';
import 'package:billiards/entities/settings/entity/settings.dart';
import 'package:riverpod/riverpod.dart';

final settingsFactoryProvider = Provider.autoDispose<ISettingsFactory>((ref) {
  return Settings.create;
});

typedef ISettingsFactory = ISettings Function();
