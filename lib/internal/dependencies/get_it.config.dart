// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:practice43/fetures/users/data/repositories/user_repository_impl.dart'
    as _i4;
import 'package:practice43/fetures/users/domain/repositories/user_repository.dart'
    as _i3;
import 'package:practice43/fetures/users/domain/use_cases/user_user_case.dart'
    as _i5;
import 'package:practice43/fetures/users/presintation/logic/bloc/users_bloc.dart'
    as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.UserRepository>(() => _i4.UserRepositoryImpl());
  gh.factory<_i5.UserUseCase>(
      () => _i5.UserUseCase(userRepository: gh<_i3.UserRepository>()));
  gh.factory<_i6.UsersBloc>(() => _i6.UsersBloc(gh<_i5.UserUseCase>()));
  return getIt;
}
