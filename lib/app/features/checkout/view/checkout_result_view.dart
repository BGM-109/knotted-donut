import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckoutResultView extends ConsumerWidget {
  const CheckoutResultView({super.key});
  static const String routeName = "result";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text("홈으로 가기")),
      body: const Center(
        child: Text("결제 완료"),
      ),
    );
  }
}
