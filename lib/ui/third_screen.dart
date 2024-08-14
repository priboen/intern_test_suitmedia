import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_suitmedia/data/repository/user_repository.dart';
import 'package:palindrome_suitmedia/domain/users/user_usecase.dart';
import 'package:palindrome_suitmedia/presentation/users_bloc/user_bloc.dart';
import 'package:palindrome_suitmedia/presentation/users_bloc/user_events.dart';
import 'package:http/http.dart' as http;
import 'package:palindrome_suitmedia/presentation/users_bloc/user_states.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late UsersBloc _usersBloc;

  @override
  void initState() {
    super.initState();
    _usersBloc = UsersBloc(
        getUsersUseCase:
            GetUserUseCase(repository: UserRepository(client: http.Client())));
    _usersBloc.add(UsersFetchEvent());
  }

  @override
  void dispose() {
    _usersBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _usersBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Third Screen',
          ),
        ),
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UsersLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UsersLoadedState) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar)),
                    title: Text(user.firstName + ' ' + user.lastName),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else if (state is UsersErrorState) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
