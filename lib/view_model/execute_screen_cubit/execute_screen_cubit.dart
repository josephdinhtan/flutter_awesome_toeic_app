import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/business_models/question_group_model.dart';
import 'package:flutter_toeic_quiz2/view_model/execute_screen_cubit/bottom_control_bar_cubit.dart';
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
import '../../domain/execute_use_cases/save_question_group_use_case.dart';

part 'execute_screen_state.dart';

const _logTag = "PartThreeCubit";

class ExecuteScreenCubit extends Cubit<ExecuteScreenState> {
  ExecuteScreenCubit() : super(ExecuteScreenInitial());

  final getQuestionGroupListUseCase =
      GetIt.I.get<GetQuestionGroupListUseCase>();
  final saveQuestionGroupListUseCase =
      GetIt.I.get<SaveQuestionGroupListUseCase>();
  final saveQuestionNoteUseCase = GetIt.I.get<SaveQuestionNoteUseCase>();
  final readQuestionNoteUseCase = GetIt.I.get<ReadQuestionNoteUseCase>();

  late List<QuestionGroupModel> _questionGroupList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, Answer>{};
  final Map _correctAnsCheckedMap = <int, Answer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final Map _questionNoteIndexMap = <int, String?>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  late BottomControlBarCubit _bottomControlBarCubit;

  Future<void> getInitContent(List<String> ids,
      {bool isReviewSession = false,
      required BottomControlBarCubit bottomControlBarCubit}) async {
    emit(ExecuteScreenLoading());
    _bottomControlBarCubit = bottomControlBarCubit;
    _questionGroupList = await getQuestionGroupListUseCase.perform(ids);
    _currentQuestionIndex = 0;
    _questionListSize = _questionGroupList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    _questionNoteIndexMap.clear();
    for (int i = 0; i < _questionListSize; i++) {
      for (final question in _questionGroupList[i].questions) {
        _questionNumberIndexMap[question.number] = i;
        if (isReviewSession) {
          _correctAnsCheckedMap[question.number] = question.correctAns;
          _userAnswerMap[question.number] = question.userAnswer;
        } else {
          question.userAnswer = Answer.notAnswer;
        }
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

  void submitTest() {
    // save test
    saveQuestionGroupListUseCase.perform(_questionGroupList);
  }

  Map<PartType, int> getNumOfCorrectEachPart() {
    Map<PartType, int> mapPartTypeCorrectNum = {
      PartType.part1: 0,
      PartType.part2: 0,
      PartType.part3: 0,
      PartType.part4: 0,
      PartType.part5: 0,
      PartType.part6: 0,
      PartType.part7: 0,
    };
    for (int i = 0; i < _questionListSize; i++) {
      for (final question in _questionGroupList[i].questions) {
        if (question.correctAns == question.userAnswer) {
          mapPartTypeCorrectNum[_questionGroupList[i].partType] =
              mapPartTypeCorrectNum[_questionGroupList[i].partType]! + 1;
        }
      }
    }
    return mapPartTypeCorrectNum;
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

  Future<void> saveANoteQuestionIdToDB(String message) async {
    //_partOneQuestionList[_currentQuestionIndex].id;
    log('$_logTag saveQuestionIdToDB() message: $message');

    // final list = await GetIt.I.get<ReadAllQuestionNoteUseCase>().perform();
    // log('$_logTag saveQuestionIdToDB() list: ${list!.length}');

    final result = await saveQuestionNoteUseCase.perform(
      QuestionNoteModel(
        partType: _questionGroupList[_currentQuestionIndex].partType,
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
      _correctAnsCheckedMap[questionNumber] = Answer.values[
          _questionGroupList[_currentQuestionIndex]
              .questions[i]
              .correctAns
              .index];
    }
    notifyData();
  }

  void userSelectAnswerChange(int questionNumber, Answer userAnswer) {
    _userAnswerMap[questionNumber] = userAnswer;
    for (int i = 0;
        i < _questionGroupList[_currentQuestionIndex].questions.length;
        i++) {
      if (_questionGroupList[_currentQuestionIndex].questions[i].number ==
          questionNumber) {
        _questionGroupList[_currentQuestionIndex].questions[i].userAnswer =
            userAnswer;
        break;
      }
    }
  }

  void notifyData() {
    List<Answer> userAnswerList = [];
    List<Answer> correctAnswer = [];
    bool needHideAnsQues = false;

    for (final question
        in _questionGroupList[_currentQuestionIndex].questions) {
      if (!_userAnswerMap.containsKey(question.number)) {
        _userAnswerMap[question.number] = Answer.notAnswer;
      }
      if (!_correctAnsCheckedMap.containsKey(question.number)) {
        _correctAnsCheckedMap[question.number] = Answer.notAnswer;
      }
      userAnswerList.add(_userAnswerMap[question.number]);
      correctAnswer.add(_correctAnsCheckedMap[question.number]);
    }
    if (_questionGroupList[_currentQuestionIndex].partType.index <=
        PartType.part4.index) {
      if (_correctAnsCheckedMap[
              _questionGroupList[_currentQuestionIndex].questions[0].number] ==
          Answer.notAnswer) {
        needHideAnsQues = true;
      }
    }
    emit(ExecuteContentLoaded(
        needHideSomething: needHideAnsQues,
        note: _questionNoteIndexMap[
            _questionGroupList[_currentQuestionIndex].questions[0].number],
        questionGroupModel: _questionGroupList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        correctAnswer: correctAnswer,
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));

    _bottomControlBarCubit.questionChange(
        note: _questionNoteIndexMap[
            _questionGroupList[_currentQuestionIndex].questions[0].number],
        userChecked: _correctAnsCheckedMap[
                _questionGroupList[_currentQuestionIndex]
                    .questions[0]
                    .number] !=
            Answer.notAnswer);
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _questionGroupList.length; i++) {
      for (int j = 0; j < _questionGroupList[i].questions.length; j++) {
        Answer? userAns =
            _userAnswerMap[_questionGroupList[i].questions[j].number];
        Answer? correctAns =
            _correctAnsCheckedMap[_questionGroupList[i].questions[j].number];
        int userAnsIdx =
            userAns == null ? Answer.notAnswer.index : userAns.index;
        int correctAnsIdx =
            correctAns == null ? Answer.notAnswer.index : correctAns.index;
        _answerSheetModel.add(AnswerSheetModel(
            have4Answer: _questionGroupList[i].partType != PartType.part2,
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
