import 'package:knotted_donut_tdd/app/features/user/model/user_model.dart';

import 'user_repository.dart';

class UserRepositoryFake extends UserRepository {
  @override
  Future<UserModel> getUser() async {
    return await Future.delayed(const Duration(milliseconds: 1500), () {
      return UserModel('도우넛');
    });
  }
}
