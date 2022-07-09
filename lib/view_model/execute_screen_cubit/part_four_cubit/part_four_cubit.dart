import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../core_utils/core_utils.dart';
import '../../../data/business_models/execute_models/answer_enum.dart';
import '../../../data/business_models/execute_models/part_four_model.dart';
import '../../../data/business_models/part_model.dart';
import '../../../data/business_models/question_note_model.dart';
import '../../../domain/execute_use_cases/get_part_four_question_list_use_case.dart';
import '../../../domain/question_note_use_case/read_question_note_use_case.dart';
import '../../../domain/question_note_use_case/save_question_note_use_case.dart';
import '../../../presentation/screens/execute_screen/components/media_player.dart';
import '../../../presentation/screens/execute_screen/widgets/answer_sheet_panel.dart';

part 'part_four_state.dart';

const _logTag = "PartFourCubit";

class PartFourCubit extends Cubit<PartFourState> {
  PartFourCubit() : super(PartFourInitial());

  final useCase = GetIt.I.get<GetPartFourQuestionListUseCase>();
  final saveQuestionNoteUseCase = GetIt.I.get<SaveQuestionNoteUseCase>();
  final readQuestionNoteUseCase = GetIt.I.get<ReadQuestionNoteUseCase>();

  late List<PartFourModel> _partFourQuestionList;
  int _currentQuestionIndex = 0;
  int _questionListSize = 0;
  final Map _userAnswerMap = <int, UserAnswer>{};
  final Map _correctAnsCheckedMap = <int, UserAnswer>{};
  final Map _questionNumberIndexMap = <int, int>{};
  final Map _questionNoteIndexMap = <int, String?>{};
  final List<AnswerSheetModel> _answerSheetModel = [];

  Future<void> getInitContent(List<String> ids) async {
    emit(PartFourLoading());
    _partFourQuestionList = await useCase.perform(ids);
    _currentQuestionIndex = 0;
    _questionListSize = _partFourQuestionList.length;
    _userAnswerMap.clear();
    _correctAnsCheckedMap.clear();
    _questionNumberIndexMap.clear();
    for (int i = 0; i < _questionListSize; i++) {
      for (int questionNumber in _partFourQuestionList[i].numbers) {
        _questionNumberIndexMap[questionNumber] = i;
      }
      final note =
          await readQuestionNoteUseCase.perform(_partFourQuestionList[i].id);
      _questionNoteIndexMap[_partFourQuestionList[i].numbers[0]] = note?.note;
    }
    _playAudio(_partFourQuestionList[_currentQuestionIndex].audioPath);
    notifyData();
  }

  void _playAudio(String audioRelativePath) {
    final String audioFullPath = getApplicationDirectory() + audioRelativePath;
    MediaPlayer().playLocal(audioFullPath);
  }

  Future<void> getNextContent() async {
    // include 3 question, 9 answer
    if (_currentQuestionIndex < _partFourQuestionList.length - 1) {
      _currentQuestionIndex++;
    }
    _playAudio(_partFourQuestionList[_currentQuestionIndex].audioPath);
    notifyData();
  }

  Future<void> getPrevContent() async {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
    }
    _playAudio(_partFourQuestionList[_currentQuestionIndex].audioPath);
    notifyData();
  }

  Future<void> saveQuestionIdToDB(String message) async {
    //_partOneQuestionList[_currentQuestionIndex].id;
    log('$_logTag saveQuestionIdToDB() message: $message');

    // final list = await GetIt.I.get<ReadAllQuestionNoteUseCase>().perform();
    // log('$_logTag saveQuestionIdToDB() list: ${list!.length}');

    final result = await saveQuestionNoteUseCase.perform(
      QuestionNoteModel(
        partType: PartType.part4,
        id: _partFourQuestionList[_currentQuestionIndex].id,
        note: message,
        questionNum: _partFourQuestionList[_currentQuestionIndex].numbers[0],
      ),
    );
    if (result) {
      _questionNoteIndexMap[
          _partFourQuestionList[_currentQuestionIndex].numbers[0]] = message;
    }
  }

  void userCheckAnswer() {
    for (int i = 0;
        i < _partFourQuestionList[_currentQuestionIndex].numbers.length;
        i++) {
      int questionNumber =
          _partFourQuestionList[_currentQuestionIndex].numbers[i];
      _correctAnsCheckedMap[questionNumber] = UserAnswer.values[
          _partFourQuestionList[_currentQuestionIndex].correctAns[i].index];
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
        in _partFourQuestionList[_currentQuestionIndex].numbers) {
      if (!_userAnswerMap.containsKey(questionNumber)) {
        _userAnswerMap[questionNumber] = UserAnswer.notAnswer;
      }
      if (!_correctAnsCheckedMap.containsKey(questionNumber)) {
        _correctAnsCheckedMap[questionNumber] = UserAnswer.notAnswer;
      }
      userAnswerList.add(_userAnswerMap[questionNumber]);
      correctAnswer.add(_correctAnsCheckedMap[questionNumber]);
    }
    emit(PartFourContentLoaded(
        note: _questionNoteIndexMap[
            _partFourQuestionList[_currentQuestionIndex].numbers[0]],
        partFourModel: _partFourQuestionList[_currentQuestionIndex],
        userAnswer: userAnswerList,
        correctAnswer: correctAnswer,
        questionListSize: _questionListSize,
        currentQuestionNumber: _currentQuestionIndex + 1));
  }

  List<AnswerSheetModel> getAnswerSheetData() {
    _answerSheetModel.clear();
    for (int i = 0; i < _partFourQuestionList.length; i++) {
      for (int j = 0; j < _partFourQuestionList[i].numbers.length; j++) {
        UserAnswer? userAns =
            _userAnswerMap[_partFourQuestionList[i].numbers[j]];
        UserAnswer? correctAns =
            _correctAnsCheckedMap[_partFourQuestionList[i].numbers[j]];
        int userAnsIdx =
            userAns == null ? UserAnswer.notAnswer.index : userAns.index;
        int correctAnsIdx =
            correctAns == null ? UserAnswer.notAnswer.index : correctAns.index;
        _answerSheetModel.add(AnswerSheetModel(
            questionNumber: _partFourQuestionList[i].numbers[j],
            correctAnswerIndex: correctAnsIdx,
            userSelectedIndex: userAnsIdx));
      }
    }
    return _answerSheetModel;
  }

  void goToQuestion(int questionNumber) {
    //log('questionNumber: ${(questionNumber - 32) ~/ 3}, _currentQuestionIndex: $_currentQuestionIndex');
    if ((questionNumber - 71) ~/ 3 == _currentQuestionIndex) return;
    _currentQuestionIndex = _questionNumberIndexMap[questionNumber];
    _playAudio(_partFourQuestionList[_currentQuestionIndex].audioPath);
    notifyData();
  }
}
