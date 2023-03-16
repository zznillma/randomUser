import 'package:practice43/fetures/users/data/models/user_model.dart';

abstract class UserRepository {

  Future<UserModel> getRandomUser();
}