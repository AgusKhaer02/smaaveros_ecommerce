/// message : "Delete Success!"

class DeleteCartResponse {
  DeleteCartResponse({
      String? message,}){
    _message = message;
}

  DeleteCartResponse.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
DeleteCartResponse copyWith({  String? message,
}) => DeleteCartResponse(  message: message ?? _message,
);
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}