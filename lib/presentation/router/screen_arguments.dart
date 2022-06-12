class ScreenArguments {
  final String title;
  final String id;
  final List<String> childIds;
  final dynamic otherInfo;

  ScreenArguments({
    required this.title,
    required this.id,
    required this.childIds,
    this.otherInfo,
  });
}
