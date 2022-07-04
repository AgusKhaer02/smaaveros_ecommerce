/// result : {"quantity":"2"}
/// message : "get data success!"

class CheckCartResponse {
  Result? _result;
  String? _message;

  Result? get result => _result;
  String? get message => _message;

  CheckCartResponse({
      Result? result, 
      String? message}){
    _result = result;
    _message = message;
}

  CheckCartResponse.fromJson(dynamic json) {
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// quantity : "2"

class Result {
  String? _quantity;

  String? get quantity => _quantity;

  Result({
      String? quantity}){
    _quantity = quantity;
}

  Result.fromJson(dynamic json) {
    _quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['quantity'] = _quantity;
    return map;
  }

}