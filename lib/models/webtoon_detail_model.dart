class WebtoonDetailModel {
  final String title, about, genre, age;
  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        age = json['age'],
        about = json['about'],
        genre = json['genre'];
}
