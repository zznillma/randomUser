import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:practice43/fetures/users/data/models/user_model.dart';
import 'package:practice43/fetures/users/domain/repositories/user_repository.dart';
import 'package:practice43/internal/helpers/api_requester.dart';
import 'package:practice43/internal/helpers/catch_exceptions_helper.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserModel> getRandomUser() async {
    ApiRequester apiRequester = ApiRequester();

    try {
      Response response = await apiRequester.toGet('');

      // log('user response === ${response.data}');

// print(response.data['results'][''].runtimeType);
      if (response.statusCode == 200) {

        return UserModel.fromJson(response.data);
      }

      throw CatchException.convertException(response);
    } catch (e) {
      print('e ==== $e');
      throw CatchException.convertException(e);
    }
  }
}
