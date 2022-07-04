/// result : {"id_user":"110132","username":"Dimas"}
/// message : "login user successful"

class LoginResponse {
  LoginResponse({
      Result? result, 
      String? message,}){
    _result = result;
    _message = message;
}

  LoginResponse.fromJson(dynamic json) {
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _message = json['message'];
  }
  Result? _result;
  String? _message;
LoginResponse copyWith({  Result? result,
  String? message,
}) => LoginResponse(  result: result ?? _result,
  message: message ?? _message,
);
  Result? get result => _result;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// id_user : "110132"
/// username : "Dimas"

class Result {
  Result({
      String? idUser, 
      String? username,}){
    _idUser = idUser;
    _username = username;
}

  Result.fromJson(dynamic json) {
    _idUser = json['id_user'];
    _username = json['username'];
  }
  String? _idUser;
  String? _username;
Result copyWith({  String? idUser,
  String? username,
}) => Result(  idUser: idUser ?? _idUser,
  username: username ?? _username,
);
  String? get idUser => _idUser;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_user'] = _idUser;
    map['username'] = _username;
    return map;
  }

}