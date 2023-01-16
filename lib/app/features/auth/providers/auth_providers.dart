import 'package:firebase_auth/firebase_auth.dart';
import 'package:knotted_donut_tdd/app/features/auth/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository();
}

@riverpod
String? getUserName(GetUserNameRef ref) {
  return FirebaseAuth.instance.currentUser?.displayName;
}
