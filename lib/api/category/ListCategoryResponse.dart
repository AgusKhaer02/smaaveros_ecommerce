/// data : [{"id_category":"7","name_category":"HP Android Baru","desc_category":"Oppo\r\nVivo\r\nSamsung\r\nXiaomi\r\nPoco\r\nDll","image_category":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/1607881517.png"},{"id_category":"8","name_category":"Hp Android Bekas Bagus","desc_category":"Bird at bird floor a than his that back lamplight was, an above there a i. That something my fearing.","image_category":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/1607881736.png"},{"id_category":"9","name_category":"Motor Bekas Matic murah","desc_category":"Quaff tapping these i ever sure above, sad his a burned lamplight nothing what his radiant lies. Adore scarce shadow.","image_category":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/1607881854.png"},{"id_category":"10","name_category":"Motor Sawah dan Ngarit","desc_category":"Quaff tapping these i ever sure above, sad his a burned lamplight nothing what his radiant lies. Adore scarce shadow.","image_category":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/1607882059.png"},{"id_category":"11","name_category":"Mebel jati","desc_category":"Nothing here then gently stronger whether bore, so in prophet stood longer god, the followed bird bust clasp that ember.","image_category":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/1607882243.png"},{"id_category":"12","name_category":"All Elektronik","desc_category":"Barang - Barang Elektronik","image_category":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/1607672430.png"},{"id_category":"13","name_category":"All Furniture dan rumah tangga","desc_category":"Berisi barang mebel,springbed,barang dapur dll","image_category":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/1607672507.png"},{"id_category":"14","name_category":"Alat-alat Pertanian","desc_category":"Motor bekas matic,bebek dan sport yang berkualitas dengan harga terjangkau","image_category":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/1607882442.png"},{"id_category":"15","name_category":"Motor Sport","desc_category":"Menampilkan beragam merk motor sport","image_category":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/ctgry1639704936.png"}]
/// status : 0
/// response : "Data Ditemukan"

class ListCategoryResponse {
  ListCategoryResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  ListCategoryResponse.fromJson(dynamic json) {
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
ListCategoryResponse copyWith({  List<Data>? data,
  int? status,
  String? response,
}) => ListCategoryResponse(  data: data ?? _data,
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

/// id_category : "7"
/// name_category : "HP Android Baru"
/// desc_category : "Oppo\r\nVivo\r\nSamsung\r\nXiaomi\r\nPoco\r\nDll"
/// image_category : "http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/1607881517.png"

class Data {
  Data({
      String? idCategory, 
      String? nameCategory, 
      String? descCategory, 
      String? imageCategory,}){
    _idCategory = idCategory;
    _nameCategory = nameCategory;
    _descCategory = descCategory;
    _imageCategory = imageCategory;
}

  Data.fromJson(dynamic json) {
    _idCategory = json['id_category'];
    _nameCategory = json['name_category'];
    _descCategory = json['desc_category'];
    _imageCategory = json['image_category'];
  }
  String? _idCategory;
  String? _nameCategory;
  String? _descCategory;
  String? _imageCategory;
Data copyWith({  String? idCategory,
  String? nameCategory,
  String? descCategory,
  String? imageCategory,
}) => Data(  idCategory: idCategory ?? _idCategory,
  nameCategory: nameCategory ?? _nameCategory,
  descCategory: descCategory ?? _descCategory,
  imageCategory: imageCategory ?? _imageCategory,
);
  String? get idCategory => _idCategory;
  String? get nameCategory => _nameCategory;
  String? get descCategory => _descCategory;
  String? get imageCategory => _imageCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_category'] = _idCategory;
    map['name_category'] = _nameCategory;
    map['desc_category'] = _descCategory;
    map['image_category'] = _imageCategory;
    return map;
  }

}