import 'package:bloc/bloc.dart';
import '../../../data/business_models/part_models/answer_enum.dart';
import '../../../data/business_models/part_models/part_one_model.dart';
import '../../../data/data_providers/apis/part_execute_apis/part_one_api.dart';
import '../../../data/repositories/execute_repository/part_one_repository/part_one_repository_impl.dart';
import '../../../domain/execute_use_cases/get_part_one_question_list_use_case.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';
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
  final Map _correctAnsCheckedMap = <int, UserAnswer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent() async {
    emit(PartOneLoading());
    _partOneQuestionList = await useCase.getContent();
    _currentQuestionIndex = 0;
    _questionListSize = _partOneQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    for (int i = 0; i < _questionListSize; i++) {
      _questionNumberIndexMap[_partOneQuestionList[i].questionNumber] = i;
    }
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
    _correctAnsCheckedMap[key] = UserAnswer.values[_partOneQuestionList[_currentQuestionIndex].correctAnswer.index];
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
    if (!_correctAnsCheckedMap.containsKey(key)) {
      _correctAnsCheckedMap[key] = UserAnswer.notAnswer;
    }
    emit(PartOneContentLoaded(
        partOneModel: _partOneQuestionList[_currentQuestionIndex],
        userAnswer: _userAnswerMap[key],
        correctAnswer: _correctAnsCheckedMap[key],
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partOneQuestionList.length; i++) {
        UserAnswer? userAns =
            _userAnswerMap[_partOneQuestionList[i].questionNumber];
        UserAnswer? correctAns =
            _correctAnsCheckedMap[_partOneQuestionList[i].questionNumber];
        int userAnsIdx =
            userAns == null ? UserAnswer.notAnswer.index : userAns.index;
        int correctAnsIdx =
            correctAns == null ? UserAnswer.notAnswer.index : correctAns.index;
        _answerSheetModel.add(AnswerSheetModel(
            questionNumber: _partOneQuestionList[i].questionNumber,
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
