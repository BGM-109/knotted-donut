import 'package:flutter/material.dart';
import 'package:knotted_donut_tdd/app/core/router/router.dart';
import 'package:knotted_donut_tdd/app/features/auth/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> googleSignIn({required VoidCallback onSuccess}) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(authRepository.signInWithGoogle);

    if (state is AsyncData) {
      ref.read(routerNotifierProvider).isLoggedIn = true;
      onSuccess();
    }
  }

  Future<void> signOut({required VoidCallback onSuccess}) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(authRepository.signOut);

    if (state is AsyncData) {
      ref.read(routerNotifierProvider).isLoggedIn = false;
      onSuccess();
    }
  }
}
