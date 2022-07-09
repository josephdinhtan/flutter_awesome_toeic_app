import 'package:get_it/get_it.dart';

import '../../data/data_providers/daos/question_note_dao.dart';
import '../base_use_case/BaseUseCase.dart';

class RemoveQuestionNoteUseCase implements BaseUseCase<bool, String> {
  final questionNoteDao = GetIt.I.get<QuestionNoteDao>();

  @override
  Future<bool> perform(hiveId) async {
    return await questionNoteDao.delete(hiveId);
  }
}
