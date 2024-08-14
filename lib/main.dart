import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_suitmedia/data/repositories.dart';
import 'package:palindrome_suitmedia/domain/use_case.dart';
import 'package:palindrome_suitmedia/presentation/bloc.dart';
import 'package:palindrome_suitmedia/ui/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<PalindromeBloc>(
        create: (context) => PalindromeBloc(
          PalindromeRepositoryImpl(
            PalindromeUseCaseImpl(),
          ),
        ),
        child: FirstScreen(),
      ),
    );
  }
}
