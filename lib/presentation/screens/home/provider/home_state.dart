import 'package:car_wayz/presentation/common/state_type.dart';

class HomeState {
  final String name;
  final StateType state;

  HomeState({
    required this.name,
    required this.state,
  });

  const HomeState.initial()
      : name = 'dziś',
        state = StateType.loading;

  HomeState copyWith({
    String? name,
    StateType? state,
  }) {
    return HomeState(
      name: name ?? this.name,
      state: state ?? this.state,
    );
  }

  @override
  String toString() => 'Home(name: $name, state: $state)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState && other.name == name && other.state == state;
  }

  @override
  int get hashCode => name.hashCode ^ state.hashCode;
}
