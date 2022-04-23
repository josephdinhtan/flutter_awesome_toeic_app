import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/data_providers/execute_api/part_four_api.dart';
import '../../../data/models/part_models/answer_enum.dart';
import '../../../data/models/part_models/part_four_model.dart';
import '../../../data/repositories/execute_repository/part_four_repository/part_four_repository_impl.dart';
import '../../../domain/execute_use_cases/get_part_four_question_list_use_case.dart';

part 'part_four_state.dart';

class PartFourCubit extends Cubit<PartFourState> {
  PartFourCubit() : super(PartFourInitial());

  final useCase = GetPartFourQuestionListUserCase(
      repository: PartFourRepositoryImpl(api: PartFourApi()));

  late List<PartFourModel> _partFourQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _userCheckedMap = <int, bool>{};

  Future<void> getInitContent() async {
    emit(PartFourLoading());
    _partFourQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _questionListSize = _partFourQuestionList.length;
    _userAnswerMap.clear();
    _userCheckedMap.clear();
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
    for (int questionNumber
        in _partFourQuestionList[_currentQuestionIndex].questionNumber) {
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
        in _partFourQuestionList[_currentQuestionIndex].questionNumber) {
      if (!_userAnswerMap.containsKey(questionNumber)) {
        _userAnswerMap[questionNumber] = UserAnswer.notAnswer;
      }
      if (!_userCheckedMap.containsKey(questionNumber)) {
        _userCheckedMap[questionNumber] = false;
      }
      userAnswerList.add(_userAnswerMap[questionNumber]);
      userCheckedList.add(_userCheckedMap[questionNumber]);
    }
    emit(PartFourContentLoaded(
        partFourModel: _partFourQuestionList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        userChecked: userCheckedList,
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }
}
