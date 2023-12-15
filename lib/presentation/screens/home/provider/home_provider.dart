import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common/state_type.dart';
import 'package:car_wayz/presentation/screens/home/provider/home_state.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) {
    return HomeNotifier(const HomeState.initial());
  },
);

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(super.state);

  void changeName() {
    String name = '';
    if (state.name == 'dziś') {
      name = 'jutro';
    }
    state = state.copyWith(state: StateType.loading, name: name);
  }

  Future<void> fetchData() async {
    Future.delayed(const Duration(seconds: 2), () {
      debugPrint('Future ');
    });
  }
}
