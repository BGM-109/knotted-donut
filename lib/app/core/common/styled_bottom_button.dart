import 'package:flutter/material.dart';
import 'package:knotted_donut_tdd/app/core/constants/colors.dart';

class StyledBottomButton extends StatelessWidget {
  const StyledBottomButton(
      {super.key,
      this.child,
      required this.onPressed,
      this.backgroundColor,
      this.text});
  final Widget? child;
  final String? text;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            maximumSize: const Size(double.infinity, 54),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: backgroundColor ?? Palette.kPink),
        onPressed: onPressed,
        child: child ??
            Text(
              text ?? "",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ));
  }
}
