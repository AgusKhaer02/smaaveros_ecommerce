/// data : [{"id_product":"27","id_category":"9","id_subcategory":"1567","name_product":"Beat 2015","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607920554.png","price_product":"400000"},{"id_product":"28","id_category":"9","id_subcategory":"1567","name_product":"Vario techno 2012","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607921324.png","price_product":"600000"},{"id_product":"29","id_category":"9","id_subcategory":"1567","name_product":"Vario techno 125 2013","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607921385.png","price_product":"700000"}]
/// status : 200
/// response : "Data ada"

class DetailSubcategoryResponse {
  DetailSubcategoryResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  DetailSubcategoryResponse.fromJson(dynamic json) {
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
DetailSubcategoryResponse copyWith({  List<Data>? data,
  int? status,
  String? response,
}) => DetailSubcategoryResponse(  data: data ?? _data,
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

/// id_product : "27"
/// id_category : "9"
/// id_subcategory : "1567"
/// name_product : "Beat 2015"
/// image_product : "http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607920554.png"
/// price_product : "400000"

class Data {
  Data({
      String? idProduct, 
      String? idCategory, 
      String? idSubcategory, 
      String? nameProduct, 
      String? imageProduct, 
      String? priceProduct,}){
    _idProduct = idProduct;
    _idCategory = idCategory;
    _idSubcategory = idSubcategory;
    _nameProduct = nameProduct;
    _imageProduct = imageProduct;
    _priceProduct = priceProduct;
}

  Data.fromJson(dynamic json) {
    _idProduct = json['id_product'];
    _idCategory = json['id_category'];
    _idSubcategory = json['id_subcategory'];
    _nameProduct = json['name_product'];
    _imageProduct = json['image_product'];
    _priceProduct = json['price_product'];
  }
  String? _idProduct;
  String? _idCategory;
  String? _idSubcategory;
  String? _nameProduct;
  String? _imageProduct;
  String? _priceProduct;
Data copyWith({  String? idProduct,
  String? idCategory,
  String? idSubcategory,
  String? nameProduct,
  String? imageProduct,
  String? priceProduct,
}) => Data(  idProduct: idProduct ?? _idProduct,
  idCategory: idCategory ?? _idCategory,
  idSubcategory: idSubcategory ?? _idSubcategory,
  nameProduct: nameProduct ?? _nameProduct,
  imageProduct: imageProduct ?? _imageProduct,
  priceProduct: priceProduct ?? _priceProduct,
);
  String? get idProduct => _idProduct;
  String? get idCategory => _idCategory;
  String? get idSubcategory => _idSubcategory;
  String? get nameProduct => _nameProduct;
  String? get imageProduct => _imageProduct;
  String? get priceProduct => _priceProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_product'] = _idProduct;
    map['id_category'] = _idCategory;
    map['id_subcategory'] = _idSubcategory;
    map['name_product'] = _nameProduct;
    map['image_product'] = _imageProduct;
    map['price_product'] = _priceProduct;
    return map;
  }

}