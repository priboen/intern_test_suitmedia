import 'package:equatable/equatable.dart';

abstract class PalindromeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckPalindromeEvent extends PalindromeEvent {
  final String text;

  CheckPalindromeEvent(this.text);
}

class ResetStateEvent extends PalindromeEvent {}

class NavigateToSecondScreenEvent extends PalindromeEvent {
  final String name;

  NavigateToSecondScreenEvent(this.name);
}