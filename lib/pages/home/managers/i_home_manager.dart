import 'package:billiards/pages/home/managers/home_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeManagerProvider =
    Provider.autoDispose<IHomeManager>((ref) => HomeManager(ref));

abstract interface class IHomeManager {
  Future<void> startNewGame();
  Future<void> loadState();
  Future<void> continueMatch();
  void navigateToLeftMatches();
  void navigateToSettings();
  void navigateToUsers();
}
