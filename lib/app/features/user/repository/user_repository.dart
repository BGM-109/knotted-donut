import 'package:knotted_donut_tdd/app/features/user/model/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser();
}
