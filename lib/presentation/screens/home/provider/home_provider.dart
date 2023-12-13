import 'package:car_wayz/export.dart';

import '../../../../data/model/home.dart';
import '../../../common/state_type.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, Home>((ref) {
  return HomeNotifier(const Home.initial());
});

class HomeNotifier extends StateNotifier<Home> {
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
      debugPrint('Future dokana');
    });
  }
}
