import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/business_models/test_model.dart';
import 'package:flutter_toeic_quiz2/view_model/test_screen_cubit/test_list_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../core_utils/global_configuration.dart';
import '../../core_utils/score_calculator.dart';
import '../../data/business_models/part_model.dart';
import '../../domain/get_book_detail_use_case/get_part_list_use_case.dart';
import '../../domain/get_book_detail_use_case/save_part_list_use_case.dart';
import '../../domain/get_book_detail_use_case/save_score_test_use_case.dart';

part 'part_list_state.dart';

const _logTag = "PartListCubit";

class PartListCubit extends Cubit<PartListState> {
  final getPartListUseCase = GetIt.I.get<GetPartListUseCase>();
  final savePartListUseCase = GetIt.I.get<SavePartListUseCase>();
  final saveScoreTestUseCase = GetIt.I.get<SaveScoreTestUseCase>();

  List<PartModel> partList = [];
  int _listeningCorrectNum = 0;
  int _readingCorrectNum = 0;
  late String _testId;
  late TestListCubit _testListCubit;
  late bool _isFirstTest;

  PartListCubit() : super(PartListInitial());

  Future<void> getInitContent(
      {required List<String> partIds,
      required String testId,
      required TestListCubit testListCubit}) async {
    emit(PartListLoading());
    _testId = testId;
    _testListCubit = testListCubit;
    _isFirstTest = testListCubit.isFirstTest(testId);
    try {
      if (logEnable) log('$_logTag getInitContent(ids) started');
      partList = await getPartListUseCase.perform(partIds);
      if (logEnable) {
        log('$_logTag getInitContent() done items.length: ${partList.length}');
      }

      _listeningCorrectNum = 0;
      _readingCorrectNum = 0;
      for (final partModel in partList) {
        if (partModel.partType.index <= PartType.part4.index) {
          _listeningCorrectNum += partModel.numOfCorrect;
        } else {
          _readingCorrectNum += partModel.numOfCorrect;
        }
      }
      emit(PartListLoaded(
        isFirstTest: _isFirstTest,
        partListModel: partList,
        listeningScore: calculateListeningScore(_listeningCorrectNum),
        readingScore: calculateReadingScore(_readingCorrectNum),
      ));
    } catch (error) {
      emit(Failure());
    }
  }

// call apter user
  Future<void> updateScore(Map<PartType, int> mapPartTypeCorrectNum) async {
    _listeningCorrectNum = 0;
    _readingCorrectNum = 0;
    for (final partModel in partList) {
      partModel.numOfCorrect = mapPartTypeCorrectNum[partModel.partType] ?? 0;
      if (partModel.partType.index <= PartType.part4.index) {
        _listeningCorrectNum += partModel.numOfCorrect;
      } else {
        _readingCorrectNum += partModel.numOfCorrect;
      }
    }
    final listeningScore = calculateListeningScore(_listeningCorrectNum);
    final readingScore = calculateListeningScore(_readingCorrectNum);
    await savePartListUseCase.perform(partList);
    await saveScoreTestUseCase
        .perform([_testId, (listeningScore + readingScore)]);
    _testListCubit.refresh(); // update UI for testscreen
    _isFirstTest = false;
    emit(PartListLoaded(
      isFirstTest: _isFirstTest,
      partListModel: partList,
      listeningScore: listeningScore,
      readingScore: readingScore,
    ));
  }
}
