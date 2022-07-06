import 'package:get_it/get_it.dart';

import '../../data/business_models/question_note_model.dart';
import '../../data/data_providers/daos/question_note_dao.dart';
import '../base_use_case/BaseUseCase.dart';

class SaveQuestionNoteUseCase implements BaseUseCase<bool, QuestionNoteModel> {
  final questionNoteDao = GetIt.I.get<QuestionNoteDao>();

  @override
  Future<bool> perform(questionNoteModel) async {
    return await questionNoteDao.insert(
        questionNoteModel.toHiveObject(), questionNoteModel.id);
  }
}
