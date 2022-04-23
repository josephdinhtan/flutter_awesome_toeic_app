import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/answer_enum.dart';
import '../../../data/data_providers/execute_api/part_two_api.dart';
import '../../../data/models/part_models/part_two_model.dart';
import '../../../data/repositories/execute_repository/part_two_repository/part_two_repository_impl.dart';
import '../../../domain/execute_use_cases/get_part_two_question_list_use_case.dart';
import '../../../utils/misc.dart';

part 'part_two_state.dart';

class PartTwoCubit extends Cubit<PartTwoState> {
  PartTwoCubit() : super(PartTwoInitial());
  final useCase = GetPartTwoQuestionListUseCase(
      repository: PartTwoRepositoryImpl(api: PartTwoApi()));

  late List<PartTwoModel> _partTwoQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _userCheckedMap = <int, bool>{};

  Future<void> getInitContent() async {
    emit(PartTwoLoading());
    _partTwoQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _questionListSize = _partTwoQuestionList.length;
    _userAnswerMap.clear();
    _userCheckedMap.clear();

    notifyData();
  }

  Future<void> getNextContent() async {
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
    _userCheckedMap[key] = true;
    notifyData();
  }

  Future<void> getPrevContent() async {
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
    if (!_userCheckedMap.containsKey(key)) {
      _userCheckedMap[key] = false;
    }
    emit(PartTwoContentLoaded(
        partTwoModel: _partTwoQuestionList[_currentQuestionIndex],
        userAnswer: _userAnswerMap[key],
        userChecked: _userCheckedMap[key],
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }
}
