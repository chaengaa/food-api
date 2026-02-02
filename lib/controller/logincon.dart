import 'package:shared_preferences/shared_preferences.dart';

class Savelogin {
  Future<void> login() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isLogin", true);
  }

  Future<bool> logined() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("isLogin") ?? false;
  }

  static Future<bool> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove("isLogin");
  }
}
