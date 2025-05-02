import 'package:flutter_application_1/theme/theme.dart';

class InputDecortions {
  static InputDecoration authInputDecoration({
    required String hinText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: MyTheme.primary.withOpacity(0.6),
          width: 1.5,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: MyTheme.primary,
          width: 2,
        ),
      ),
      hintText: hinText,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.grey.shade600,
        fontWeight: FontWeight.w500,
      ),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: MyTheme.primary,
            )
          : null,
      filled: true,
      fillColor: Colors.grey.shade100,
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red.withOpacity(0.6),
          width: 1.5,
        ),
      ),
    );
  }
}



