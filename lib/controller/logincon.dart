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
  

    // Save user to show
  static Future<void> saveUserInfo(String name, String email, String? photoUrl) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('userName', name);
    await pref.setString('userEmail', email);
    if (photoUrl != null) {
      await pref.setString('userPhoto', photoUrl);
    }
  }

  // Get user to show
  static Future<Map<String, String?>> getUserInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return {
      'name': pref.getString('userName') ?? 'User',
      'email': pref.getString('userEmail') ?? 'No email',
      'photo': pref.getString('userPhoto'),
    };
  }

}
