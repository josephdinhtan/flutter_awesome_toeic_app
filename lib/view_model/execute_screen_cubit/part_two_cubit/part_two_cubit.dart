import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core_utils/core_utils.dart';
import '../../../data/business_models/execute_models/answer_enum.dart';
import '../../../data/business_models/execute_models/part_two_model.dart';
import '../../../data/business_models/part_model.dart';
import '../../../data/business_models/question_note_model.dart';
import '../../../domain/execute_use_cases/get_part_two_question_list_use_case.dart';
import '../../../domain/question_note_use_case/read_question_note_use_case.dart';
import '../../../domain/question_note_use_case/save_question_note_use_case.dart';
import '../../../presentation/screens/execute_screen/components/media_player.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';

part 'part_two_state.dart';

class PartTwoCubit extends Cubit<PartTwoState> {
  PartTwoCubit() : super(PartTwoInitial());
  final useCase = GetIt.I.get<GetPartTwoQuestionListUseCase>();
  final saveQuestionNoteUseCase = GetIt.I.get<SaveQuestionNoteUseCase>();
  final readQuestionNoteUseCase = GetIt.I.get<ReadQuestionNoteUseCase>();

  late List<PartTwoModel> _partTwoQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, Answer>{};
  final Map _correctAnsCheckedMap = <int, Answer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final Map _questionNoteIndexMap = <int, String?>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent(List<String> ids) async {
    emit(PartTwoLoading());
    _partTwoQuestionList = await useCase.perform(ids);
    _currentQuestionIndex = 0;
    _questionListSize = _partTwoQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    _questionNoteIndexMap.clear();
    for (int i = 0; i < _questionListSize; i++) {
      _questionNumberIndexMap[_partTwoQuestionList[i].number] = i;
      final note =
          await readQuestionNoteUseCase.perform(_partTwoQuestionList[i].id);
      _questionNoteIndexMap[_partTwoQuestionList[i].number] = note?.note;
    }
    _playAudio(_partTwoQuestionList[_currentQuestionIndex].audioPath);
    _notifyData();
  }

  void _playAudio(String audioRelativePath) {
    final String audioFullPath = getApplicationDirectory() + audioRelativePath;
    MediaPlayer().playLocal(audioFullPath);
  }

  Future<void> getNextContent() async {
    emit(PartTwoLoading());
    if (_currentQuestionIndex < _partTwoQuestionList.length - 1) {
      _currentQuestionIndex++;
    }
    _playAudio(_partTwoQuestionList[_currentQuestionIndex].audioPath);
    _notifyData();
  }

  void userSelectAnswerChange(Answer userAnswer) {
    final int key = _partTwoQuestionList[_currentQuestionIndex].number;
    _userAnswerMap[key] = userAnswer;
  }

  Future<void> saveQuestionIdToDB(String noteMessage) async {
    final result = await saveQuestionNoteUseCase.perform(
      QuestionNoteModel(
        partType: PartType.part2,
        id: _partTwoQuestionList[_currentQuestionIndex].id,
        note: noteMessage,
        questionNum: _partTwoQuestionList[_currentQuestionIndex].number,
      ),
    );
    if (result) {
      _questionNoteIndexMap[
          _partTwoQuestionList[_currentQuestionIndex].number] = noteMessage;
    }
  }

  void userCheckAnswer() {
    final int key = _partTwoQuestionList[_currentQuestionIndex].number;
    _correctAnsCheckedMap[key] = Answer.values[
        _partTwoQuestionList[_currentQuestionIndex].correctAnswer.index];
    _notifyData();
  }

  Future<void> getPrevContent() async {
    emit(PartTwoLoading());
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
    }
    _playAudio(_partTwoQuestionList[_currentQuestionIndex].audioPath);
    _notifyData();
  }

  void _notifyData() {
    final int key = _partTwoQuestionList[_currentQuestionIndex].number;
    bool needHideAns = false;
    if (!_userAnswerMap.containsKey(key)) {
      _userAnswerMap[key] = Answer.notAnswer;
    }
    if (!_correctAnsCheckedMap.containsKey(key)) {
      _correctAnsCheckedMap[key] = Answer.notAnswer;
    }
    if (_correctAnsCheckedMap[key] == Answer.notAnswer) {
      needHideAns = true;
    }
    emit(PartTwoContentLoaded(
        note: _questionNoteIndexMap[key],
        answers: needHideAns
            ? ["", "", ""]
            : _partTwoQuestionList[_currentQuestionIndex].answers,
        audioPath: _partTwoQuestionList[_currentQuestionIndex].audioPath,
        question: needHideAns
            ? ""
            : _partTwoQuestionList[_currentQuestionIndex].question,
        userAnswer: _userAnswerMap[key],
        correctAnswer: _correctAnsCheckedMap[key],
        questionListSize: _questionListSize,
        currentQuestionNumber:
            _partTwoQuestionList[_currentQuestionIndex].number,
        currentQuestionIndex: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partTwoQuestionList.length; i++) {
      Answer? userAns = _userAnswerMap[_partTwoQuestionList[i].number];
      Answer? correctAns =
          _correctAnsCheckedMap[_partTwoQuestionList[i].number];
      int userAnsIdx = userAns == null ? Answer.notAnswer.index : userAns.index;
      int correctAnsIdx =
          correctAns == null ? Answer.notAnswer.index : correctAns.index;
      _answerSheetModel.add(AnswerSheetModel(
          questionNumber: _partTwoQuestionList[i].number,
          correctAnswerIndex: correctAnsIdx,
          userSelectedIndex: userAnsIdx));
    }
    return _answerSheetModel;
  }

  void goToQuestion(int questionNumber) {
    if (questionNumber - 7 == _currentQuestionIndex) return;
    _currentQuestionIndex = _questionNumberIndexMap[questionNumber];
    _playAudio(_partTwoQuestionList[_currentQuestionIndex].audioPath);
    _notifyData();
  }
}
