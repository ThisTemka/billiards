import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:riverpod/riverpod.dart';

final leftRoundStateProvider = StateProvider.autoDispose<LeftRoundState>(
  (ref) => LeftRoundState(),
);

class LeftRoundState {
  final bool isLoading;
  final IRound? round;
  final int? roundIndex;

  const LeftRoundState({
    this.isLoading = true,
    this.round,
    this.roundIndex,
  });

  LeftRoundState copyWith({
    bool? isLoading,
    IRound? round,
    int? roundIndex,
  }) {
    return LeftRoundState(
      isLoading: isLoading ?? this.isLoading,
      round: round ?? this.round,
      roundIndex: roundIndex ?? this.roundIndex,
    );
  }
}
