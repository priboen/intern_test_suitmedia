import 'package:flutter/material.dart';
import 'package:palindrome_suitmedia/presentation/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_suitmedia/presentation/events.dart';
import 'package:palindrome_suitmedia/presentation/states.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PalindromeBloc, PalindromeState>(
        listener: (context, state) {
          if (state is PalindromeCheckedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.result),
              ),
            );
            context.read<PalindromeBloc>().textController.clear();
            context.read<PalindromeBloc>().add(ResetStateEvent());
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/ic_photo.png'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: context.read<PalindromeBloc>().textController,
                  decoration: InputDecoration(
                    labelText: 'Palindrome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
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
                  child: Text('Check'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
