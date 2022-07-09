import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../data/business_models/execute_models/answer_enum.dart';
import '../../../data/business_models/execute_models/part_six_model.dart';
import '../../../data/business_models/part_model.dart';
import '../../../data/business_models/question_note_model.dart';
import '../../../domain/execute_use_cases/get_part_six_question_list_use_case.dart';
import '../../../domain/execute_use_cases/save_question_to_favorite_use_case.dart';
import '../../../domain/question_note_use_case/read_question_note_use_case.dart';
import '../../../domain/question_note_use_case/save_question_note_use_case.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';

part 'part_six_state.dart';

const _logTag = "PartSixCubit";

class PartSixCubit extends Cubit<PartSixState> {
  PartSixCubit() : super(PartSixInitial());

  final useCase = GetIt.I.get<GetPartSixQuestionListUseCase>();
  final saveQuestionNoteUseCase = GetIt.I.get<SaveQuestionNoteUseCase>();
  final readQuestionNoteUseCase = GetIt.I.get<ReadQuestionNoteUseCase>();

  final saveQuestionToFavoriteUseCase =
      GetIt.I.get<SaveQuestionToFavoriteUseCase>();

  late List<PartSixModel> _partSixQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _correctAnsCheckedMap = <int, UserAnswer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final Map _questionNoteIndexMap = <int, String?>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent(List<String> ids) async {
    emit(PartSixLoading());
    _partSixQuestionList = await useCase.getContent(ids);
    _currentQuestionIndex = 0;
    _questionListSize = _partSixQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    _questionNoteIndexMap.clear();
    for (int i = 0; i < _questionListSize; i++) {
      for (int questionNumber in _partSixQuestionList[i].numbers) {
        _questionNumberIndexMap[questionNumber] = i;
      }
      final note =
          await readQuestionNoteUseCase.perform(_partSixQuestionList[i].id);
      _questionNoteIndexMap[_partSixQuestionList[i].numbers[0]] = note?.note;
    }
    notifyData();
  }

  Future<void> getNextContent() async {
    // include 3 question, 9 answer
    if (_currentQuestionIndex < _partSixQuestionList.length - 1) {
      _currentQuestionIndex++;
    }
    notifyData();
  }

  Future<void> getPrevContent() async {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
    }
    notifyData();
  }

  Future<void> saveQuestionIdToDB(String message) async {
    //_partOneQuestionList[_currentQuestionIndex].id;
    log('$_logTag saveQuestionIdToDB() message: $message');

    // final list = await GetIt.I.get<ReadAllQuestionNoteUseCase>().perform();
    // log('$_logTag saveQuestionIdToDB() list: ${list!.length}');

    final result = await saveQuestionNoteUseCase.perform(
      QuestionNoteModel(
        partType: PartType.part6,
        id: _partSixQuestionList[_currentQuestionIndex].id,
        note: message,
        questionNum: _partSixQuestionList[_currentQuestionIndex].numbers[0],
      ),
    );
    if (result) {
      _questionNoteIndexMap[
          _partSixQuestionList[_currentQuestionIndex].numbers[0]] = message;
    }
  }

  void userCheckAnswer() {
    for (int i = 0;
        i < _partSixQuestionList[_currentQuestionIndex].numbers.length;
        i++) {
      int questionNumber =
          _partSixQuestionList[_currentQuestionIndex].numbers[i];
      _correctAnsCheckedMap[questionNumber] = UserAnswer.values[
          _partSixQuestionList[_currentQuestionIndex].correctAnswer[i].index];
    }
    notifyData();
  }

  void userSelectAnswerChange(int questionNumber, UserAnswer userAnswer) {
    _userAnswerMap[questionNumber] = userAnswer;
  }

  void notifyData() {
    List<UserAnswer> userAnswerList = [];
    List<UserAnswer> correctAnswer = [];
    for (int questionNumber
        in _partSixQuestionList[_currentQuestionIndex].numbers) {
      if (!_userAnswerMap.containsKey(questionNumber)) {
        _userAnswerMap[questionNumber] = UserAnswer.notAnswer;
      }
      if (!_correctAnsCheckedMap.containsKey(questionNumber)) {
        _correctAnsCheckedMap[questionNumber] = UserAnswer.notAnswer;
      }
      userAnswerList.add(_userAnswerMap[questionNumber]);
      correctAnswer.add(_correctAnsCheckedMap[questionNumber]);
    }
    emit(PartSixContentLoaded(
        note: _questionNoteIndexMap[
            _partSixQuestionList[_currentQuestionIndex].numbers[0]],
        partSixModel: _partSixQuestionList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        correctAnswer: correctAnswer,
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partSixQuestionList.length; i++) {
      for (int j = 0; j < _partSixQuestionList[i].numbers.length; j++) {
        UserAnswer? userAns =
            _userAnswerMap[_partSixQuestionList[i].numbers[j]];
        UserAnswer? correctAns =
            _correctAnsCheckedMap[_partSixQuestionList[i].numbers[j]];
        int userAnsIdx =
            userAns == null ? UserAnswer.notAnswer.index : userAns.index;
        int correctAnsIdx =
            correctAns == null ? UserAnswer.notAnswer.index : correctAns.index;
        _answerSheetModel.add(AnswerSheetModel(
            questionNumber: _partSixQuestionList[i].numbers[j],
            correctAnswerIndex: correctAnsIdx,
            userSelectedIndex: userAnsIdx));
      }
    }
    return _answerSheetModel;
  }

  void goToQuestion(int questionNumber) {
    _currentQuestionIndex = _questionNumberIndexMap[questionNumber];
    notifyData();
  }

  void saveCurrentQuestionToFavorite(String message) {
    saveQuestionToFavoriteUseCase.saveQuestionToFavorite(
        questionId: _partSixQuestionList[_currentQuestionIndex].id,
        message: message);
  }
}
