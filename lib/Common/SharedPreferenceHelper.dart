import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final String _UserIdKey = "UserId";
  static final String _TokenKey = "Token";

  static Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_UserIdKey);
  }

  static Future<bool> setUserId(int UserId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt(_UserIdKey, UserId);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_TokenKey);
  }

  static Future<bool> setToken(String Token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_TokenKey, Token);
  }

  static Future<bool> hasUserIdPassword() async {
    var userId = await getUserId();
    var token = await getToken();
    if ((userId == null || userId <= 0) || (token == null || token.isEmpty)) {
      return false;
    }
    return true;
  }
}
