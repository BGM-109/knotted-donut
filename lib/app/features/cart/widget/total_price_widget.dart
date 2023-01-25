import 'package:flutter/material.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key, required this.totalPrice});
  final int totalPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "상품 금액",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Text(
          "$totalPrice원",
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
