import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/business_models/part_models/answer_enum.dart';
import '../../../data/business_models/part_models/part_three_model.dart';
import '../../../data/data_providers/apis/part_execute_apis/part_three_api.dart';
import '../../../data/repositories/execute_repository/part_three_repository/part_three_repository_impl.dart';
import '../../../domain/execute_use_cases/get_part_three_question_list_use_case.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';

part 'part_three_state.dart';

class PartThreeCubit extends Cubit<PartThreeState> {
  PartThreeCubit() : super(PartThreeInitial());

  final useCase = GetPartThreeQuestionListUserCase(
      repository: PartThreeRepositoryImpl(api: PartThreeApi()));

  late List<PartThreeModel> _partThreeQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _correctAnsCheckedMap = <int, UserAnswer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent() async {
    emit(PartThreeLoading());
    _partThreeQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _questionListSize = _partThreeQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    for(int i = 0; i < _questionListSize; i++) {
      for(int questionNumber in _partThreeQuestionList[i].questionNumber) {
        _questionNumberIndexMap[questionNumber] = i;
      }
    }
    notifyData();
  }

  Future<void> getNextContent() async {
    // include 3 question, 9 answer
    if (_currentQuestionIndex < _partThreeQuestionList.length - 1) {
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
    for(int i = 0; i < _partThreeQuestionList[_currentQuestionIndex].questionNumber.length; i++) {
      int questionNumber = _partThreeQuestionList[_currentQuestionIndex].questionNumber[i];
      _correctAnsCheckedMap[questionNumber] = UserAnswer.values[_partThreeQuestionList[_currentQuestionIndex].correctAnswer[i].index];
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
    in _partThreeQuestionList[_currentQuestionIndex].questionNumber) {
      if (!_userAnswerMap.containsKey(questionNumber)) {
        _userAnswerMap[questionNumber] = UserAnswer.notAnswer;
      }
      if (!_correctAnsCheckedMap.containsKey(questionNumber)) {
        _correctAnsCheckedMap[questionNumber] = UserAnswer.notAnswer;
      }
      userAnswerList.add(_userAnswerMap[questionNumber]);
      correctAnswer.add(_correctAnsCheckedMap[questionNumber]);
    }
    emit(PartThreeContentLoaded(
        partThreeModel: _partThreeQuestionList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        correctAnswer: correctAnswer,
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partThreeQuestionList.length; i++) {
      for (int j = 0; j < _partThreeQuestionList[i].questionNumber.length; j++) {
        UserAnswer? userAns = _userAnswerMap[_partThreeQuestionList[i].questionNumber[j]];
        UserAnswer? correctAns = _correctAnsCheckedMap[_partThreeQuestionList[i].questionNumber[j]];
        int userAnsIdx = userAns == null ? UserAnswer.notAnswer.index : userAns.index;
        int correctAnsIdx = correctAns == null ? UserAnswer.notAnswer.index : correctAns.index;
        _answerSheetModel.add(AnswerSheetModel(
            questionNumber: _partThreeQuestionList[i].questionNumber[j],
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
