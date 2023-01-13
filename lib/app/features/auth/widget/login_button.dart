import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
      required this.isLoading,
      required this.onPressed,
      required this.text});
  final AsyncValue isLoading;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(242, 50),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            backgroundColor: Colors.white),
        onPressed: () {
          if (isLoading is AsyncLoading) return;
          onPressed();
        },
        child: isLoading is AsyncLoading
            ? const AspectRatio(
                aspectRatio: 1 / 1,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ));
  }
}
