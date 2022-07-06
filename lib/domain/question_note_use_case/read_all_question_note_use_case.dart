import 'package:get_it/get_it.dart';

import '../../data/business_models/question_note_model.dart';
import '../../data/data_providers/daos/question_note_dao.dart';
import '../base_use_case/BaseUseCase.dart';

class ReadAllQuestionNoteUseCase
    implements BaseUseCase<List<QuestionNoteModel>?, void> {
  final questionNoteDao = GetIt.I.get<QuestionNoteDao>();

  @override
  Future<List<QuestionNoteModel>?> perform([_]) async {
    return await questionNoteDao.queryAll([]);
  }
}
