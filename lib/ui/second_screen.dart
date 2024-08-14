import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_suitmedia/data/repository/user_repository.dart';
import 'package:palindrome_suitmedia/domain/users/user_usecase.dart';
import 'package:palindrome_suitmedia/presentation/users_bloc/user_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:palindrome_suitmedia/ui/third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String name;
  const SecondScreen({super.key, required this.name});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Second Screen',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Center(
              child: Text(
                "Selected User Name",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(43, 99, 123, 1),
                  elevation: 0,
                  minimumSize: Size(size * 0.8, 40)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => UsersBloc(
                            getUsersUseCase: GetUserUseCase(
                              repository: UserRepository(
                                client: http.Client(),
                              ),
                            ),
                          ),
                        ),
                      ],
                      child: ThirdScreen(),
                    ),
                  ),
                );
              },
              child: Text(
                "Choose a User",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
