class WebtoonEpisodeModel {
  final String id, title, rating, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];

  // named parameter 방식
  // WebtoonModel({
  //   required this.title,
  //   required this.thumb,
  //   required this.id,
  // });
}
