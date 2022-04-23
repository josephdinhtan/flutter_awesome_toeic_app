import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/data_providers/execute_api/part_seven_api.dart';
import '../../../data/models/part_models/answer_enum.dart';
import '../../../data/models/part_models/part_seven_model.dart';
import '../../../data/repositories/execute_repository/part_seven_repository/part_seven_repository_impl.dart';
import '../../../domain/execute_use_cases/get_part_seven_question_list_use_case.dart';

part 'part_seven_state.dart';

class PartSevenCubit extends Cubit<PartSevenState> {
  PartSevenCubit() : super(PartSevenInitial());

  final useCase = GetPartSevenQuestionListUserCase(
      repository: PartSevenRepositoryImpl(api: PartSevenApi()));

  late List<PartSevenModel> _partSevenQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _userCheckedMap = <int, bool>{};

  Future<void> getInitContent() async {
    emit(PartSevenLoading());
    _partSevenQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _questionListSize = _partSevenQuestionList.length;
    _userAnswerMap.clear();
    _userCheckedMap.clear();
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

  void userCheckAnswer() {
    for (int questionNumber
    in _partSevenQuestionList[_currentQuestionIndex].questionNumber) {
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
    in _partSevenQuestionList[_currentQuestionIndex].questionNumber) {
      if (!_userAnswerMap.containsKey(questionNumber)) {
        _userAnswerMap[questionNumber] = UserAnswer.notAnswer;
      }
      if (!_userCheckedMap.containsKey(questionNumber)) {
        _userCheckedMap[questionNumber] = false;
      }
      userAnswerList.add(_userAnswerMap[questionNumber]);
      userCheckedList.add(_userCheckedMap[questionNumber]);
    }
    emit(PartSevenContentLoaded(
        partSevenModel: _partSevenQuestionList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        userChecked: userCheckedList,
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }
}
