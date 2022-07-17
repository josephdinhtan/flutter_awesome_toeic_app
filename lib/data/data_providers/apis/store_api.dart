import 'dart:convert';
// ignore: unused_import
import 'dart:developer';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/question_group_dto.dart';
import '../dtos/book_dto.dart';
import '../dtos/part_dto.dart';
import '../dtos/test_dto.dart';

import '../../download_manager/download_constant.dart';

// ignore: unused_element
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
