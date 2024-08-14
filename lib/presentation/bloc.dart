import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:palindrome_suitmedia/data/repositories.dart';
import 'package:palindrome_suitmedia/presentation/events.dart';
import 'package:palindrome_suitmedia/presentation/states.dart';

// class PalindromeBloc extends Bloc<PalindromeEvent, PalindromeState> {
//   final PalindromeRepository _repository;
//   final TextEditingController _textController = TextEditingController();

//   PalindromeBloc(this._repository) : super(PalindromeInitialState()) {
//     on<CheckPalindromeEvent>(_onCheckPalindromeEvent);
//     on<ResetStateEvent>(_onResetStateEvent);
//   }

//   TextEditingController get textController => _textController;

//   void _onCheckPalindromeEvent(
//       CheckPalindromeEvent event, Emitter<PalindromeState> emit) async {
//     final inputText = event.text;
//     final palindrome = await _repository.checkPalindrome(inputText);
//     emit(PalindromeCheckedState(palindrome.isPalindrome
//         ? "Teks ini adalah Palindrome"
//         : "Teks ini bukan Palindrome"));
//   }

//   void _onResetStateEvent(
//       ResetStateEvent event, Emitter<PalindromeState> emit) {
//     _textController.clear();
//     emit(PalindromeInitialState());
//   }

//   @override
//   void onChange(Change<PalindromeState> change) {
//     super.onChange(change);
//     print(change);
//   }
// }

class PalindromeBloc extends Bloc<PalindromeEvent, PalindromeState> {
  final PalindromeRepository _repository;
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  PalindromeBloc(this._repository) : super(PalindromeInitialState()) {
    on<CheckPalindromeEvent>(_onCheckPalindromeEvent);
    on<ResetStateEvent>(_onResetStateEvent);
    on<NavigateToSecondScreenEvent>(_onNavigateToSecondScreenEvent);
  }

  TextEditingController get textController => _textController;
  TextEditingController get nameController => _nameController;

  void _onCheckPalindromeEvent(
      CheckPalindromeEvent event, Emitter<PalindromeState> emit) async {
    final inputText = event.text;
    final palindrome = await _repository.checkPalindrome(inputText);
    emit(PalindromeCheckedState(palindrome.isPalindrome
        ? "Teks ini adalah Palindrome"
        : "Teks ini bukan Palindrome"));
  }

  void _onResetStateEvent(
      ResetStateEvent event, Emitter<PalindromeState> emit) {
    _textController.clear();
    emit(PalindromeInitialState());
  }

  void _onNavigateToSecondScreenEvent(
      NavigateToSecondScreenEvent event, Emitter<PalindromeState> emit) {
    emit(NavigateToSecondScreenState(event.name));
  }

  @override
  void onChange(Change<PalindromeState> change) {
    super.onChange(change);
    print(change);
  }
}
