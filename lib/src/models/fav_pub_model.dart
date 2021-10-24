class FavPub {
  String? description;
  String? name;
  String? url;

  FavPub({this.description, this.name, this.url});

  FavPub.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }

  static List<FavPub> toList(dynamic json) =>
      (json as List).map((e) => FavPub.fromJson(e)).toList();
}
