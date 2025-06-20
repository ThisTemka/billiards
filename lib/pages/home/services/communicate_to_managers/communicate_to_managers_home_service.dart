import 'package:billiards/managers/manipulate_game/i_manipulate_game_manager.dart';
import 'package:billiards/managers/view_game/i_view_game_manager.dart';
import 'package:billiards/pages/home/services/communicate_to_managers/i_communicate_to_managers_home_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunicateToManagersHomeService
    implements ICommunicateToManagersHomeService {
  final Ref _ref;

  CommunicateToManagersHomeService(this._ref);

  IManipulateGameManager get manipulateGameManager =>
      _ref.read(manipulateGameManagerProvider);

  IViewGameManager get viewGameManager => _ref.watch(viewGameManagerProvider);

  @override
  Future<void> closeMatch() async {
    manipulateGameManager.closeMatch();
  }

  @override
  Future<bool> hasUnfinishedMatch() async {
    return await viewGameManager.hasUnfinishedMatch();
  }

  @override
  Future<bool> hasCurrentPlayer() async {
    return await viewGameManager.hasCurrentPlayer();
  }
}
