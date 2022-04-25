import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/data_providers/execute_api/part_four_api.dart';
import '../../../data/models/part_models/answer_enum.dart';
import '../../../data/models/part_models/part_four_model.dart';
import '../../../data/repositories/execute_repository/part_four_repository/part_four_repository_impl.dart';
import '../../../domain/execute_use_cases/get_part_four_question_list_use_case.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';

part 'part_four_state.dart';

class PartFourCubit extends Cubit<PartFourState> {
  PartFourCubit() : super(PartFourInitial());

  final useCase = GetPartFourQuestionListUserCase(
      repository: PartFourRepositoryImpl(api: PartFourApi()));

  late List<PartFourModel> _partFourQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _correctAnsCheckedMap = <int, UserAnswer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent() async {
    emit(PartFourLoading());
    _partFourQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _questionListSize = _partFourQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    for(int i = 0; i < _questionListSize; i++) {
      for(int questionNumber in _partFourQuestionList[i].questionNumber) {
        _questionNumberIndexMap[questionNumber] = i;
      }
    }
    notifyData();
  }

  Future<void> getNextContent() async {
    // include 3 question, 9 answer
    if (_currentQuestionIndex < _partFourQuestionList.length - 1) {
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

  void userCheckAnswer() {
    for(int i = 0; i < _partFourQuestionList[_currentQuestionIndex].questionNumber.length; i++) {
      int questionNumber = _partFourQuestionList[_currentQuestionIndex].questionNumber[i];
      _correctAnsCheckedMap[questionNumber] = UserAnswer.values[_partFourQuestionList[_currentQuestionIndex].correctAnswer[i].index];
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
    in _partFourQuestionList[_currentQuestionIndex].questionNumber) {
      if (!_userAnswerMap.containsKey(questionNumber)) {
        _userAnswerMap[questionNumber] = UserAnswer.notAnswer;
      }
      if (!_correctAnsCheckedMap.containsKey(questionNumber)) {
        _correctAnsCheckedMap[questionNumber] = UserAnswer.notAnswer;
      }
      userAnswerList.add(_userAnswerMap[questionNumber]);
      correctAnswer.add(_correctAnsCheckedMap[questionNumber]);
    }
    emit(PartFourContentLoaded(
        partFourModel: _partFourQuestionList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        correctAnswer: correctAnswer,
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partFourQuestionList.length; i++) {
      for (int j = 0; j < _partFourQuestionList[i].questionNumber.length; j++) {
        UserAnswer? userAns = _userAnswerMap[_partFourQuestionList[i].questionNumber[j]];
        UserAnswer? correctAns = _correctAnsCheckedMap[_partFourQuestionList[i].questionNumber[j]];
        int userAnsIdx = userAns == null ? UserAnswer.notAnswer.index : userAns.index;
        int correctAnsIdx = correctAns == null ? UserAnswer.notAnswer.index : correctAns.index;
        _answerSheetModel.add(AnswerSheetModel(
            questionNumber: _partFourQuestionList[i].questionNumber[j],
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
