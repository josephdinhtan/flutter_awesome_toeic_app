import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_toeic_quiz2/data/business_models/question_note_model.dart';
import 'package:flutter_toeic_quiz2/domain/question_note_use_case/read_all_question_note_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../core_utils/global_configuration.dart';
import '../../../data/business_models/part_model.dart';
import '../../../domain/question_note_use_case/remove_question_note_use_case.dart';

part 'favorite_screen_state.dart';

const _logTag = "FavoriteScreenCubit";

class FavoriteScreenCubit extends Cubit<FavoriteScreenState> {
  FavoriteScreenCubit() : super(FavoriteScreenInitial());

  List<QuestionNoteModel>? _questionNoteList;

  final readQuestionNoteUseCase = GetIt.I.get<ReadAllQuestionNoteUseCase>();
  final removeQuestionNoteUseCase = GetIt.I.get<RemoveQuestionNoteUseCase>();

  Future<void> getFavoriteList() async {
    if (_questionNoteList != null) {
      emit(FavoriteListLoaded(questionNoteList: _questionNoteList));
    }
    //emit(FavoriteListLoading());
    try {
      _questionNoteList = await readQuestionNoteUseCase.perform();
      if (logEnable) {
        log("$_logTag getFavoriteList() Loaded: favoriteList ${_questionNoteList?.length}");
      }
      emit(FavoriteListLoaded(questionNoteList: _questionNoteList));
    } catch (error) {
      emit(Failure());
    }
  }

  void removeAt(int index) {
    if (_questionNoteList == null) return;
    if (_questionNoteList!.length < index) return;
    removeQuestionNoteUseCase.perform(_questionNoteList![index].id);
    _questionNoteList!.removeAt(index);
    emit(FavoriteListChange(questionNoteList: _questionNoteList));
  }

  void changeViewOption(Map<PartType, bool> partTypeMap) {
    final targetList = _questionNoteList!
        .where((o) => partTypeMap[o.partType] == true)
        .toList();
    emit(FavoriteListChange(questionNoteList: targetList));
  }
}
