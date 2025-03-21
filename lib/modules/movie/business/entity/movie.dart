class Movie {
  String? thumb;
  String? url;
  String? cover;

  Movie({this.thumb, this.url});

  Movie.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    url = json['url'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thumb'] = thumb;
    data['url'] = url;
    data['cover'] = cover;
    return data;
  }
}
