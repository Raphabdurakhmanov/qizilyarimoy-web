import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/course_entity.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';
import 'package:dartz/dartz.dart';

class CoursesUsecase {
  CourseRepository repository;

  CoursesUsecase(this.repository);

  Future<Either<Failure, PaginatedCourseEntity>> call({
    String? url,
    String? order,
    String? search,
  }) async {
    return repository.getCourses(url: url, order: order, search: search);
  }
  
}
