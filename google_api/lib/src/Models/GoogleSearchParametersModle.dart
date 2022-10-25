class GoogleSearchParametersModle {
  String keyword;
  String location;
  int radius;
  String type;
  String key;

  GoogleSearchParametersModle(
      this.keyword, this.location, this.key, this.radius, this.type);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['keyword'] = keyword;
    data['location'] = location;
    data['radius'] = radius;
    data['type'] = type;
    data['key'] = key;
    return data;
  }
}
