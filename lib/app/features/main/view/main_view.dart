import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/features/user/providers/user_controller.dart';
import 'package:knotted_donut_tdd/app/features/user/view/user_view.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  static const String routeName = 'main';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userControllerProvider);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              ref.read(userControllerProvider.notifier).signIn(
                onSuccess: () {
                  context.goNamed(UserView.routeName);
                },
              );
            },
            child: user.isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text("로그인 테스트")),
      ),
    );
  }
}
