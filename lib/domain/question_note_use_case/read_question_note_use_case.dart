import 'package:get_it/get_it.dart';

import '../../data/business_models/question_note_model.dart';
import '../../data/data_providers/daos/question_note_dao.dart';
import '../base_use_case/BaseUseCase.dart';

class ReadQuestionNoteUseCase
    implements BaseUseCase<QuestionNoteModel?, String> {
  final questionNoteDao = GetIt.I.get<QuestionNoteDao>();

  @override
  Future<QuestionNoteModel?> perform(hiveId) async {
    return await questionNoteDao.query(hiveId);
  }
}
