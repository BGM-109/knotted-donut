import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/common/responsive_center.dart';
import 'package:knotted_donut_tdd/app/core/util/async_value_extension.dart';
import 'package:knotted_donut_tdd/app/features/auth/providers/auth_controller.dart';
import 'package:knotted_donut_tdd/app/features/auth/widget/login_button.dart';
import 'package:knotted_donut_tdd/app/features/main/view/main_view.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});
  static const String routeName = "login";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);
    ref.listen<AsyncValue<void>>(authControllerProvider, (_, state) {
      state.whenOrNull(
          error: (e, stk) => state.showAlertDialogOnError(context));
    });

    return ResponsiveCenter(
      child: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "assets/login_background.png",
                ))),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 100,
              child: SizedBox(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginButton(
                    isLoading: auth,
                    onPressed: () {
                      ref.read(authControllerProvider.notifier).googleSignIn(
                          onSuccess: () {
                        context.goNamed(MainView.routeName);
                      });
                    },
                    text: "로그인",
                  )
                ],
              )),
            ),
          ],
        ),
      )),
    );
  }
}
