import 'package:palindrome_suitmedia/domain/users/user_entity.dart';

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<UserEntity> users;

  UsersLoadedState({required this.users});
}

class UsersErrorState extends UsersState {
  final String errorMessage;

  UsersErrorState({required this.errorMessage});
}