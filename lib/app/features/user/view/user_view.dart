import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/features/main/view/main_view.dart';
import 'package:knotted_donut_tdd/app/features/user/providers/user_controller.dart';
import 'package:knotted_donut_tdd/app/features/user/providers/user_providers.dart';

class UserView extends ConsumerWidget {
  const UserView({Key? key}) : super(key: key);

  static const String routeName = 'user';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStoreProvider);
    final controller = ref.watch(userControllerProvider);
    String parseGreeting() {
      if (user == null) return "유저 정보가 없습니다";
      return "${user.name}님 환영합니다.";
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(parseGreeting()),
          ElevatedButton(
            onPressed: () {
              ref.read(userControllerProvider.notifier).signOut(
                onSuccess: () {
                  context.goNamed(MainView.routeName);
                },
              );
            },
            child: controller.isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text("로그아웃"),
          ),
        ],
      ),
    );
  }
}
