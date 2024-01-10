import 'package:car_wayz/export.dart';

class CarWayzInputField extends StatelessWidget {
  const CarWayzInputField({
    required this.label,
    this.onSaved,
    this.validator,
    this.isObscureText = false,
    super.key,
  });

  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String label;
  final bool isObscureText;

  static const _textInputRadius = 20.0;
  static const _errorTextFontSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Insets.small),
      decoration: BoxDecoration(
        color: context.palette.inactiveColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(_textInputRadius),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: label,
          hintStyle: context.textTheme.bodyLarge!
              .copyWith(color: context.palette.textOnPrimaryColor),
          border: InputBorder.none,
          errorStyle: context.textTheme.bodySmall!.copyWith(
            color: context.palette.errorColor,
            fontSize: _errorTextFontSize,
          ),
        ),
        style: context.textTheme.bodyLarge!
            .copyWith(color: context.palette.textOnPrimaryColor),
        cursorColor: context.palette.accentColor,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        obscureText: isObscureText,
        textCapitalization: TextCapitalization.none,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
