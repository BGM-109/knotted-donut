import 'package:flutter_application_1/app/features/user/model/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser();
}
