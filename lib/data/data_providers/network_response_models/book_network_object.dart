// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_toeic_quiz2/data/business_models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/base_network_object/network_base_object.dart';
import 'package:hive/hive.dart';

import '../../data_source/hive_objects/book_hive_object/book_hive_object.dart';

class BookNetworkObject implements NetworkBaseObject<BookInfoModel> {
  String title;
  String id;
  String des;
  String author;
  String cover_url;
  String full_cover_url;
  String price;
  String tests_url;
  List<String> tests_ids;
  bool isBought;

  BookNetworkObject({
    required this.title,
    required this.id,
    required this.des,
    required this.author,
    required this.cover_url,
    required this.price,
    required this.tests_url,
    required this.tests_ids,
    this.isBought = false,
    this.full_cover_url = "",
  });

  @override
  BookInfoModel toBusinessModel() {
    return BookInfoModel(
      id: id,
      testIds: tests_ids,
      title: title,
      des: des,
      author: author,
      coverPath: cover_url,
      price: price,
    );
  }

  HiveObject toHiveObject() {
    return BookHiveObject(
      id: id,
      title: title,
      des: des,
      author: author,
      coverPath: cover_url,
      testIds: tests_ids,
      price: price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'des': des,
      'author': author,
      'cover_url': cover_url,
      'price': price,
      'tests_url': tests_url,
      'tests_ids': tests_ids,
    };
  }

  factory BookNetworkObject.fromMap(Map<String, dynamic> map) {
    return BookNetworkObject(
      title: map['title'] as String,
      id: map['id'] as String,
      des: map['des'] as String,
      author: map['author'] as String,
      cover_url: map['cover_url'] as String,
      price: map['price'] as String,
      tests_url: map['tests_url'] as String,
      tests_ids: List<String>.from((map['tests_ids'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookNetworkObject.fromJson(String source) =>
      BookNetworkObject.fromMap(json.decode(source) as Map<String, dynamic>);
}
