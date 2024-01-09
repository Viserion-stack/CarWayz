import 'dart:io';

import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/screens/add/provider/add_provider.dart';

class AddPostScreen extends ConsumerWidget {
  static const routeName = '/add-post';

  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(addProvider);
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _PostImage(imagePath: state.imagePath),
                Gap.large,
                _DescriptionTextField(
                  onChanged: (value) {},
                ),
              ],
            ),
          );
        },
      ),
      extendBody: true,
      bottomNavigationBar: _ShareButton(
        onPressed: () => context.go(DashboardScreen.routeName),
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage({
    required this.imagePath,
  });

  final String imagePath;

  static const _imageHeight = 350.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _imageHeight,
      child: Image.file(
        File(imagePath),
        fit: BoxFit.fill,
      ),
    );
  }
}

class _ShareButton extends StatelessWidget {
  const _ShareButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  static const _buttonHorizontalPadding = 24.0;
  static const _buttonBotomPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: _buttonHorizontalPadding,
        right: _buttonHorizontalPadding,
        bottom: _buttonBotomPadding,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: context.palette.accentColor),
        child: Text(
          "Share",
          style: context.textTheme.displaySmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _DescriptionTextField extends StatelessWidget {
  const _DescriptionTextField({
    required this.onChanged,
  });

  final Function(String)? onChanged;

  static const _horizontalPadding = 10.0;
  static const _fieldBorderRadius = 12.0;
  static const _hintColorOpacity = 0.5;
  static const textFieldPadding = 24.0;
  static const _fieldMaxLines = 8;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: textFieldPadding),
      child: Container(
        padding: const EdgeInsets.only(
          right: _horizontalPadding,
          left: _horizontalPadding,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: context.palette.inactiveColor,
          ),
          borderRadius: BorderRadius.circular(_fieldBorderRadius),
        ),
        child: TextFormField(
          onChanged: onChanged,
          maxLines: _fieldMaxLines,
          cursorColor: context.palette.accentColor,
          style: context.textTheme.labelLarge
              ?.copyWith(color: context.palette.textOnPrimaryColor),
          showCursor: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Description',
            hintStyle: context.textTheme.labelLarge?.copyWith(
              color: context.palette.textOnPrimaryColor
                  .withOpacity(_hintColorOpacity),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
        ),
      ),
    );
  }
}
