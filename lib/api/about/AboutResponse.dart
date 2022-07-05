/// data : {"app_name":"Averos Ecommerce","app_desc":"E-commerce adalah proses penjualan dan pembelian barang secara elektronik. Perkembangan teknologi saat ini memudahkan kita dalam melakukan berbagai kegiatan, termasuk jual-beli. Kini, kegiatan perdagangan bisa dilakukan melalui media elektronik, khususnya internet, yang sering disebut electronic commerce atau e-commerce.","contact":"+62895342273759"}
/// status : 200
/// response : "Data Ditemukan"

class AboutResponse {
  AboutResponse({
      Data? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  AboutResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
    _response = json['response'];
  }
  Data? _data;
  int? _status;
  String? _response;
AboutResponse copyWith({  Data? data,
  int? status,
  String? response,
}) => AboutResponse(  data: data ?? _data,
  status: status ?? _status,
  response: response ?? _response,
);
  Data? get data => _data;
  int? get status => _status;
  String? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    map['response'] = _response;
    return map;
  }

}

/// app_name : "Averos Ecommerce"
/// app_desc : "E-commerce adalah proses penjualan dan pembelian barang secara elektronik. Perkembangan teknologi saat ini memudahkan kita dalam melakukan berbagai kegiatan, termasuk jual-beli. Kini, kegiatan perdagangan bisa dilakukan melalui media elektronik, khususnya internet, yang sering disebut electronic commerce atau e-commerce."
/// contact : "+62895342273759"

class Data {
  Data({
      String? appName, 
      String? appDesc, 
      String? contact,}){
    _appName = appName;
    _appDesc = appDesc;
    _contact = contact;
}

  Data.fromJson(dynamic json) {
    _appName = json['app_name'];
    _appDesc = json['app_desc'];
    _contact = json['contact'];
  }
  String? _appName;
  String? _appDesc;
  String? _contact;
Data copyWith({  String? appName,
  String? appDesc,
  String? contact,
}) => Data(  appName: appName ?? _appName,
  appDesc: appDesc ?? _appDesc,
  contact: contact ?? _contact,
);
  String? get appName => _appName;
  String? get appDesc => _appDesc;
  String? get contact => _contact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['app_name'] = _appName;
    map['app_desc'] = _appDesc;
    map['contact'] = _contact;
    return map;
  }

}