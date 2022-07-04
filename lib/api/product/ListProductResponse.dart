/// data : [{"id_product":"27","name_product":"Beat 2015","name_category":"Motor Bekas Matic murah","desc_product":"Apik","stock_product":"1","price_product":"400000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607920554.png","id_category":"9"},{"id_product":"28","name_product":"Vario techno 2012","name_category":"Motor Bekas Matic murah","desc_product":"Mantap","stock_product":"1","price_product":"600000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607921324.png","id_category":"9"},{"id_product":"29","name_product":"Vario techno 125 2013","name_category":"Motor Bekas Matic murah","desc_product":"Jossss","stock_product":"1","price_product":"700000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607921385.png","id_category":"9"},{"id_product":"30","name_product":"Mio soul 2010","name_category":"Motor Bekas Matic murah","desc_product":"Soul 2010","stock_product":"1","price_product":"400000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607921540.png","id_category":"9"},{"id_product":"31","name_product":"Mio soul 2011","name_category":"Motor Bekas Matic murah","desc_product":"Josss","stock_product":"1","price_product":"400000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607921705.png","id_category":"9"},{"id_product":"32","name_product":"Mio sporti 2012","name_category":"Motor Bekas Matic murah","desc_product":"Top","stock_product":"1","price_product":"400000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607921907.png","id_category":"9"},{"id_product":"33","name_product":"Bangko besar","name_category":"Mebel jati","desc_product":"Jose pol","stock_product":"1","price_product":"400000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607922197.png","id_category":"11"},{"id_product":"34","name_product":"Lemari 2 pintu","name_category":"Mebel jati","desc_product":"Murah","stock_product":"1","price_product":"400000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607922396.png","id_category":"11"},{"id_product":"35","name_product":"Lemari 3 pintu","name_category":"Mebel jati","desc_product":"Sippp","stock_product":"1","price_product":"400000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607922679.png","id_category":"11"},{"id_product":"37","name_product":"Vivo y91c","name_category":"HP Android Baru","desc_product":"Joosss","stock_product":"1","price_product":"250000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1639711736.png","id_category":"7"},{"id_product":"38","name_product":"Vivo y12i","name_category":"HP Android Baru","desc_product":"Top","stock_product":"1","price_product":"250000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607928059.png","id_category":"7"},{"id_product":"39","name_product":"Vivo y20","name_category":"HP Android Baru","desc_product":"Apik","stock_product":"1","price_product":"285000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607928110.png","id_category":"7"},{"id_product":"40","name_product":"Vivo y20s","name_category":"HP Android Baru","desc_product":"Vivo y20s","stock_product":"1","price_product":"405000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607928259.png","id_category":"7"},{"id_product":"41","name_product":"Vivo y30i","name_category":"HP Android Baru","desc_product":"Vivo y30i","stock_product":"2","price_product":"310000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607928320.png","id_category":"7"},{"id_product":"42","name_product":"Vivo y30","name_category":"HP Android Baru","desc_product":"Vivo y30","stock_product":"2","price_product":"350000","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607928430.png","id_category":"7"},{"id_product":"43","name_product":"Coba","name_category":"Mebel jati","desc_product":"Apik","stock_product":"1","price_product":"520","image_product":"http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1608083525.png","id_category":"11"}]
/// status : 0
/// response : "Data Ditemukan"

class ListProductResponse {
  ListProductResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  ListProductResponse.fromJson(dynamic json) {
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
ListProductResponse copyWith({  List<Data>? data,
  int? status,
  String? response,
}) => ListProductResponse(  data: data ?? _data,
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
/// name_product : "Beat 2015"
/// name_category : "Motor Bekas Matic murah"
/// desc_product : "Apik"
/// stock_product : "1"
/// price_product : "400000"
/// image_product : "http://localhost/WEB_AGUS/webservices_tokolauwba_flutter/image/prdct1607920554.png"
/// id_category : "9"

class Data {
  Data({
      String? idProduct, 
      String? nameProduct, 
      String? nameCategory, 
      String? descProduct, 
      String? stockProduct, 
      String? priceProduct, 
      String? imageProduct, 
      String? idCategory,}){
    _idProduct = idProduct;
    _nameProduct = nameProduct;
    _nameCategory = nameCategory;
    _descProduct = descProduct;
    _stockProduct = stockProduct;
    _priceProduct = priceProduct;
    _imageProduct = imageProduct;
    _idCategory = idCategory;
}

  Data.fromJson(dynamic json) {
    _idProduct = json['id_product'];
    _nameProduct = json['name_product'];
    _nameCategory = json['name_category'];
    _descProduct = json['desc_product'];
    _stockProduct = json['stock_product'];
    _priceProduct = json['price_product'];
    _imageProduct = json['image_product'];
    _idCategory = json['id_category'];
  }
  String? _idProduct;
  String? _nameProduct;
  String? _nameCategory;
  String? _descProduct;
  String? _stockProduct;
  String? _priceProduct;
  String? _imageProduct;
  String? _idCategory;
Data copyWith({  String? idProduct,
  String? nameProduct,
  String? nameCategory,
  String? descProduct,
  String? stockProduct,
  String? priceProduct,
  String? imageProduct,
  String? idCategory,
}) => Data(  idProduct: idProduct ?? _idProduct,
  nameProduct: nameProduct ?? _nameProduct,
  nameCategory: nameCategory ?? _nameCategory,
  descProduct: descProduct ?? _descProduct,
  stockProduct: stockProduct ?? _stockProduct,
  priceProduct: priceProduct ?? _priceProduct,
  imageProduct: imageProduct ?? _imageProduct,
  idCategory: idCategory ?? _idCategory,
);
  String? get idProduct => _idProduct;
  String? get nameProduct => _nameProduct;
  String? get nameCategory => _nameCategory;
  String? get descProduct => _descProduct;
  String? get stockProduct => _stockProduct;
  String? get priceProduct => _priceProduct;
  String? get imageProduct => _imageProduct;
  String? get idCategory => _idCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_product'] = _idProduct;
    map['name_product'] = _nameProduct;
    map['name_category'] = _nameCategory;
    map['desc_product'] = _descProduct;
    map['stock_product'] = _stockProduct;
    map['price_product'] = _priceProduct;
    map['image_product'] = _imageProduct;
    map['id_category'] = _idCategory;
    return map;
  }

}