import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ErrorContainer({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        const SizedBox(height: 10,),
        TextButton(
          onPressed: onPressed,
          child: const Text("Retry"),
        )
      ],
    );
  }
}
