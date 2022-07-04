/// id_help : "7"
/// name_help : "dapat menjadi "
/// desc_help : "coba cek"
/// image_help : "https://ecommerce.smaaveros.sch.id/image/help1655968631.png"
/// status : 200
/// response : "Data Ditemukan"

class DetailHelpResponse {
  DetailHelpResponse({
      String? idHelp, 
      String? nameHelp, 
      String? descHelp, 
      String? imageHelp, 
      int? status, 
      String? response,}){
    _idHelp = idHelp;
    _nameHelp = nameHelp;
    _descHelp = descHelp;
    _imageHelp = imageHelp;
    _status = status;
    _response = response;
}

  DetailHelpResponse.fromJson(dynamic json) {
    _idHelp = json['id_help'];
    _nameHelp = json['name_help'];
    _descHelp = json['desc_help'];
    _imageHelp = json['image_help'];
    _status = json['status'];
    _response = json['response'];
  }
  String? _idHelp;
  String? _nameHelp;
  String? _descHelp;
  String? _imageHelp;
  int? _status;
  String? _response;
DetailHelpResponse copyWith({  String? idHelp,
  String? nameHelp,
  String? descHelp,
  String? imageHelp,
  int? status,
  String? response,
}) => DetailHelpResponse(  idHelp: idHelp ?? _idHelp,
  nameHelp: nameHelp ?? _nameHelp,
  descHelp: descHelp ?? _descHelp,
  imageHelp: imageHelp ?? _imageHelp,
  status: status ?? _status,
  response: response ?? _response,
);
  String? get idHelp => _idHelp;
  String? get nameHelp => _nameHelp;
  String? get descHelp => _descHelp;
  String? get imageHelp => _imageHelp;
  int? get status => _status;
  String? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_help'] = _idHelp;
    map['name_help'] = _nameHelp;
    map['desc_help'] = _descHelp;
    map['image_help'] = _imageHelp;
    map['status'] = _status;
    map['response'] = _response;
    return map;
  }

}