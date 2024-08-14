import 'package:palindrome_suitmedia/data/repository/user_repository.dart';
import 'package:palindrome_suitmedia/domain/users/user_entity.dart';

class GetUserUseCase{
  final UserRepository repository;

  GetUserUseCase({required this.repository});

  Future<List<UserEntity>> call() async {
    return await repository.getUsers();
  }
}