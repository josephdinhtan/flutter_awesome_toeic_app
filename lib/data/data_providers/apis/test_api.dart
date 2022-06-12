import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_business_model.dart';

import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/base_network_object/network_base_object.dart';

import '../../business_models/test_info_model.dart';
import '../network_response_models/test_network_object.dart';
import 'base_api.dart';

class TestApi extends BaseApi<TestInfoModel, TestNetworkObject> {
  @override
  Future<bool> addItem(NetworkBaseObject item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems(List<String> hiveIds) async {
    //return await getFakeList();
    throw UnimplementedError();
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

  // Future<List<TestsInfoModel>> getFakeList() async {
  //   List<TestsInfoModel> list = [];
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 1',
  //       memorySize: '',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       isResourceDownloaded: true,
  //       actualScore: 700,
  //       picturePath: 'resourceUrl',
  //       partIds: [],
  //       id: ''));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 2',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       isResourceDownloaded: true,
  //       actualScore: 615,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 3',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 4',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 5',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 6',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 7',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 8',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 9',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));
  //   list.add(TestsInfoModel(
  //       title: 'Practice Test 10',
  //       memorySize: '35.5M',
  //       numOfQuestion: 200,
  //       ver: 1,
  //       picturePath: 'resourceUrl',
  //       partIds: []));

  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   return Future.value(list);
  // }
}
