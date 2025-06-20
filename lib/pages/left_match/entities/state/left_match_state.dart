import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leftMatchStateProvider = StateProvider<LeftMatchState>(
  (ref) => LeftMatchState(),
);

class LeftMatchState {
  final bool isLoading;
  final IMatch? match;

  const LeftMatchState({
    this.match,
    this.isLoading = true,
  });

  LeftMatchState copyWith({
    bool? isLoading,
    IMatch? match,
  }) {
    return LeftMatchState(
      match: match ?? this.match,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
