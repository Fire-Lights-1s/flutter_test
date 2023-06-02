class Webtoonmodel {
  final String title, thumb, id;

  Webtoonmodel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
