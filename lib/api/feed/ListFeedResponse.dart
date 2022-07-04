/// data : [{"id_feed":"1","title_feed":"Promo menarik dari Dazzle.com","desc_feed":"halo guys, ini adalah promo terbaik yang kami tawarkan yaitu sekitar 50% dari harga pakaian ini!!!! ayoo buruan dibeli sebelum kehabisan!","image_feed":"1588131481.png","date_feed":"2020-04-29 10:38:01"},{"id_feed":"2","title_feed":"Promo Headset JBL dengan diskon 40%","desc_feed":"Duo nonumy invidunt ut invidunt invidunt sanctus lorem no est, elitr tempor labore takimata et et, dolor diam dolor diam.","image_feed":"1588824445.png","date_feed":"2020-05-07 11:07:25"},{"id_feed":"5","title_feed":"Motor ducati yang paling  keren dengan diskon 20%","desc_feed":"sadsdfsdfsdf","image_feed":"1639707517.png","date_feed":"2021-12-17 09:18:21"}]
/// status : 200
/// response : "Data Ditemukan"

class ListFeedResponse {
  ListFeedResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  ListFeedResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _status = json['status'];
    _response = json['response'];
  }
  List<Data>? _data;
  int? _status;
  String? _response;
ListFeedResponse copyWith({  List<Data>? data,
  int? status,
  String? response,
}) => ListFeedResponse(  data: data ?? _data,
  status: status ?? _status,
  response: response ?? _response,
);
  List<Data>? get data => _data;
  int? get status => _status;
  String? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['response'] = _response;
    return map;
  }

}

/// id_feed : "1"
/// title_feed : "Promo menarik dari Dazzle.com"
/// desc_feed : "halo guys, ini adalah promo terbaik yang kami tawarkan yaitu sekitar 50% dari harga pakaian ini!!!! ayoo buruan dibeli sebelum kehabisan!"
/// image_feed : "1588131481.png"
/// date_feed : "2020-04-29 10:38:01"

class Data {
  Data({
      String? idFeed, 
      String? titleFeed, 
      String? descFeed, 
      String? imageFeed, 
      String? dateFeed,}){
    _idFeed = idFeed;
    _titleFeed = titleFeed;
    _descFeed = descFeed;
    _imageFeed = imageFeed;
    _dateFeed = dateFeed;
}

  Data.fromJson(dynamic json) {
    _idFeed = json['id_feed'];
    _titleFeed = json['title_feed'];
    _descFeed = json['desc_feed'];
    _imageFeed = json['image_feed'];
    _dateFeed = json['date_feed'];
  }
  String? _idFeed;
  String? _titleFeed;
  String? _descFeed;
  String? _imageFeed;
  String? _dateFeed;
Data copyWith({  String? idFeed,
  String? titleFeed,
  String? descFeed,
  String? imageFeed,
  String? dateFeed,
}) => Data(  idFeed: idFeed ?? _idFeed,
  titleFeed: titleFeed ?? _titleFeed,
  descFeed: descFeed ?? _descFeed,
  imageFeed: imageFeed ?? _imageFeed,
  dateFeed: dateFeed ?? _dateFeed,
);
  String? get idFeed => _idFeed;
  String? get titleFeed => _titleFeed;
  String? get descFeed => _descFeed;
  String? get imageFeed => _imageFeed;
  String? get dateFeed => _dateFeed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_feed'] = _idFeed;
    map['title_feed'] = _titleFeed;
    map['desc_feed'] = _descFeed;
    map['image_feed'] = _imageFeed;
    map['date_feed'] = _dateFeed;
    return map;
  }

}