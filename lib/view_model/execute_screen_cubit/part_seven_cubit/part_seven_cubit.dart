import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../data/business_models/execute_models/answer_enum.dart';
import '../../../data/business_models/execute_models/part_seven_model.dart';
import '../../../data/business_models/part_model.dart';
import '../../../data/business_models/question_note_model.dart';
import '../../../domain/execute_use_cases/get_part_seven_question_list_use_case.dart';
import '../../../domain/question_note_use_case/read_question_note_use_case.dart';
import '../../../domain/question_note_use_case/save_question_note_use_case.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';

part 'part_seven_state.dart';

const _logTag = "PartSevenCubit";

class PartSevenCubit extends Cubit<PartSevenState> {
  PartSevenCubit() : super(PartSevenInitial());

  final useCase = GetIt.I.get<GetPartSevenQuestionListUseCase>();
  final saveQuestionNoteUseCase = GetIt.I.get<SaveQuestionNoteUseCase>();
  final readQuestionNoteUseCase = GetIt.I.get<ReadQuestionNoteUseCase>();

  late List<PartSevenModel> _partSevenQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, Answer>{};
  final Map _correctAnsCheckedMap = <int, Answer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final Map _questionNoteIndexMap = <int, String?>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent(List<String> ids) async {
    emit(PartSevenLoading());
    _partSevenQuestionList = await useCase.getContent(ids);
    _currentQuestionIndex = 0;
    _questionListSize = _partSevenQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    _questionNoteIndexMap.clear();
    for (int i = 0; i < _questionListSize; i++) {
      for (int questionNumber in _partSevenQuestionList[i].numbers) {
        _questionNumberIndexMap[questionNumber] = i;
      }

      final note =
          await readQuestionNoteUseCase.perform(_partSevenQuestionList[i].id);
      _questionNoteIndexMap[_partSevenQuestionList[i].numbers[0]] = note?.note;
    }
    notifyData();
  }

  Future<void> getNextContent() async {
    // include 3 question, 9 answer
    if (_currentQuestionIndex < _partSevenQuestionList.length - 1) {
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
        partType: PartType.part7,
        id: _partSevenQuestionList[_currentQuestionIndex].id,
        note: message,
        questionNum: _partSevenQuestionList[_currentQuestionIndex].numbers[0],
      ),
    );
    if (result) {
      _questionNoteIndexMap[
          _partSevenQuestionList[_currentQuestionIndex].numbers[0]] = message;
    }
  }

  void userCheckAnswer() {
    for (int i = 0;
        i < _partSevenQuestionList[_currentQuestionIndex].numbers.length;
        i++) {
      int questionNumber =
          _partSevenQuestionList[_currentQuestionIndex].numbers[i];
      _correctAnsCheckedMap[questionNumber] = Answer.values[
          _partSevenQuestionList[_currentQuestionIndex].correctAnswer[i].index];
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
        in _partSevenQuestionList[_currentQuestionIndex].numbers) {
      if (!_userAnswerMap.containsKey(questionNumber)) {
        _userAnswerMap[questionNumber] = Answer.notAnswer;
      }
      if (!_correctAnsCheckedMap.containsKey(questionNumber)) {
        _correctAnsCheckedMap[questionNumber] = Answer.notAnswer;
      }
      userAnswerList.add(_userAnswerMap[questionNumber]);
      correctAnswer.add(_correctAnsCheckedMap[questionNumber]);
    }
    emit(PartSevenContentLoaded(
        note: _questionNoteIndexMap[
            _partSevenQuestionList[_currentQuestionIndex].numbers[0]],
        partSevenModel: _partSevenQuestionList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        correctAnswer: correctAnswer,
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partSevenQuestionList.length; i++) {
      for (int j = 0; j < _partSevenQuestionList[i].numbers.length; j++) {
        Answer? userAns = _userAnswerMap[_partSevenQuestionList[i].numbers[j]];
        Answer? correctAns =
            _correctAnsCheckedMap[_partSevenQuestionList[i].numbers[j]];
        int userAnsIdx =
            userAns == null ? Answer.notAnswer.index : userAns.index;
        int correctAnsIdx =
            correctAns == null ? Answer.notAnswer.index : correctAns.index;
        _answerSheetModel.add(AnswerSheetModel(
            questionNumber: _partSevenQuestionList[i].numbers[j],
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
}
