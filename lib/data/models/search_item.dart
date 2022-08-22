class SearchItem {
  late String id;
  late String title;
  late String imageUrl;
  late String description;

  SearchItem.fromJson(Map<String,dynamic> json) {
    id = json["id"];
    title = json["title"];
    imageUrl = json["image"];
    description = json["description"];
  }
}