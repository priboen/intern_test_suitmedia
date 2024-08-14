import 'package:bloc/bloc.dart';
import 'package:palindrome_suitmedia/domain/users/user_usecase.dart';
import 'package:palindrome_suitmedia/presentation/users_bloc/user_events.dart';
import 'package:palindrome_suitmedia/presentation/users_bloc/user_states.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUserUseCase getUsersUseCase;

  UsersBloc({required this.getUsersUseCase}) : super(UsersInitial()) {
    on<UsersFetchEvent>((event, emit) async {
      emit(UsersLoadingState());
      try {
        final users = await getUsersUseCase.call();
        emit(UsersLoadedState(users: users));
      } catch (e) {
        emit(UsersErrorState(errorMessage: e.toString()));
      }
    });
  }
}