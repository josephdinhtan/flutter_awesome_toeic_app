import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core_utils/core_utils.dart';
import '../../../data/business_models/execute_models/answer_enum.dart';
import '../../../data/business_models/execute_models/part_one_model.dart';
import '../../../domain/execute_use_cases/get_part_one_question_list_use_case.dart';
import '../../../presentation/screens/execute_screen/components/media_player.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';

part 'part_one_state.dart';

class PartOneCubit extends Cubit<PartOneState> {
  PartOneCubit() : super(PartOneInitial());
  //final useCase = GetPartOneQuestionListUseCase();
  final useCase = GetIt.I.get<GetPartOneQuestionListUseCase>();

  late List<PartOneModel> _partOneQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _correctAnsCheckedMap = <int, UserAnswer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent(List<String> ids) async {
    emit(PartOneLoading());
    _partOneQuestionList = await useCase.perform(ids);
    _currentQuestionIndex = 0;
    _questionListSize = _partOneQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    for (int i = 0; i < _questionListSize; i++) {
      _questionNumberIndexMap[_partOneQuestionList[i].number] = i;
    }
    _playAudio(_partOneQuestionList[_currentQuestionIndex].audioPath);
    _notifyData();
  }

  void _playAudio(String audioRelativePath) {
    final String audioFullPath = getApplicationDirectory() + audioRelativePath;
    MediaPlayer().playLocal(audioFullPath);
  }

  Future<void> getNextContent() async {
    emit(PartOneLoading());
    if (_currentQuestionIndex < _partOneQuestionList.length - 1) {
      _currentQuestionIndex++;
    }
    _playAudio(_partOneQuestionList[_currentQuestionIndex].audioPath);
    _notifyData();
  }

  void userSelectAnswerChange(UserAnswer userAnswer) {
    final int key = _partOneQuestionList[_currentQuestionIndex].number;
    _userAnswerMap[key] = userAnswer;
  }

  void userCheckAnswer() {
    final int key = _partOneQuestionList[_currentQuestionIndex].number;
    _correctAnsCheckedMap[key] = UserAnswer.values[
        _partOneQuestionList[_currentQuestionIndex].correctAnswer.index];
    _notifyData();
  }

  Future<void> getPrevContent() async {
    emit(PartOneLoading());
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
    }
    _playAudio(_partOneQuestionList[_currentQuestionIndex].audioPath);
    _notifyData();
  }

  void _notifyData() {
    final int key = _partOneQuestionList[_currentQuestionIndex].number;
    bool needHideAns = false;
    if (!_userAnswerMap.containsKey(key)) {
      _userAnswerMap[key] = UserAnswer.notAnswer;
    }
    if (!_correctAnsCheckedMap.containsKey(key)) {
      _correctAnsCheckedMap[key] = UserAnswer.notAnswer;
    }
    if (_correctAnsCheckedMap[key] == UserAnswer.notAnswer) {
      needHideAns = true;
    }
    emit(PartOneContentLoaded(
        answers: needHideAns
            ? ["", "", "", ""]
            : _partOneQuestionList[_currentQuestionIndex].answers,
        audioPath: _partOneQuestionList[_currentQuestionIndex].audioPath,
        picturePath: _partOneQuestionList[_currentQuestionIndex].picturePath,
        userAnswer: _userAnswerMap[key],
        correctAnswer: _correctAnsCheckedMap[key],
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partOneQuestionList.length; i++) {
      UserAnswer? userAns = _userAnswerMap[_partOneQuestionList[i].number];
      UserAnswer? correctAns =
          _correctAnsCheckedMap[_partOneQuestionList[i].number];
      int userAnsIdx =
          userAns == null ? UserAnswer.notAnswer.index : userAns.index;
      int correctAnsIdx =
          correctAns == null ? UserAnswer.notAnswer.index : correctAns.index;
      _answerSheetModel.add(AnswerSheetModel(
          questionNumber: _partOneQuestionList[i].number,
          correctAnswerIndex: correctAnsIdx,
          userSelectedIndex: userAnsIdx));
    }
    return _answerSheetModel;
  }

  void goToQuestion(int questionNumber) {
    if (questionNumber - 1 == _currentQuestionIndex) return;
    _currentQuestionIndex = _questionNumberIndexMap[questionNumber];
    _playAudio(_partOneQuestionList[_currentQuestionIndex].audioPath);
    _notifyData();
  }
}
