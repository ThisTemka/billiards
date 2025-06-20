import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leftMatchesStateProvider = StateProvider<LeftMatchesState>((ref) {
  return LeftMatchesState();
});

class LeftMatchesState {
  final bool isLoading;
  final List<IMatch> matches;

  const LeftMatchesState({
    this.matches = const [],
    this.isLoading = true,
  });

  LeftMatchesState copyWith({
    List<IMatch>? matches,
    bool? isLoading,
  }) {
    return LeftMatchesState(
      matches: matches ?? this.matches,
    );
  }
}
