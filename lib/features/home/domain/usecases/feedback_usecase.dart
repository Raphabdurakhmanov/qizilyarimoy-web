import 'package:app/core/error/failure.dart';
import 'package:app/features/home/data/models/feedback_model.dart';
import 'package:app/features/home/domain/repositories/feedback_repository.dart';
import 'package:dartz/dartz.dart';

class FeedbackUseCase {
  FeedbackRepository repository;
  FeedbackUseCase({required this.repository});

  Future<Either<Failure, dynamic>> call(FeedbackModel feedback) {
    return repository.sendFeedback(feedback: feedback);
  }
}
