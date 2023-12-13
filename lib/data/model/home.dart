import 'package:car_wayz/presentation/common/state_type.dart';

class Home {
  final String name;
  final StateType state;
  Home({
    required this.name,
    required this.state,
  });

  const Home.initial()
      : name = 'dziś',
        state = StateType.loading;

  Home copyWith({
    String? name,
    StateType? state,
  }) {
    return Home(
      name: name ?? this.name,
      state: state ?? this.state,
    );
  }

  @override
  String toString() => 'Home(name: $name, state: $state)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Home && other.name == name && other.state == state;
  }

  @override
  int get hashCode => name.hashCode ^ state.hashCode;
}
