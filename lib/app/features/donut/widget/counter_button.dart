import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  const CounterButton(
      {super.key,
      required this.sign,
      required this.onPressed,
      required this.size});
  final String sign;
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99), color: Colors.black),
        child: Text(
          sign,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
