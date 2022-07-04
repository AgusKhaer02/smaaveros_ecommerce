/// message : "Edit Success!"

class EditCartResponse {
  String? _message;

  String? get message => _message;

  EditCartResponse({
      String? message}){
    _message = message;
}

  EditCartResponse.fromJson(dynamic json) {
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}