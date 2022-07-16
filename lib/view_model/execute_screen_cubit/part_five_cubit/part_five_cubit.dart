import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../data/business_models/execute_models/answer_enum.dart';
import '../../../data/business_models/execute_models/part_five_model.dart';
import '../../../data/business_models/part_model.dart';
import '../../../data/business_models/question_note_model.dart';
import '../../../domain/execute_use_cases/get_part_five_question_list_use_case.dart';
import '../../../domain/question_note_use_case/read_question_note_use_case.dart';
import '../../../domain/question_note_use_case/save_question_note_use_case.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';

part 'part_five_state.dart';

const _logTag = "PartFiveCubit";

class PartFiveCubit extends Cubit<PartFiveState> {
  PartFiveCubit() : super(PartFiveInitial());
  final useCase = GetIt.I.get<GetPartFiveQuestionListUseCase>();
  final saveQuestionNoteUseCase = GetIt.I.get<SaveQuestionNoteUseCase>();
  final readQuestionNoteUseCase = GetIt.I.get<ReadQuestionNoteUseCase>();

  late List<PartFiveModel> _partFiveQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, Answer>{};
  final Map _correctAnsCheckedMap = <int, Answer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final Map _questionNoteIndexMap = <int, String?>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent(List<String> ids) async {
    emit(PartFiveLoading());
    _partFiveQuestionList = await useCase.perform(ids);
    _currentQuestionIndex = 0;
    _questionListSize = _partFiveQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    _questionNoteIndexMap.clear();

    for (int i = 0; i < _questionListSize; i++) {
      _questionNumberIndexMap[_partFiveQuestionList[i].number] = i;
      final note =
          await readQuestionNoteUseCase.perform(_partFiveQuestionList[i].id);
      _questionNoteIndexMap[_partFiveQuestionList[i].number] = note?.note;
    }
    notifyData();
  }

  Future<void> getNextContent() async {
    emit(PartFiveLoading());
    if (_currentQuestionIndex < _partFiveQuestionList.length - 1) {
      _currentQuestionIndex++;
    }

    notifyData();
  }

  void userSelectAnswerChange(Answer userAnswer) {
    final int key = _partFiveQuestionList[_currentQuestionIndex].number;
    _userAnswerMap[key] = userAnswer;
  }

  Future<void> saveQuestionIdToDB(String message) async {
    //_partOneQuestionList[_currentQuestionIndex].id;
    log('$_logTag saveQuestionIdToDB() message: $message');

    // final list = await GetIt.I.get<ReadAllQuestionNoteUseCase>().perform();
    // log('$_logTag saveQuestionIdToDB() list: ${list!.length}');

    final result = await saveQuestionNoteUseCase.perform(
      QuestionNoteModel(
        partType: PartType.part5,
        id: _partFiveQuestionList[_currentQuestionIndex].id,
        note: message,
        questionNum: _partFiveQuestionList[_currentQuestionIndex].number,
      ),
    );
    if (result) {
      _questionNoteIndexMap[
          _partFiveQuestionList[_currentQuestionIndex].number] = message;
    }
  }

  void userCheckAnswer() {
    int questionNumber = _partFiveQuestionList[_currentQuestionIndex].number;
    _correctAnsCheckedMap[questionNumber] = Answer.values[
        _partFiveQuestionList[_currentQuestionIndex].correctAnswer.index];
    notifyData();
  }

  Future<void> getPrevContent() async {
    emit(PartFiveLoading());
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
    }

    notifyData();
  }

  void notifyData() {
    final int key = _partFiveQuestionList[_currentQuestionIndex].number;
    if (!_userAnswerMap.containsKey(key)) {
      _userAnswerMap[key] = Answer.notAnswer;
    }
    if (!_correctAnsCheckedMap.containsKey(key)) {
      _correctAnsCheckedMap[key] = Answer.notAnswer;
    }
    emit(PartFiveContentLoaded(
        note: _questionNoteIndexMap[key],
        partFiveModel: _partFiveQuestionList[_currentQuestionIndex],
        userAnswer: _userAnswerMap[key],
        correctAnswer: _correctAnsCheckedMap[key],
        questionListSize: _questionListSize,
        currentQuestionNumber: key));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partFiveQuestionList.length; i++) {
      Answer? userAns = _userAnswerMap[_partFiveQuestionList[i].number];
      Answer? correctAns =
          _correctAnsCheckedMap[_partFiveQuestionList[i].number];
      int userAnsIdx = userAns == null ? Answer.notAnswer.index : userAns.index;
      int correctAnsIdx =
          correctAns == null ? Answer.notAnswer.index : correctAns.index;
      _answerSheetModel.add(AnswerSheetModel(
          questionNumber: _partFiveQuestionList[i].number,
          correctAnswerIndex: correctAnsIdx,
          userSelectedIndex: userAnsIdx));
    }
    return _answerSheetModel;
  }

  void goToQuestion(int questionNumber) {
    _currentQuestionIndex = _questionNumberIndexMap[questionNumber];
    notifyData();
  }
}
