class BookInfoModel {
  int id;
  String title;
  String des;
  String author;
  String coverUrl;
  int price;

  BookInfoModel({
    required this.id,
    required this.title,
    required this.des,
    required this.author,
    required this.coverUrl,
    required this.price,
  });

  @override
  String toString() {
    return "{\"id\": $id, \"title\": $title, \"des\": $des, \"author\": $author, \"coverUrl\": $coverUrl, \"price\": $price}";
  }
}
