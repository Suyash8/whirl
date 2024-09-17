import 'package:flutter/material.dart';

class ComponentDecoration {
  static InputDecoration inputDecoration({
    required ColorScheme colorScheme,
    String? hintText,
    String? labelText,
    String? helperText,
    String? errorText,
    Color? backgroundColor,
    Color? borderColor,
    Color? enabledBorderColor,
    Color? disabledBorderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? hintColor,
    Color? textColor,
  }) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? colorScheme.tertiary,
      ),
    );

    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      helperText: helperText,
      errorText: errorText,

      filled: true,
      fillColor: backgroundColor ?? colorScheme.surfaceContainerHigh,

      border: border.copyWith(
        borderSide: border.borderSide.copyWith(
          color: borderColor ?? colorScheme.outline,
        ),
      ),
      enabledBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(
          color: enabledBorderColor ?? colorScheme.outline,
        ),
      ),
      disabledBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(
          color: disabledBorderColor ?? colorScheme.tertiary,
        ),
      ),
      focusedBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(
          color: focusedBorderColor ?? colorScheme.primary,
        ),
      ),
      errorBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(
          color: errorBorderColor ?? colorScheme.error,
        ),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(
          color: errorBorderColor ?? colorScheme.error,
        ),
      ),


      hintStyle: TextStyle(
        color: hintColor ?? colorScheme.tertiary,
      ),
    );
  }
}
