import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/question_group_dto.dart';
import '../dtos/book_dto.dart';
import '../dtos/part_dto.dart';
import '../dtos/parts_dto/part_one_dto.dart';
import '../dtos/parts_dto/part_two_dto.dart';
import '../dtos/test_dto.dart';

import '../../download_manager/download_constant.dart';
import '../dtos/parts_dto/part_four_dto.dart';
import '../dtos/parts_dto/part_three_dto.dart';

const _logTag = "StoreApi";

class StoreApi {
  static final List<BookDto> _bookDtoList = [];

  Future<List<QuestionGroupDto>> getQuestionsNetwork(String path) async {
    final List<QuestionGroupDto> questionDtos = [];
    final String jsonString = await _getRawJsonFile(path);
    List<dynamic> jsonMapPartList = jsonDecode(jsonString);
    for (var jsonMapPart in jsonMapPartList) {
      int partTypeIdx = (jsonMapPart['part'] as int) - 1;
      for (var jsonMapQuesGroup in jsonMapPart['content']) {
        final questionDto =
            QuestionGroupDto.fromMap(jsonMapQuesGroup, partTypeIdx);
        questionDtos.add(questionDto);
      }
    }
    return questionDtos;
  }

  Future<List<PartOneDto>> getPartOneListNetwork(String path) async {
    final List<PartOneDto> partOneDtoList = [];
    final String jsonString = await _getRawJsonFile(path);
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final partTwoDto = PartOneDto.fromMap(jsonMap);
      partOneDtoList.add(partTwoDto);
    }
    return partOneDtoList;
  }

  Future<List<PartTwoDto>> getPartTwoListNetwork(String path) async {
    final List<PartTwoDto> partTwoDtoList = [];
    final String jsonString = await _getRawJsonFile(path);
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final partTwoDto = PartTwoDto.fromMap(jsonMap);
      partTwoDtoList.add(partTwoDto);
    }
    return partTwoDtoList;
  }

  Future<List<PartThreeDto>> getPartThreeListNetwork(String path) async {
    final List<PartThreeDto> partThreeDtoList = [];
    final String jsonString = await _getRawJsonFile(path);
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final partThreeDto = PartThreeDto.fromMap(jsonMap);
      partThreeDtoList.add(partThreeDto);
    }
    return partThreeDtoList;
  }

  Future<List<PartFourDto>> getPartFourListNetwork(String path) async {
    final List<PartFourDto> partFourDtoList = [];
    final String jsonString = await _getRawJsonFile(path);
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final partFourDto = PartFourDto.fromMap(jsonMap);
      partFourDtoList.add(partFourDto);
    }
    return partFourDtoList;
  }

  Future<List<PartDto>> getPartListNetwork(String path) async {
    final List<PartDto> partDto = [];
    final String jsonString = await _getRawJsonFile(path);
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final partNetworkObject = PartDto.fromMap(jsonMap);
      partDto.add(partNetworkObject);
    }
    return partDto;
  }

  Future<List<TestDto>> getTestListNetwork(String path) async {
    final List<TestDto> testDto = [];
    final String jsonString = await _getRawJsonFile(path);
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final testNetworkObject = TestDto.fromMap(jsonMap);
      testDto.add(testNetworkObject);
    }
    return testDto;
  }

  Future<List<BookDto>> getBookListNetwork() async {
    if (_bookDtoList.isEmpty) {
      await _updateNetworkBookInfoModelList();
    }
    return _bookDtoList;
  }

  Future<String> _getDownloadUrlFromPath(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    return await ref.getDownloadURL();
  }

  Future<void> _updateNetworkBookInfoModelList() async {
    _bookDtoList.clear();
    final String jsonString = await _getRawBooksJsonFile();
    List<dynamic> jsonMapList = jsonDecode(jsonString);
    for (var jsonMap in jsonMapList) {
      final bookDto = BookDto.fromMap(jsonMap);
      bookDto.fullCoverUrl = await _getDownloadUrlFromPath(bookDto.coverUrl);
      _bookDtoList.add(bookDto);
    }
  }

  static Future<String> _getRawBooksJsonFile() async {
    const path = DownloadConstant.booksJsonFileBaseRelativePath;
    final ref = FirebaseStorage.instance.ref(path);
    final Uint8List? downloadedData = await ref.getData();
    final res = utf8.decode(downloadedData!);
    return res;
  }

  static Future<String> _getRawJsonFile(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final Uint8List? downloadedData = await ref.getData();
    final res = utf8.decode(downloadedData!);
    return res;
  }
}
