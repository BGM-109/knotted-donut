import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knotted_donut_tdd/app/features/checkout/view/checkout_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = "cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
          onPressed: () {
            context.goNamed(CheckOutView.routeName);
          },
          child: const Text("주문 하기")),
      body: const Center(child: Text("cart")),
    );
  }
}
