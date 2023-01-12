import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knotted_donut_tdd/app/features/checkout/view/checkout_result_view.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});
  static const String routeName = "checkout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
          onPressed: () {
            context.goNamed(CheckoutResultView.routeName);
          },
          child: const Text("결제 하기")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("주문서 작성"),
        ],
      )),
    );
  }
}
