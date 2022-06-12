import 'dart:developer';

import 'package:flutter_toeic_quiz2/data/repositories/part_repository/part_repository.dart';
import 'package:flutter_toeic_quiz2/data/repositories/part_repository/part_repository_impl.dart';
import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';
import 'package:flutter_toeic_quiz2/utils/misc.dart';

import '../../data/business_models/part_info_model.dart';

const _logTag = "GetListPartUseCase";

class GetListPartUseCase
    implements BaseUseCase<List<PartInfoModel>, List<String>> {
  static final GetListPartUseCase _singleton = GetListPartUseCase._internal();
  GetListPartUseCase._internal();
  factory GetListPartUseCase() => _singleton;

  final PartRepository repository = PartRepositoryImpl();

  @override
  Future<List<PartInfoModel>> perform(ids) async {
    if (DebugLogEnable) log('$_logTag perform(ids) started');
    List<PartInfoModel> res = await repository.getPartList(ids);
    if (DebugLogEnable) {
      log('$_logTag perform(ids) done items.length: ${res.length}');
    }
    return res;
  }
}
