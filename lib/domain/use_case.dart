import 'package:palindrome_suitmedia/domain/entities.dart';

abstract class PalindromeUseCase {
  Future<Palindrome> checkPalindrome(String text);
}

class PalindromeUseCaseImpl implements PalindromeUseCase {
  @override
  Future<Palindrome> checkPalindrome(String text) async {
    final isPalindrome = _isPalindrome(text);
    return Palindrome(text: text, isPalindrome: isPalindrome);
  }

  bool _isPalindrome(String text) {
    text = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return text == text.split('').reversed.join('');
  }
}