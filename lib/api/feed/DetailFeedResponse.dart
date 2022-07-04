/// id_feed : "2"
/// title_feed : "Promo Headset JBL dengan diskon 40%"
/// desc_feed : "Duo nonumy invidunt ut invidunt invidunt sanctus lorem no est, elitr tempor labore takimata et et, dolor diam dolor diam."
/// image_feed : "1588824445.png"
/// date_feed : "2020-05-07 11:07:25"
/// status : 200
/// response : "Data Ditemukan"

class DetailFeedResponse {
  DetailFeedResponse({
      String? idFeed, 
      String? titleFeed, 
      String? descFeed, 
      String? imageFeed, 
      String? dateFeed, 
      int? status, 
      String? response,}){
    _idFeed = idFeed;
    _titleFeed = titleFeed;
    _descFeed = descFeed;
    _imageFeed = imageFeed;
    _dateFeed = dateFeed;
    _status = status;
    _response = response;
}

  DetailFeedResponse.fromJson(dynamic json) {
    _idFeed = json['id_feed'];
    _titleFeed = json['title_feed'];
    _descFeed = json['desc_feed'];
    _imageFeed = json['image_feed'];
    _dateFeed = json['date_feed'];
    _status = json['status'];
    _response = json['response'];
  }
  String? _idFeed;
  String? _titleFeed;
  String? _descFeed;
  String? _imageFeed;
  String? _dateFeed;
  int? _status;
  String? _response;
DetailFeedResponse copyWith({  String? idFeed,
  String? titleFeed,
  String? descFeed,
  String? imageFeed,
  String? dateFeed,
  int? status,
  String? response,
}) => DetailFeedResponse(  idFeed: idFeed ?? _idFeed,
  titleFeed: titleFeed ?? _titleFeed,
  descFeed: descFeed ?? _descFeed,
  imageFeed: imageFeed ?? _imageFeed,
  dateFeed: dateFeed ?? _dateFeed,
  status: status ?? _status,
  response: response ?? _response,
);
  String? get idFeed => _idFeed;
  String? get titleFeed => _titleFeed;
  String? get descFeed => _descFeed;
  String? get imageFeed => _imageFeed;
  String? get dateFeed => _dateFeed;
  int? get status => _status;
  String? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_feed'] = _idFeed;
    map['title_feed'] = _titleFeed;
    map['desc_feed'] = _descFeed;
    map['image_feed'] = _imageFeed;
    map['date_feed'] = _dateFeed;
    map['status'] = _status;
    map['response'] = _response;
    return map;
  }

}