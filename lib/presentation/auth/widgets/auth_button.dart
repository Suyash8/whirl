import 'package:flutter/material.dart';
import 'package:whirl/core/theme/component_decoration.dart';

class AuthButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final int state;
  final String loadingText;

  const AuthButton({
    super.key,
    required this.onPressed,
    this.text = 'Login',
    this.loadingText = 'Logging in...',
    this.state = 0,
  });

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    Widget buttonChild() {
      if (widget.state == 1) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 16.0,
              width: 16.0,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            const SizedBox(width: 16.0),
            Text(widget.loadingText),
          ],
        );
      } else if (widget.state == 2) {
        return const Icon(Icons.done);
      } else if (widget.state == 3) {
        return const Icon(Icons.close);
      } else {
        return Text(widget.text);
      }
    }

    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ComponentDecoration.buttonDecoration(
          colorScheme: Theme.of(context).colorScheme),
      child: buttonChild(),
    );
  }
}
