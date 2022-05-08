class NetworkTestInfoModel {
  final String title;
  final String size;
  final int questionNumber;
  final String resourceUrl;
  final int ver;

  NetworkTestInfoModel({
    required this.title,
    required this.size,
    required this.questionNumber,
    required this.resourceUrl,
    required this.ver,
  });

  factory NetworkTestInfoModel.fromJson(dynamic jsonMap) {
    return NetworkTestInfoModel(
      title: jsonMap['title'] as String,
      size: jsonMap['size'] as String,
      questionNumber: jsonMap['question_number'] as int,
      resourceUrl: jsonMap['resource_url'] as String,
      ver: jsonMap['ver'] as int,
    );
  }
}
