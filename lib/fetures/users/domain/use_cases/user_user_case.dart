import 'package:injectable/injectable.dart';
import 'package:practice43/fetures/users/data/models/user_model.dart';
import 'package:practice43/fetures/users/domain/repositories/user_repository.dart';

@injectable
class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<UserModel> getRandomUser() async =>
      await userRepository.getRandomUser();
}
