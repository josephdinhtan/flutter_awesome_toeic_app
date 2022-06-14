import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_business_model.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/apis/base_api/base_api.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/base_dto/base_dto.dart';

import '../../../business_models/execute_models/answer_enum.dart';
import '../../../business_models/execute_models/part_six_model.dart';

class PartSixApi implements BaseApi {
  @override
  Future<bool> addItem(BaseDto<BaseBusinessModel> item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems(List<String> hiveIds) {
    // TODO: implement getAllItems
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
  Future<bool> updateItem(BaseDto<BaseBusinessModel> item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  Future<List<PartSixModel>> getFakeQuestionList() async {
    final List<PartSixModel> demoResult = [];

    demoResult.add(PartSixModel(
        statement:
            "The Design Present Conference is an annual event held in Melbourne for graphic-design professionals. The conference is steadily growing in popularity. Last year,it (1)..... more than 3,000 attendees from Australia and around the world. The next Design Present Conference,which will be held from 20 to 23 March,will offer more than 100 workshops, plus keynote speeches and plenary sessions. This year, several opportunities for professional networking will be added. Attendees will have the chance to market (2)..... to firms in several different industries. Periods for networking will be included in the (3)..... each day. Whether you are a design enthusiast, student, freelance designer, or business owner, Design Present has something for you. (4).....",
        questions: [
          'Question demo part 3 - 1',
          'Question demo part 3 - 2',
          'Question demo part 3 - 3',
        ],
        questionNumber: [
          40,
          41,
          42
        ],
        answers: [
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
        ],
        correctAnswer: [
          Answer.A,
          Answer.B,
          Answer.C
        ]));
    demoResult.add(PartSixModel(
        statement:
            'This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, ',
        questions: [
          'Question demo part 3 - 4',
          'Question demo part 3 - 5',
          'Question demo part 3 - 6',
        ],
        questionNumber: [
          43,
          44,
          45
        ],
        answers: [
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
        ],
        correctAnswer: [
          Answer.A,
          Answer.B,
          Answer.C
        ]));
    demoResult.add(PartSixModel(
        statement:
            'This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, ',
        questions: [
          'Question demo part 3 - 7',
          'Question demo part 3 - 8',
          'Question demo part 3 - 9',
        ],
        questionNumber: [
          46,
          47,
          48
        ],
        answers: [
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
        ],
        correctAnswer: [
          Answer.A,
          Answer.B,
          Answer.C
        ]));
    demoResult.add(PartSixModel(
        statement:
            'This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, ',
        questions: [
          'Question demo part 3 - 7',
          'Question demo part 3 - 8',
          'Question demo part 3 - 9',
        ],
        questionNumber: [
          46,
          47,
          48
        ],
        answers: [
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
        ],
        correctAnswer: [
          Answer.A,
          Answer.B,
          Answer.C
        ]));
    demoResult.add(PartSixModel(
        statement:
            'This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, ',
        questions: [
          'Question demo part 3 - 7',
          'Question demo part 3 - 8',
          'Question demo part 3 - 9',
        ],
        questionNumber: [
          46,
          47,
          48
        ],
        answers: [
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
        ],
        correctAnswer: [
          Answer.A,
          Answer.B,
          Answer.C
        ]));
    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(demoResult);
  }
}
