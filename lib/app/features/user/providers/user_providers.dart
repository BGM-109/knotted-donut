import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/features/user/model/user_model.dart';
import 'package:knotted_donut_tdd/app/features/user/repository/user_repository.dart';
import 'package:knotted_donut_tdd/app/features/user/repository/user_repository_fake.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_providers.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryFake();
}

@riverpod
Future<UserModel> getUserProvider(GetUserProviderRef ref) async {
  final repository = ref.read(userRepositoryProvider);
  return await repository.getUser();
}

final userStoreProvider = StateProvider<UserModel?>((ref) => null);
