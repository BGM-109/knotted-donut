import 'package:flutter/material.dart';
import 'package:knotted_donut_tdd/app/core/constants/colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productId,
    required this.onPressed,
    required this.isLoading,
  });
  final String productId;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            maximumSize: const Size(double.infinity, 54),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Palette.kPinkAccent),
        onPressed: onPressed,
        child: isLoading
            ? const AspectRatio(
                aspectRatio: 1 / 1,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : const Text(
                "장바구니",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ));
  }
}
