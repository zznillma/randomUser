// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final UserModel userModel;

  UsersLoadedState({required this.userModel});
}

class UsersErrorState extends UsersState {
  final CatchException error;

  UsersErrorState({required this.error});
}
