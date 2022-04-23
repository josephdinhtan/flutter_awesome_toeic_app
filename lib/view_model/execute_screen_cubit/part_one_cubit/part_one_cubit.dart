import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/answer_enum.dart';
import '../../../data/data_providers/execute_api/part_one_api.dart';
import '../../../data/models/part_models/part_one_model.dart';
import '../../../data/repositories/execute_repository/part_one_repository/part_one_repository_impl.dart';
import '../../../domain/execute_use_cases/get_part_one_question_list_use_case.dart';
import '../../../utils/misc.dart';

part 'part_one_state.dart';

class PartOneCubit extends Cubit<PartOneState> {
  PartOneCubit() : super(PartOneInitial());
  final useCase = GetPartOneQuestionListUseCase(
      repository: PartOneRepositoryImpl(api: PartOneApi()));

  late List<PartOneModel> _partOneQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _userCheckedMap = <int, bool>{};

  Future<void> getInitContent() async {
    emit(PartOneLoading());
    _partOneQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _questionListSize = _partOneQuestionList.length;
    _userAnswerMap.clear();
    _userCheckedMap.clear();
    notifyData();
  }

  Future<void> getNextContent() async {
    emit(PartOneLoading());
    if (_currentQuestionIndex < _partOneQuestionList.length - 1) {
      _currentQuestionIndex++;
    }

    notifyData();
  }

  void userSelectAnswerChange(UserAnswer userAnswer) {
    final int key = _partOneQuestionList[_currentQuestionIndex].questionNumber;
    _userAnswerMap[key] = userAnswer;
  }

  void userCheckAnswer() {
    final int key = _partOneQuestionList[_currentQuestionIndex].questionNumber;
    _userCheckedMap[key] = true;
    notifyData();
  }

  Future<void> getPrevContent() async {
    emit(PartOneLoading());
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
    }

    notifyData();
  }

  void notifyData() {
    final int key = _partOneQuestionList[_currentQuestionIndex].questionNumber;
    if (!_userAnswerMap.containsKey(key)) {
      _userAnswerMap[key] = UserAnswer.notAnswer;
    }
    if (!_userCheckedMap.containsKey(key)) {
      _userCheckedMap[key] = false;
    }
    emit(PartOneContentLoaded(
        partOneModel: _partOneQuestionList[_currentQuestionIndex],
        userAnswer: _userAnswerMap[key],
        userChecked: _userCheckedMap[key],
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }
}
