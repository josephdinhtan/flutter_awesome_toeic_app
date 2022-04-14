class PartInfoModel {
  static final _defaultNumOfQuestion = [6, 25, 39, 30, 30, 16, 54];
  final PartType partType;
  String? boxId; // only visiable in DB
  int numOfQuestion;
  int numOfCorrect;

  PartInfoModel({
    required this.partType,
    this.numOfQuestion = 0,
    this.numOfCorrect = 0,
  }) {
    if(numOfQuestion == 0) {
      numOfQuestion = _defaultNumOfQuestion[partType.index];
    }
  }
}

enum PartType { part1, part2, part3, part4, part5, part6, part7 }
