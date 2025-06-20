import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roundSelectTurnStateProvider = StateProvider<RoundSelectTurnState>((ref) {
  return RoundSelectTurnState();
});

class RoundSelectTurnState {
  final bool isLoading;
  final List<IPlayer> players;

  RoundSelectTurnState({
    this.isLoading = true,
    this.players = const [],
  });

  RoundSelectTurnState copyWith({
    List<IPlayer>? players,
    bool? isLoading,
  }) {
    return RoundSelectTurnState(
      players: players ?? this.players,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
