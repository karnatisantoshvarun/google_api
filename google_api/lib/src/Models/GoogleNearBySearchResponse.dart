class GoogleNearBySearchResponse {
  List<dynamic>? results;

  GoogleNearBySearchResponse({this.results});

  GoogleNearBySearchResponse.fromJson(Map<String, dynamic> json) {
    results = json['results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results;
    return data;
  }
}
