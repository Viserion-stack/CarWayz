import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/screens/add/provider/add_state.dart';

final addProvider = StateNotifierProvider<AddNotifier, AddState>(
  (ref) => AddNotifier(const AddState.initial()),
);

class AddNotifier extends StateNotifier<AddState> {
  AddNotifier(super.state);

  void setImage({required String image}) {
    debugPrint('set');
    state = state.copyWith(imagePath: image);
  }
}
