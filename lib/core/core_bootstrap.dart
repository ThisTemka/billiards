import 'package:billiards/entities/game_state/repository/tool_game_state_repository.dart';
import 'package:billiards/entities/match/repository/tool_match_repository.dart';
import 'package:billiards/entities/player/repository/tool_player_repository.dart';
import 'package:billiards/entities/round/repository/tool_round_repository.dart';
import 'package:billiards/entities/settings/repository/tool_settings_repository.dart';
import 'package:billiards/entities/user/repository/tool_user_repository.dart';
import 'package:billiards/services/notification/entity/tool_notifiction_service.dart';
import 'package:billiards/services/store/objectbox/entity/tool_objectbox_store_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coreBootstrapProvider = FutureProvider((ref) async {
  await toolObjectboxStoreService(ref);
  await ref.watch(repositoriesFutureProvider.future);
  await toolNotificationService(ref);
});

final repositoriesFutureProvider = FutureProvider((ref) async {
  await toolUserRepository(ref);
  await toolGameStateRepository(ref);
  await toolSettingsRepository(ref);
  await toolPlayerRepository(ref);
  await toolRoundRepository(ref);
  await toolMatchRepository(ref);
});
