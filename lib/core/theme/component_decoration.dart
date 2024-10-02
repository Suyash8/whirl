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
    BorderRadius? borderRadius,
  })
  {
    final border = OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: borderColor ?? colorScheme.tertiary,
      ),
    );

    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      helperText: helperText,
      errorText: errorText,

      filled: backgroundColor != null,
      fillColor: backgroundColor,

      border: border,
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
        color: hintColor ?? colorScheme.onSurface.withOpacity(0.6),
      ),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
    );
  }

  static ButtonStyle buttonDecoration({
  required ColorScheme colorScheme,
    Color? backgroundColor,
    Color? textColor,
    bool fill = true,
  //   size
    double width = double.infinity,
    double height = 52.0,
  })
  {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
        backgroundColor ?? colorScheme.primary,
      ),
      foregroundColor: WidgetStateProperty.all<Color>(
        textColor ?? colorScheme.onPrimary,
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      minimumSize: WidgetStateProperty.all<Size>(
        Size(width, height),
      ),
      maximumSize: WidgetStateProperty.all<Size>(
        Size(width, height),
      ),

    );
  }
}
