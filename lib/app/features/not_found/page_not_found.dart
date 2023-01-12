import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/features/main/view/main_view.dart';

class PageNotFound extends ConsumerWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Page Not Found"),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(MainView.routeName);
                },
                child: const Text("Go to Main "))
          ],
        ),
      ),
    );
  }
}
