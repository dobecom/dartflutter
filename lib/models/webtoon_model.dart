class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];

  // named parameter 방식
  // WebtoonModel({
  //   required this.title,
  //   required this.thumb,
  //   required this.id,
  // });
}
