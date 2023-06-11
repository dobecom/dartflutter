class WebtoonDetailModel {
  final String title, about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];

  // named parameter 방식
  // WebtoonModel({
  //   required this.title,
  //   required this.thumb,
  //   required this.id,
  // });
}
