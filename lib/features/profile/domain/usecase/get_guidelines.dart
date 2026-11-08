import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/entities/guideline_entity.dart';
import 'package:app/features/profile/domain/repositories/guideline_repository.dart';
import 'package:dartz/dartz.dart';

class GetGuidelinesUseCase {
  final GuidelineRepository repository;

  GetGuidelinesUseCase(this.repository);

  Future<Either<Failure, PaginatedGuidelineEntity>> call() async {
    return await repository.getGuidelines();
  }
}
