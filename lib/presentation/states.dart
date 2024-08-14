import 'package:equatable/equatable.dart';

abstract class PalindromeState extends Equatable {
  @override
  List<Object> get props => [];
}

class PalindromeInitialState extends PalindromeState {}

class PalindromeCheckedState extends PalindromeState {
  final String result;

  PalindromeCheckedState(this.result);
}

class NavigateToSecondScreenState extends PalindromeState {
  final String name;

  NavigateToSecondScreenState(this.name);
}