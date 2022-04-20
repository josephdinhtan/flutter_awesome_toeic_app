import 'package:flutter_toeic_quiz2/data/data_providers/base_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_info_model.dart';

class PartApi extends BaseApi {
  @override
  Future<List<PartInfoModel>> getList() async {
    List<PartInfoModel> list = [];
    list.add(PartInfoModel(partType: PartType.part1, numOfCorrect: 5));
    list.add(PartInfoModel(partType: PartType.part2));
    list.add(PartInfoModel(partType: PartType.part3));
    list.add(PartInfoModel(partType: PartType.part4));
    list.add(PartInfoModel(partType: PartType.part5));
    list.add(PartInfoModel(partType: PartType.part6));
    list.add(PartInfoModel(partType: PartType.part7));

    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(list);
  }

}