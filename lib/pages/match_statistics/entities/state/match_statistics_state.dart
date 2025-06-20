import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchStatisticsStateProvider =
    StateProvider.autoDispose((ref) => const MatchStatisticsState());

class MatchStatisticsState {
  final bool isLoading;
  final IMatch? match;

  const MatchStatisticsState({
    this.match,
    this.isLoading = true,
  });

  MatchStatisticsState copyWith({
    bool? isLoading,
    IMatch? match,
  }) {
    return MatchStatisticsState(
      match: match ?? this.match,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
