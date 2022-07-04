/// data : [{"id_subcategory":"1561","name_subcategory":"Vivo","desc_subcategory":"Vivo all","image_subcategory":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/subctgry1607882789.png"},{"id_subcategory":"1562","name_subcategory":"Oppo","desc_subcategory":"All oppo","image_subcategory":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/subctgry1607882831.png"},{"id_subcategory":"1563","name_subcategory":"Samsung","desc_subcategory":"All samsung","image_subcategory":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/subctgry1607882882.png"},{"id_subcategory":"1564","name_subcategory":"Xiaomi","desc_subcategory":"All new xiaomi","image_subcategory":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/subctgry1607882920.png"},{"id_subcategory":"1565","name_subcategory":"Infinix","desc_subcategory":"All infinix","image_subcategory":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/subctgry1607883090.png"},{"id_subcategory":"1566","name_subcategory":"Realme","desc_subcategory":"All realme","image_subcategory":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/subctgry1607883446.png"},{"id_subcategory":"1569","name_subcategory":"Vivo 1","desc_subcategory":"Top","image_subcategory":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/subctgry1607922005.png"}]
/// status : 200
/// response : "Data ada"

class ListSubcategoryResponse {
  ListSubcategoryResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  ListSubcategoryResponse.fromJson(dynamic json) {
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
ListSubcategoryResponse copyWith({  List<Data>? data,
  int? status,
  String? response,
}) => ListSubcategoryResponse(  data: data ?? _data,
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

/// id_subcategory : "1561"
/// name_subcategory : "Vivo"
/// desc_subcategory : "Vivo all"
/// image_subcategory : "http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/subctgry1607882789.png"

class Data {
  Data({
      String? idSubcategory, 
      String? nameSubcategory, 
      String? descSubcategory, 
      String? imageSubcategory,}){
    _idSubcategory = idSubcategory;
    _nameSubcategory = nameSubcategory;
    _descSubcategory = descSubcategory;
    _imageSubcategory = imageSubcategory;
}

  Data.fromJson(dynamic json) {
    _idSubcategory = json['id_subcategory'];
    _nameSubcategory = json['name_subcategory'];
    _descSubcategory = json['desc_subcategory'];
    _imageSubcategory = json['image_subcategory'];
  }
  String? _idSubcategory;
  String? _nameSubcategory;
  String? _descSubcategory;
  String? _imageSubcategory;
Data copyWith({  String? idSubcategory,
  String? nameSubcategory,
  String? descSubcategory,
  String? imageSubcategory,
}) => Data(  idSubcategory: idSubcategory ?? _idSubcategory,
  nameSubcategory: nameSubcategory ?? _nameSubcategory,
  descSubcategory: descSubcategory ?? _descSubcategory,
  imageSubcategory: imageSubcategory ?? _imageSubcategory,
);
  String? get idSubcategory => _idSubcategory;
  String? get nameSubcategory => _nameSubcategory;
  String? get descSubcategory => _descSubcategory;
  String? get imageSubcategory => _imageSubcategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_subcategory'] = _idSubcategory;
    map['name_subcategory'] = _nameSubcategory;
    map['desc_subcategory'] = _descSubcategory;
    map['image_subcategory'] = _imageSubcategory;
    return map;
  }

}