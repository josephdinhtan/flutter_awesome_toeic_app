import 'dart:developer';

import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';
import 'package:flutter_toeic_quiz2/data/repositories/part_repository/part_repository.dart';
import 'package:flutter_toeic_quiz2/data/repositories/part_repository/part_repository_impl.dart';
import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';

import '../../data/business_models/part_model.dart';

const _logTag = "GetListPartUseCase";

class GetListPartUseCase implements BaseUseCase<List<PartModel>, List<String>> {
  static final GetListPartUseCase _singleton = GetListPartUseCase._internal();
  GetListPartUseCase._internal();
  factory GetListPartUseCase() => _singleton;

  final PartRepository repository = PartRepositoryImpl();

  @override
  Future<List<PartModel>> perform(ids) async {
    if (LogEnable) log('$_logTag perform(ids) started');
    List<PartModel> res = await repository.getPartList(ids);
    if (LogEnable) {
      log('$_logTag perform(ids) done items.length: ${res.length}');
    }
    return res;
  }
}
