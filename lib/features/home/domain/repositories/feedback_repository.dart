import 'package:app/core/error/failure.dart';
import 'package:app/features/home/data/models/feedback_model.dart';
import 'package:dartz/dartz.dart';

abstract class FeedbackRepository {
  Future<Either<Failure, dynamic>> sendFeedback({
    required FeedbackModel feedback,
  });
}
