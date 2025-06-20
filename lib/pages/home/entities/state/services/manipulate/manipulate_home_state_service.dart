import 'package:billiards/pages/home/entities/state/services/manipulate/i_manipulate_home_state_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/home/entities/state/home_state.dart';

class ManipulateStateHomeService implements IManipulateStateHomeService {
  final Ref ref;

  ManipulateStateHomeService(this.ref);

  void setState(HomeState state) =>
      ref.read(homeStateProvider.notifier).state = state;
  HomeState get state => ref.read(homeStateProvider);

  @override
  void initializeState(bool hasUnfinishedMatch) async {
    setState(state.copyWith(
        hasUnfinishedMatch: hasUnfinishedMatch, isLoading: false));
  }
}
