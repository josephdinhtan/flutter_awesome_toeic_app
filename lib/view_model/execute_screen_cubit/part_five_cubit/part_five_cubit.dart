import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/answer_enum.dart';
import '../../../data/data_providers/execute_api/part_five_api.dart';
import '../../../data/models/part_models/part_five_model.dart';
import '../../../data/repositories/execute_repository/part_five_repository/part_five_repository_impl.dart';
import '../../../domain/execute_use_cases/get_part_five_question_list_use_case.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';

part 'part_five_state.dart';

class PartFiveCubit extends Cubit<PartFiveState> {
  PartFiveCubit() : super(PartFiveInitial());
  final useCase = GetPartFiveQuestionListUseCase(
      repository: PartFiveRepositoryImpl(api: PartFiveApi()));

  late List<PartFiveModel> _partFiveQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _correctAnsCheckedMap = <int, UserAnswer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent() async {
    emit(PartFiveLoading());
    _partFiveQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _questionListSize = _partFiveQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();

    for (int i = 0; i < _questionListSize; i++) {
        _questionNumberIndexMap[_partFiveQuestionList[i].questionNumber] = i;
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

  void userSelectAnswerChange(UserAnswer userAnswer) {
    final int key = _partFiveQuestionList[_currentQuestionIndex].questionNumber;
    _userAnswerMap[key] = userAnswer;
  }

  void userCheckAnswer() {
    int questionNumber =
        _partFiveQuestionList[_currentQuestionIndex].questionNumber;
    _correctAnsCheckedMap[questionNumber] = UserAnswer.values[
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
    final int questionNumber =
        _partFiveQuestionList[_currentQuestionIndex].questionNumber;
    if (!_userAnswerMap.containsKey(questionNumber)) {
      _userAnswerMap[questionNumber] = UserAnswer.notAnswer;
    }
    if (!_correctAnsCheckedMap.containsKey(questionNumber)) {
      _correctAnsCheckedMap[questionNumber] = UserAnswer.notAnswer;
    }
    emit(PartFiveContentLoaded(
        partFiveModel: _partFiveQuestionList[_currentQuestionIndex],
        userAnswer: _userAnswerMap[questionNumber],
        correctAnswer: _correctAnsCheckedMap[questionNumber],
        questionListSize: _questionListSize,
        currentQuestionNumber: questionNumber));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partFiveQuestionList.length; i++) {
      UserAnswer? userAns =
          _userAnswerMap[_partFiveQuestionList[i].questionNumber];
      UserAnswer? correctAns =
          _correctAnsCheckedMap[_partFiveQuestionList[i].questionNumber];
      int userAnsIdx =
          userAns == null ? UserAnswer.notAnswer.index : userAns.index;
      int correctAnsIdx =
          correctAns == null ? UserAnswer.notAnswer.index : correctAns.index;
      _answerSheetModel.add(AnswerSheetModel(
          questionNumber: _partFiveQuestionList[i].questionNumber,
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
