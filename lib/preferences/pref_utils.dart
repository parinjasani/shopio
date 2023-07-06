import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils{
  static const String KEY_IS_LOGIN="isLogin";
  static const String KEY_ONBOARIND="isvisited";
  static late SharedPreferences _instance;
  static Future<SharedPreferences> init()  async {
    _instance=await SharedPreferences.getInstance();
    return _instance;
  }
  static Future<bool> updateloginstatus(bool status)
  async {
    return await _instance.setBool(KEY_IS_LOGIN, status);
  }
  static bool getloginstatus()
  {
    return _instance.getBool(KEY_IS_LOGIN) ?? false;
  }
  static Future<bool> updateonboardingstatus(bool status)
  async {
    return await _instance.setBool(KEY_ONBOARIND, status);
  }
  static bool getonboardingstatus()
  {
    return _instance.getBool(KEY_ONBOARIND) ?? false;
  }
  //for logout
 static Future<bool> logout()
 async {
   return await _instance.remove(KEY_IS_LOGIN);
 }
}