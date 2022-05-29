import '../../data/repositories/execute_repository/base_repository/part_repository_base.dart';

class SaveQuestionToFavoriteUseCase {
  PartRepositoryBase repository;

  SaveQuestionToFavoriteUseCase({required this.repository});

  void saveQuestionToFavorite({required String questionId, required String message}) {
    repository.saveQuestionToFavorite(questionId: questionId, message: message);
  }
}
