import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/answer_enum.dart';
import '../../../data/data_providers/execute_api/part_two_api.dart';
import '../../../data/models/part_models/part_two_model.dart';
import '../../../data/repositories/execute_repository/part_two_repository/part_two_repository_impl.dart';
import '../../../domain/execute_use_cases/get_part_two_question_list_use_case.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';

part 'part_two_state.dart';

class PartTwoCubit extends Cubit<PartTwoState> {
  PartTwoCubit() : super(PartTwoInitial());
  final useCase = GetPartTwoQuestionListUseCase(
      repository: PartTwoRepositoryImpl(api: PartTwoApi()));

  late List<PartTwoModel> _partTwoQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _correctAnsCheckedMap = <int, UserAnswer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent() async {
    emit(PartTwoLoading());
    _partTwoQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _questionListSize = _partTwoQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    for (int i = 0; i < _questionListSize; i++) {
      _questionNumberIndexMap[_partTwoQuestionList[i].questionNumber] = i;
    }
    notifyData();
  }

  Future<void> getNextContent() async {
    emit(PartTwoLoading());
    if (_currentQuestionIndex < _partTwoQuestionList.length - 1) {
      _currentQuestionIndex++;
    }

    notifyData();
  }

  void userSelectAnswerChange(UserAnswer userAnswer) {
    final int key = _partTwoQuestionList[_currentQuestionIndex].questionNumber;
    _userAnswerMap[key] = userAnswer;
  }

  void userCheckAnswer() {
    final int key = _partTwoQuestionList[_currentQuestionIndex].questionNumber;
    _correctAnsCheckedMap[key] = UserAnswer.values[_partTwoQuestionList[_currentQuestionIndex].correctAnswer.index];
    notifyData();
  }

  Future<void> getPrevContent() async {
    emit(PartTwoLoading());
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
    }

    notifyData();
  }

  void notifyData() {
    final int key = _partTwoQuestionList[_currentQuestionIndex].questionNumber;
    if (!_userAnswerMap.containsKey(key)) {
      _userAnswerMap[key] = UserAnswer.notAnswer;
    }
    if (!_correctAnsCheckedMap.containsKey(key)) {
      _correctAnsCheckedMap[key] = UserAnswer.notAnswer;
    }
    emit(PartTwoContentLoaded(
        partTwoModel: _partTwoQuestionList[_currentQuestionIndex],
        userAnswer: _userAnswerMap[key],
        correctAnswer: _correctAnsCheckedMap[key],
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partTwoQuestionList.length; i++) {
      UserAnswer? userAns =
      _userAnswerMap[_partTwoQuestionList[i].questionNumber];
      UserAnswer? correctAns =
      _correctAnsCheckedMap[_partTwoQuestionList[i].questionNumber];
      int userAnsIdx =
      userAns == null ? UserAnswer.notAnswer.index : userAns.index;
      int correctAnsIdx =
      correctAns == null ? UserAnswer.notAnswer.index : correctAns.index;
      _answerSheetModel.add(AnswerSheetModel(
          questionNumber: _partTwoQuestionList[i].questionNumber,
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
