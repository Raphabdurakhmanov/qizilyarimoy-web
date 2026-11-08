import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/entities/guideline_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GuidelineRepository {
  Future<Either<Failure, PaginatedGuidelineEntity>> getGuidelines();
}