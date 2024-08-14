import 'package:palindrome_suitmedia/domain/palindrome/entities.dart';
import 'package:palindrome_suitmedia/domain/palindrome/use_case.dart';

abstract class PalindromeRepository {
  Future<Palindrome> checkPalindrome(String text);
}

class PalindromeRepositoryImpl implements PalindromeRepository {
  final PalindromeUseCase _useCase;

  PalindromeRepositoryImpl(this._useCase);

  @override
  Future<Palindrome> checkPalindrome(String text) async {
    return _useCase.checkPalindrome(text);
  }
}