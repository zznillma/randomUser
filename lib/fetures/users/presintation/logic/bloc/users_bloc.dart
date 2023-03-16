import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:practice43/fetures/users/data/models/user_model.dart';
import 'package:practice43/fetures/users/domain/use_cases/user_user_case.dart';
import 'package:practice43/internal/helpers/catch_exceptions_helper.dart';

part 'users_event.dart';
part 'users_state.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserUseCase useCase;

  UsersBloc(this.useCase) : super(UsersInitial()) {
    on<UsersEvent>((event, emit) {});

    on<GetRandomUserEvent>((event, emit) async {
      emit(UsersLoadingState());

      await useCase
          .getRandomUser()
          .then((userModel) => emit(UsersLoadedState(userModel: userModel)))
          .onError((error, stackTrace) => emit(
              UsersErrorState(error: CatchException.convertException(error))));
    });
  }
}
