import 'package:flutter/material.dart';
import 'package:palindrome_suitmedia/presentation/palindrome_bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_suitmedia/presentation/palindrome_bloc/events.dart';
import 'package:palindrome_suitmedia/presentation/palindrome_bloc/states.dart';
import 'package:palindrome_suitmedia/ui/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: BlocListener<PalindromeBloc, PalindromeState>(
          listener: (context, state) {
            if (state is PalindromeCheckedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.result),
                ),
              );
              context.read<PalindromeBloc>().textController.clear();
              context.read<PalindromeBloc>().add(ResetStateEvent());
            } else if (state is NavigateToSecondScreenState) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(
                    name: state.name,
                  ),
                ),
              );
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white10,
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/ic_photo.png'),
                  ),
                  SizedBox(height: 80),
                  TextFormField(
                    controller: context.read<PalindromeBloc>().nameController,
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: context.read<PalindromeBloc>().textController,
                    decoration: InputDecoration(
                      labelText: 'Palindrome',
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(43, 99, 123, 1),
                        elevation: 0,
                        minimumSize: Size(size * 0.8, 40)),
                    onPressed: () {
                      // context.read<PalindromeBloc>().add(CheckPalindromeEvent(
                      //     context.read<PalindromeBloc>().textController.text));
                      final text =
                          context.read<PalindromeBloc>().textController.text;
                      if (text.isNotEmpty) {
                        context
                            .read<PalindromeBloc>()
                            .add(CheckPalindromeEvent(text));
                      }
                    },
                    child: Text(
                      'Check',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size * 0.04,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(43, 99, 123, 1),
                        elevation: 0,
                        minimumSize: Size(size * 0.8, 40)),
                    onPressed: () {
                      final name =
                          context.read<PalindromeBloc>().nameController.text;
                      if (name.isNotEmpty) {
                        context
                            .read<PalindromeBloc>()
                            .add(NavigateToSecondScreenEvent(name));
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
