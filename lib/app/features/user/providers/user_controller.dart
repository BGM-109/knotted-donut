import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/features/user/providers/user_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<void> build() {}

  Future<void> signIn({
    required VoidCallback onSuccess,
  }) async {
    final userRepository = ref.read(userRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      ref.read(userStoreProvider.notifier).state =
          await userRepository.getUser();
    });

    if (state is AsyncData) {
      onSuccess();
    }
  }

  Future<void> signOut({
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      Future.delayed(const Duration(milliseconds: 1500), () {})
          .then((value) {});
    });

    if (state is AsyncData) {
      // ignore: unused_result
      ref.refresh(userStoreProvider);
      onSuccess();
    }
  }
}
