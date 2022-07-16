import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../core_utils/core_utils.dart';
import '../../../data/business_models/execute_models/answer_enum.dart';
import '../../../data/business_models/execute_models/part_three_model.dart';
import '../../../data/business_models/part_model.dart';
import '../../../data/business_models/question_note_model.dart';
import '../../../domain/execute_use_cases/get_part_three_question_list_use_case.dart';
import '../../../domain/question_note_use_case/read_question_note_use_case.dart';
import '../../../domain/question_note_use_case/save_question_note_use_case.dart';
import '../../../presentation/screens/execute_screen/components/media_player.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';

part 'part_three_state.dart';

const _logTag = "PartThreeCubit";

class PartThreeCubit extends Cubit<PartThreeState> {
  PartThreeCubit() : super(PartThreeInitial());

  final useCase = GetIt.I.get<GetPartThreeQuestionListUseCase>();
  final saveQuestionNoteUseCase = GetIt.I.get<SaveQuestionNoteUseCase>();
  final readQuestionNoteUseCase = GetIt.I.get<ReadQuestionNoteUseCase>();

  late List<PartThreeModel> _partThreeQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, Answer>{};
  final Map _correctAnsCheckedMap = <int, Answer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final Map _questionNoteIndexMap = <int, String?>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent(List<String> ids) async {
    emit(PartThreeLoading());
    _partThreeQuestionList = await useCase.perform(ids);
    _currentQuestionIndex = 0;
    _questionListSize = _partThreeQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    _questionNoteIndexMap.clear();
    for (int i = 0; i < _questionListSize; i++) {
      for (int questionNumber in _partThreeQuestionList[i].numbers) {
        _questionNumberIndexMap[questionNumber] = i;
      }
      final note =
          await readQuestionNoteUseCase.perform(_partThreeQuestionList[i].id);
      _questionNoteIndexMap[_partThreeQuestionList[i].numbers[0]] = note?.note;
    }
    _playAudio(_partThreeQuestionList[_currentQuestionIndex].audioPath);
    notifyData();
  }

  void _playAudio(String audioRelativePath) {
    final String audioFullPath = getApplicationDirectory() + audioRelativePath;
    MediaPlayer().playLocal(audioFullPath);
  }

  Future<void> getNextContent() async {
    // include 3 question, 9 answer
    if (_currentQuestionIndex < _partThreeQuestionList.length - 1) {
      _currentQuestionIndex++;
    }
    _playAudio(_partThreeQuestionList[_currentQuestionIndex].audioPath);
    notifyData();
  }

  Future<void> getPrevContent() async {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
    }
    _playAudio(_partThreeQuestionList[_currentQuestionIndex].audioPath);
    notifyData();
  }

  Future<void> saveQuestionIdToDB(String message) async {
    //_partOneQuestionList[_currentQuestionIndex].id;
    log('$_logTag saveQuestionIdToDB() message: $message');

    // final list = await GetIt.I.get<ReadAllQuestionNoteUseCase>().perform();
    // log('$_logTag saveQuestionIdToDB() list: ${list!.length}');

    final result = await saveQuestionNoteUseCase.perform(
      QuestionNoteModel(
        partType: PartType.part3,
        id: _partThreeQuestionList[_currentQuestionIndex].id,
        note: message,
        questionNum: _partThreeQuestionList[_currentQuestionIndex].numbers[0],
      ),
    );
    if (result) {
      _questionNoteIndexMap[
          _partThreeQuestionList[_currentQuestionIndex].numbers[0]] = message;
    }
  }

  void userCheckAnswer() {
    for (int i = 0;
        i < _partThreeQuestionList[_currentQuestionIndex].numbers.length;
        i++) {
      int questionNumber =
          _partThreeQuestionList[_currentQuestionIndex].numbers[i];
      _correctAnsCheckedMap[questionNumber] = Answer.values[
          _partThreeQuestionList[_currentQuestionIndex].correctAns[i].index];
    }
    notifyData();
  }

  void userSelectAnswerChange(int questionNumber, Answer userAnswer) {
    _userAnswerMap[questionNumber] = userAnswer;
  }

  void notifyData() {
    List<Answer> userAnswerList = [];
    List<Answer> correctAnswer = [];
    for (int questionNumber
        in _partThreeQuestionList[_currentQuestionIndex].numbers) {
      if (!_userAnswerMap.containsKey(questionNumber)) {
        _userAnswerMap[questionNumber] = Answer.notAnswer;
      }
      if (!_correctAnsCheckedMap.containsKey(questionNumber)) {
        _correctAnsCheckedMap[questionNumber] = Answer.notAnswer;
      }
      userAnswerList.add(_userAnswerMap[questionNumber]);
      correctAnswer.add(_correctAnsCheckedMap[questionNumber]);
    }
    emit(PartThreeContentLoaded(
        note: _questionNoteIndexMap[
            _partThreeQuestionList[_currentQuestionIndex].numbers[0]],
        partThreeModel: _partThreeQuestionList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        correctAnswer: correctAnswer,
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partThreeQuestionList.length; i++) {
      for (int j = 0; j < _partThreeQuestionList[i].numbers.length; j++) {
        Answer? userAns = _userAnswerMap[_partThreeQuestionList[i].numbers[j]];
        Answer? correctAns =
            _correctAnsCheckedMap[_partThreeQuestionList[i].numbers[j]];
        int userAnsIdx =
            userAns == null ? Answer.notAnswer.index : userAns.index;
        int correctAnsIdx =
            correctAns == null ? Answer.notAnswer.index : correctAns.index;
        _answerSheetModel.add(AnswerSheetModel(
            questionNumber: _partThreeQuestionList[i].numbers[j],
            correctAnswerIndex: correctAnsIdx,
            userSelectedIndex: userAnsIdx));
      }
    }
    return _answerSheetModel;
  }

  void goToQuestion(int questionNumber) {
    //log('questionNumber: ${(questionNumber - 32) ~/ 3}, _currentQuestionIndex: $_currentQuestionIndex');
    if ((questionNumber - 32) ~/ 3 == _currentQuestionIndex) return;
    _currentQuestionIndex = _questionNumberIndexMap[questionNumber];
    _playAudio(_partThreeQuestionList[_currentQuestionIndex].audioPath);
    notifyData();
  }
}
