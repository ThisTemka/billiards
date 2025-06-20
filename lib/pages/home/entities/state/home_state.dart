import 'package:riverpod/riverpod.dart';

final homeStateProvider = StateProvider<HomeState>((ref) {
  return HomeState();
});

class HomeState {
  final bool isLoading;
  final bool? hasUnfinishedMatch;

  HomeState({this.isLoading = true, this.hasUnfinishedMatch});

  HomeState copyWith({bool? isLoading, bool? hasUnfinishedMatch}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      hasUnfinishedMatch: hasUnfinishedMatch ?? this.hasUnfinishedMatch,
    );
  }
}
