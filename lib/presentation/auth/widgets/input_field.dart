import 'package:flutter/material.dart';
import 'package:whirl/core/theme/component_decoration.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: ComponentDecoration.inputDecoration(
        colorScheme: Theme.of(context).colorScheme,
        hintText: hintText,
      ),

    );
  }
}
