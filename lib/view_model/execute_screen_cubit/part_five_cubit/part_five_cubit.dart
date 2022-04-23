import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/answer_enum.dart';
import '../../../data/data_providers/execute_api/part_five_api.dart';
import '../../../data/models/part_models/part_five_model.dart';
import '../../../data/repositories/execute_repository/part_five_repository/part_five_repository_impl.dart';
import '../../../domain/execute_use_cases/get_part_five_question_list_use_case.dart';
import '../../../utils/misc.dart';

part 'part_five_state.dart';

class PartFiveCubit extends Cubit<PartFiveState> {
  PartFiveCubit() : super(PartFiveInitial());
  final useCase = GetPartFiveQuestionListUseCase(
      repository: PartFiveRepositoryImpl(api: PartFiveApi()));

  late List<PartFiveModel> _partFiveQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _userCheckedMap = <int, bool>{};

  Future<void> getInitContent() async {
    emit(PartFiveLoading());
    _partFiveQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _questionListSize = _partFiveQuestionList.length;
    _userAnswerMap.clear();
    _userCheckedMap.clear();
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
    final int key = _partFiveQuestionList[_currentQuestionIndex].questionNumber;
    _userCheckedMap[key] = true;
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
    final int key = _partFiveQuestionList[_currentQuestionIndex].questionNumber;
    if (!_userAnswerMap.containsKey(key)) {
      _userAnswerMap[key] = UserAnswer.notAnswer;
    }
    if (!_userCheckedMap.containsKey(key)) {
      _userCheckedMap[key] = false;
    }
    emit(PartFiveContentLoaded(
        partFiveModel: _partFiveQuestionList[_currentQuestionIndex],
        userAnswer: _userAnswerMap[key],
        userChecked: _userCheckedMap[key],
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }
}
