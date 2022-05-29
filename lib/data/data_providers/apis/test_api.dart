import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_model.dart';

import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/network_base_object.dart';

import '../../business_models/test_info_model.dart';
import '../network_response_models/network_test_object.dart';
import 'base_api.dart';

class TestApi extends BaseApi<TestInfoModel, NetworkTestObject> {

  @override
  Future<bool> addItem(NetworkBaseObject item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems() async {
    return await getFakeList();
  }

  @override
  Future<BaseBusinessModel?> getItem(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> removeItem(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem(NetworkBaseObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  Future<List<TestInfoModel>> getFakeList() async {
    List<TestInfoModel> list = [];
    list.add(TestInfoModel(
        title: 'Practice Test 1',
        memorySize: '',
        questionNumber: 200,
        version: 1,
        isDownloaded: true,
        actualScore: 700,
        boxId: "demo BoxID",
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 2',
        memorySize: '35.5M',
        questionNumber: 200,
        isDownloaded: true,
        actualScore: 615,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 3',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 4',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 5',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 6',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 7',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 8',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 9',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(
        title: 'Practice Test 10',
        memorySize: '35.5M',
        questionNumber: 200,
        version: 1,
        resourceUrl: 'resourceUrl'));

    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(list);
  }
}
