import 'package:billiards/pages/home/services/communicate_to_managers/communicate_to_managers_home_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communicateToManagersHomeServiceProvider =
    Provider.autoDispose<ICommunicateToManagersHomeService>(
        (ref) => CommunicateToManagersHomeService(ref));

abstract interface class ICommunicateToManagersHomeService {
  Future<void> closeMatch();
  Future<bool> hasUnfinishedMatch();
  Future<bool> hasCurrentPlayer();
}
