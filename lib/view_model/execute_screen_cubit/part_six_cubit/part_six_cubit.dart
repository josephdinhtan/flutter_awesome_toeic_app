import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/data_providers/execute_api/part_six_api.dart';
import '../../../data/models/part_models/answer_enum.dart';
import '../../../data/models/part_models/part_six_model.dart';
import '../../../data/repositories/execute_repository/part_six_repository/part_six_repository_impl.dart';
import '../../../domain/execute_use_cases/get_part_six_question_list_use_case.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_widget.dart';

part 'part_six_state.dart';

class PartSixCubit extends Cubit<PartSixState> {
  PartSixCubit() : super(PartSixInitial());

  final useCase = GetPartSixQuestionListUserCase(
      repository: PartSixRepositoryImpl(api: PartSixApi()));

  late List<PartSixModel> _partSixQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _correctAnsCheckedMap = <int, UserAnswer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent() async {
    emit(PartSixLoading());
    _partSixQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _questionListSize = _partSixQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    for(int i = 0; i < _questionListSize; i++) {
      for(int questionNumber in _partSixQuestionList[i].questionNumber) {
        _questionNumberIndexMap[questionNumber] = i;
      }
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

  void userCheckAnswer() {
    for(int i = 0; i < _partSixQuestionList[_currentQuestionIndex].questionNumber.length; i++) {
      int questionNumber = _partSixQuestionList[_currentQuestionIndex].questionNumber[i];
      _correctAnsCheckedMap[questionNumber] = UserAnswer.values[_partSixQuestionList[_currentQuestionIndex].correctAnswer[i].index];
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
        in _partSixQuestionList[_currentQuestionIndex].questionNumber) {
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
        partSixModel: _partSixQuestionList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        correctAnswer: correctAnswer,
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partSixQuestionList.length; i++) {
      for (int j = 0; j < _partSixQuestionList[i].questionNumber.length; j++) {
        UserAnswer? userAns = _userAnswerMap[_partSixQuestionList[i].questionNumber[j]];
        UserAnswer? correctAns = _correctAnsCheckedMap[_partSixQuestionList[i].questionNumber[j]];
        int userAnsIdx = userAns == null ? UserAnswer.notAnswer.index : userAns.index;
        int correctAnsIdx = correctAns == null ? UserAnswer.notAnswer.index : correctAns.index;
        _answerSheetModel.add(AnswerSheetModel(
            questionNumber: _partSixQuestionList[i].questionNumber[j],
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
