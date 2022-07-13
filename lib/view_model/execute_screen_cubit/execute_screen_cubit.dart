import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/business_models/question_group_model.dart';
import 'package:get_it/get_it.dart';

import '../../../core_utils/core_utils.dart';
import '../../../data/business_models/execute_models/answer_enum.dart';
import '../../../data/business_models/part_model.dart';
import '../../../data/business_models/question_note_model.dart';
import '../../../domain/question_note_use_case/read_question_note_use_case.dart';
import '../../../domain/question_note_use_case/save_question_note_use_case.dart';
import '../../../presentation/screens/execute_screen/components/media_player.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';
import '../../domain/execute_use_cases/get_question_group_use_case.dart';

part 'execute_screen_state.dart';

const _logTag = "PartThreeCubit";

class ExecuteScreenCubit extends Cubit<ExecuteScreenState> {
  ExecuteScreenCubit() : super(ExecuteScreenInitial());

  final useCase = GetIt.I.get<GetQuestionGroupListUseCase>();
  final saveQuestionNoteUseCase = GetIt.I.get<SaveQuestionNoteUseCase>();
  final readQuestionNoteUseCase = GetIt.I.get<ReadQuestionNoteUseCase>();

  late List<QuestionGroupModel> _questionGroupList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _correctAnsCheckedMap = <int, UserAnswer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final Map _questionNoteIndexMap = <int, String?>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent(List<String> ids) async {
    emit(ExecuteScreenLoading());
    _questionGroupList = await useCase.perform(ids);
    _currentQuestionIndex = 0;
    _questionListSize = _questionGroupList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    _questionNoteIndexMap.clear();
    for (int i = 0; i < _questionListSize; i++) {
      for (final question in _questionGroupList[i].questions) {
        _questionNumberIndexMap[question.number] = i;
      }
      final note =
          await readQuestionNoteUseCase.perform(_questionGroupList[i].id);
      _questionNoteIndexMap[_questionGroupList[i].questions[0].number] =
          note?.note;
    }
    _playAudio(_questionGroupList[_currentQuestionIndex].audioPath);
    notifyData();
  }

  void _playAudio(String? audioRelativePath) {
    if (audioRelativePath == null) return;
    final String audioFullPath = getApplicationDirectory() + audioRelativePath;
    MediaPlayer().playLocal(audioFullPath);
  }

  Future<void> getNextContent() async {
    // include 3 question, 9 answer
    if (_currentQuestionIndex < _questionGroupList.length - 1) {
      _currentQuestionIndex++;
    }
    _playAudio(_questionGroupList[_currentQuestionIndex].audioPath);
    notifyData();
  }

  Future<void> getPrevContent() async {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
    }
    _playAudio(_questionGroupList[_currentQuestionIndex].audioPath);
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
        id: _questionGroupList[_currentQuestionIndex].id,
        note: message,
        questionNum:
            _questionGroupList[_currentQuestionIndex].questions[0].number,
      ),
    );
    if (result) {
      _questionNoteIndexMap[_questionGroupList[_currentQuestionIndex]
          .questions[0]
          .number] = message;
    }
  }

  void userCheckAnswer() {
    for (int i = 0;
        i < _questionGroupList[_currentQuestionIndex].questions.length;
        i++) {
      int questionNumber =
          _questionGroupList[_currentQuestionIndex].questions[i].number;
      _correctAnsCheckedMap[questionNumber] = UserAnswer.values[
          _questionGroupList[_currentQuestionIndex]
              .questions[i]
              .correctAns
              .index];
    }
    notifyData();
  }

  void userSelectAnswerChange(int questionNumber, UserAnswer userAnswer) {
    _userAnswerMap[questionNumber] = userAnswer;
  }

  void notifyData() {
    List<UserAnswer> userAnswerList = [];
    List<UserAnswer> correctAnswer = [];
    bool needHideAnsQues = false;

    for (final question
        in _questionGroupList[_currentQuestionIndex].questions) {
      if (!_userAnswerMap.containsKey(question.number)) {
        _userAnswerMap[question.number] = UserAnswer.notAnswer;
      }
      if (!_correctAnsCheckedMap.containsKey(question.number)) {
        _correctAnsCheckedMap[question.number] = UserAnswer.notAnswer;
      }
      userAnswerList.add(_userAnswerMap[question.number]);
      correctAnswer.add(_correctAnsCheckedMap[question.number]);
    }
    if (_questionGroupList[_currentQuestionIndex].partType == PartType.part1 ||
        _questionGroupList[_currentQuestionIndex].partType == PartType.part2) {
      if (_correctAnsCheckedMap[
              _questionGroupList[_currentQuestionIndex].questions[0].number] ==
          UserAnswer.notAnswer) {
        needHideAnsQues = true;
      }
    }
    emit(ExecuteContentLoaded(
        needHideAnsQues: needHideAnsQues,
        note: _questionNoteIndexMap[
            _questionGroupList[_currentQuestionIndex].questions[0].number],
        questionGroupModel: _questionGroupList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        correctAnswer: correctAnswer,
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _questionGroupList.length; i++) {
      for (int j = 0; j < _questionGroupList[i].questions.length; j++) {
        UserAnswer? userAns =
            _userAnswerMap[_questionGroupList[i].questions[j].number];
        UserAnswer? correctAns =
            _correctAnsCheckedMap[_questionGroupList[i].questions[j].number];
        int userAnsIdx =
            userAns == null ? UserAnswer.notAnswer.index : userAns.index;
        int correctAnsIdx =
            correctAns == null ? UserAnswer.notAnswer.index : correctAns.index;
        _answerSheetModel.add(AnswerSheetModel(
            questionNumber: _questionGroupList[i].questions[j].number,
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
    _playAudio(_questionGroupList[_currentQuestionIndex].audioPath);
    notifyData();
  }
}
