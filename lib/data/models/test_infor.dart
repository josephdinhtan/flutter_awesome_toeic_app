class TestInfo {
  final String title;
  final String size;
  final int questionNumber;
  final int ver;
  final String resourceUrl;
  final int score; // only visiable in DB
  bool downloaded; // only visiable in DB
  String? boxId; // only visiable in DB
  TestInfo({
    required this.title,
    required this.size,
    required this.questionNumber,
    required this.ver,
    required this.resourceUrl,
    this.score = -1,
    this.downloaded = false,
    this.boxId,
  });
}
