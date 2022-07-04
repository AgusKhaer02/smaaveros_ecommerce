

import 'package:shared_preferences/shared_preferences.dart';

class LoginPref{

  // menyimpan data pref baru
  static saveToSharedPref(String idUser, String username) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('id_user', idUser);
    pref.setString('username', username);
  }

  // cek data pref
  static Future<bool> checkPref() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool checkValue = pref.containsKey('id_user');

    return checkValue;
  }

  //menghapus semua pref, untuk logout
  static Future<bool> removePref() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    return true;
  }

  //mengambil pref id dan username
  static Future<Map<String,String?>> getValuePref() async{
    return SharedPreferences.getInstance().then((SharedPreferences sp) {
      return {
        "id_user" : sp.getString('id_user'),
        "username" : sp.getString('username'),
      };
    });
  }

}