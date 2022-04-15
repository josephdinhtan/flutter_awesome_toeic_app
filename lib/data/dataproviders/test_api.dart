
import '../models/test_info_model.dart';
import 'base_api.dart';

class TestApi extends BaseApi<List<TestInfoModel>> {
  @override
  Future<List<TestInfoModel>> getList() async {
    // TODO: implement get from remote with http request and should be repose a Reponse folder
    List<TestInfoModel> list = [];
    list.add(TestInfoModel(title: 'Practice Test 1', size: '', questionNumber: 200, ver: 1, resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(title: 'Practice Test 2', size: '35.5M', questionNumber: 200, ver: 1, resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(title: 'Practice Test 3', size: '35.5M', questionNumber: 200, ver: 1, resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(title: 'Practice Test 4', size: '35.5M', questionNumber: 200, ver: 1, resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(title: 'Practice Test 5', size: '35.5M', questionNumber: 200, ver: 1, resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(title: 'Practice Test 6', size: '35.5M', questionNumber: 200, ver: 1, resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(title: 'Practice Test 7', size: '35.5M', questionNumber: 200, ver: 1, resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(title: 'Practice Test 8', size: '35.5M', questionNumber: 200, ver: 1, resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(title: 'Practice Test 9', size: '35.5M', questionNumber: 200, ver: 1, resourceUrl: 'resourceUrl'));
    list.add(TestInfoModel(title: 'Practice Test 10', size: '35.5M', questionNumber: 200, ver: 1, resourceUrl: 'resourceUrl'));

    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(list);
  }
}
