class Movie {
  late String id;
  late int rank;
  late String title;
  late String imageUrl;
  late List<String> crew;
  late double rating;
  late int ratingCount;

  Movie.fromJson(Map<String,dynamic> json) {
    id = json["id"];
    rank = int.tryParse(json["rank"])??0;
    title = json["fullTitle"];
    imageUrl = json["image"];
    crew = removeFirstSpace(json["crew"]);
    rating = double.tryParse(json["imDbRating"])??0;
    ratingCount = int.tryParse(json["imDbRatingCount"])??0;
  }

  List<String> removeFirstSpace(String names) {
    List<String> namesList = names.split(",");
    for(int i=1;i<namesList.length;i++) {
      namesList[i] = namesList[i].substring(1);
    }
    return namesList;
  }
}