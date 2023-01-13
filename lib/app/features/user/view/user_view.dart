import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/features/auth/providers/auth_controller.dart';
import 'package:knotted_donut_tdd/app/features/auth/view/login_view.dart';
import 'package:knotted_donut_tdd/app/features/auth/widget/login_button.dart';
import 'package:knotted_donut_tdd/app/features/user/providers/user_providers.dart';

class UserView extends ConsumerWidget {
  const UserView({Key? key}) : super(key: key);

  static const String routeName = 'user';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStoreProvider);
    final auth = ref.watch(authControllerProvider);
    String parseGreeting() {
      if (user == null) return "유저 정보가 없습니다";
      return "${user.name}님 환영합니다.";
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(parseGreeting()),
          LoginButton(
              isLoading: auth,
              onPressed: () {
                ref.read(authControllerProvider.notifier).signOut(
                  onSuccess: () {
                    context.goNamed(LoginView.routeName);
                  },
                );
              },
              text: "로그아웃")
        ],
      ),
    );
  }
}
