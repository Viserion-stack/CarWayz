class AddState {
  final String imagePath;

  AddState({
    required this.imagePath,
  });

  const AddState.initial() : imagePath = "";

  AddState copyWith({
    String? imagePath,
  }) {
    return AddState(
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
