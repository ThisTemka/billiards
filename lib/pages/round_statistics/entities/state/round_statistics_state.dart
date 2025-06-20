import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:riverpod/riverpod.dart';

final roundStatisticsStateProvider =
    StateProvider.autoDispose((ref) => const RoundStatisticsState());

class RoundStatisticsState {
  final bool isLoading;
  final IRound? round;

  const RoundStatisticsState({
    this.round,
    this.isLoading = true,
  });

  RoundStatisticsState copyWith({
    bool? isLoading,
    IRound? round,
  }) {
    return RoundStatisticsState(
      isLoading: isLoading ?? this.isLoading,
      round: round ?? this.round,
    );
  }
}
