/// result : [{"id_cart":"209","id_product":"1238","name_product":"Resistor 220 , 1/4 watt ","price_product":"500","image_product":"https://ecommerce.smaaveros.sch.id/image/prdct1655780228.png","name_category":"Resistor","quantity":"2"},{"id_cart":"207","id_product":null,"name_product":null,"price_product":null,"image_product":"https://ecommerce.smaaveros.sch.id/image/","name_category":null,"quantity":"5"},{"id_cart":"208","id_product":null,"name_product":null,"price_product":null,"image_product":"https://ecommerce.smaaveros.sch.id/image/","name_category":null,"quantity":"2"}]

class ListCartResponse {
  ListCartResponse({
      List<Result>? result,}){
    _result = result;
}

  ListCartResponse.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
  }
  List<Result>? _result;
ListCartResponse copyWith({  List<Result>? result,
}) => ListCartResponse(  result: result ?? _result,
);
  List<Result>? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id_cart : "209"
/// id_product : "1238"
/// name_product : "Resistor 220 , 1/4 watt "
/// price_product : "500"
/// image_product : "https://ecommerce.smaaveros.sch.id/image/prdct1655780228.png"
/// name_category : "Resistor"
/// quantity : "2"

class Result {
  Result({
      String? idCart, 
      String? idProduct, 
      String? nameProduct, 
      String? priceProduct, 
      String? imageProduct, 
      String? nameCategory, 
      String? quantity,}){
    _idCart = idCart;
    _idProduct = idProduct;
    _nameProduct = nameProduct;
    _priceProduct = priceProduct;
    _imageProduct = imageProduct;
    _nameCategory = nameCategory;
    _quantity = quantity;
}

  Result.fromJson(dynamic json) {
    _idCart = json['id_cart'];
    _idProduct = json['id_product'];
    _nameProduct = json['name_product'];
    _priceProduct = json['price_product'];
    _imageProduct = json['image_product'];
    _nameCategory = json['name_category'];
    _quantity = json['quantity'];
  }
  String? _idCart;
  String? _idProduct;
  String? _nameProduct;
  String? _priceProduct;
  String? _imageProduct;
  String? _nameCategory;
  String? _quantity;
Result copyWith({  String? idCart,
  String? idProduct,
  String? nameProduct,
  String? priceProduct,
  String? imageProduct,
  String? nameCategory,
  String? quantity,
}) => Result(  idCart: idCart ?? _idCart,
  idProduct: idProduct ?? _idProduct,
  nameProduct: nameProduct ?? _nameProduct,
  priceProduct: priceProduct ?? _priceProduct,
  imageProduct: imageProduct ?? _imageProduct,
  nameCategory: nameCategory ?? _nameCategory,
  quantity: quantity ?? _quantity,
);
  String? get idCart => _idCart;
  String? get idProduct => _idProduct;
  String? get nameProduct => _nameProduct;
  String? get priceProduct => _priceProduct;
  String? get imageProduct => _imageProduct;
  String? get nameCategory => _nameCategory;
  String? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_cart'] = _idCart;
    map['id_product'] = _idProduct;
    map['name_product'] = _nameProduct;
    map['price_product'] = _priceProduct;
    map['image_product'] = _imageProduct;
    map['name_category'] = _nameCategory;
    map['quantity'] = _quantity;
    return map;
  }

}