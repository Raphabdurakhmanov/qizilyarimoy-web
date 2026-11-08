import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteAccountUseCase {
  final UserRepository repository;

  DeleteAccountUseCase(this.repository);

  Future<Either<Failure, dynamic>> call() async {
    return repository.deleteAccount();
  }
}
