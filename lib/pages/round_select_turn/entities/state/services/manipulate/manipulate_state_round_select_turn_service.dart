import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/pages/round_select_turn/entities/state/round_select_turn_state.dart';
import 'package:billiards/pages/round_select_turn/entities/state/services/manipulate/i_manipulate_state_round_select_turn_service.dart';
import 'package:riverpod/riverpod.dart';

class ManipulateStateRoundSelectTurnService
    implements IManipulateStateRoundSelectTurnService {
  final Ref ref;

  ManipulateStateRoundSelectTurnService(this.ref);

  void setState(RoundSelectTurnState state) =>
      ref.read(roundSelectTurnStateProvider.notifier).state = state;
  RoundSelectTurnState get state => ref.read(roundSelectTurnStateProvider);

  @override
  void initializeState(List<IPlayer> players) {
    setState(state.copyWith(
      players: players,
      isLoading: false,
    ));
  }
}
