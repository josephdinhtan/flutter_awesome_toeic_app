// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_toeic_quiz2/data/business_models/book_model.dart';
import 'package:hive/hive.dart';

import '../hive_objects/book_hive_object/book_hive_object.dart';
import 'base_dto/base_dto.dart';

class BookDto implements BaseDto<BookModel> {
  String title;
  String id;
  String des;
  String author;
  String coverUrl;
  String fullCoverUrl;
  String price;
  String testUrls;
  List<String> testIds;
  bool isBought;

  BookDto({
    required this.title,
    required this.id,
    required this.des,
    required this.author,
    required this.coverUrl,
    required this.price,
    required this.testUrls,
    required this.testIds,
    this.isBought = false,
    this.fullCoverUrl = "",
  });

  @override
  BookModel toBusinessModel() {
    return BookModel(
      id: id,
      testIds: testIds,
      title: title,
      des: des,
      author: author,
      coverPath: coverUrl,
      price: price,
    );
  }

  HiveObject toHiveObject() {
    return BookHiveObject(
      id: id,
      title: title,
      des: des,
      author: author,
      coverPath: coverUrl,
      testIds: testIds,
      price: price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'des': des,
      'author': author,
      'cover_url': coverUrl,
      'price': price,
      'tests_url': testUrls,
      'tests_ids': testIds,
    };
  }

  factory BookDto.fromMap(Map<String, dynamic> map) {
    return BookDto(
      title: map['title'] as String,
      id: map['id'] as String,
      des: map['des'] as String,
      author: map['author'] as String,
      coverUrl: map['cover_url'] as String,
      price: map['price'] as String,
      testUrls: map['tests_url'] as String,
      testIds: List<String>.from((map['tests_ids'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookDto.fromJson(String source) =>
      BookDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
