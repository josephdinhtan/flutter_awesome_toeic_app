import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_three_api.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_three_repository/part_three_repository.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_three_repository/part_three_repository_impl.dart';
import 'package:flutter_toeic_quiz2/domain/execute_use_cases/get_part_three_question_list_use_case.dart';
import 'package:meta/meta.dart';

import '../../../data/models/part_models/answer_enum.dart';
import '../../../data/models/part_models/part_three_model.dart';

part 'part_three_state.dart';

class PartThreeCubit extends Cubit<PartThreeState> {
  PartThreeCubit() : super(PartThreeInitial());

  final useCase = GetPartThreeQuestionListUserCase(
      repository: PartThreeRepositoryImpl(api: PartThreeApi()));

  late List<PartThreeModel> _partThreeQuestionList;
  int _currentQuestionIndex = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _userCheckedMap = <int, bool>{};

  Future<void> getInitContent() async {
    emit(PartThreeLoading());
    _partThreeQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _userAnswerMap.clear();
    _userCheckedMap.clear();
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
    for(int questionNumber in _partThreeQuestionList[_currentQuestionIndex].questionNumber) {
      _userCheckedMap[questionNumber] = true;
    }
    notifyData();
  }

  void userSelectAnswerChange(int questionNumber, UserAnswer userAnswer) {
    _userAnswerMap[questionNumber] = userAnswer;
  }

  void notifyData() {
    List<UserAnswer> userAnswerList = [];
    List<bool> userCheckedList = [];
    for (int questionNumber
        in _partThreeQuestionList[_currentQuestionIndex].questionNumber) {
      if (!_userAnswerMap.containsKey(questionNumber)) {
        _userAnswerMap[questionNumber] = UserAnswer.notAnswer;
      }
      if (!_userCheckedMap.containsKey(questionNumber)) {
        _userCheckedMap[questionNumber] = false;
      }
      userAnswerList.add(_userAnswerMap[questionNumber]);
      userCheckedList.add(_userCheckedMap[questionNumber]);
    }

    emit(PartThreeContentLoaded(
        partThreeModel: _partThreeQuestionList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        userChecked: userCheckedList));
  }
}
