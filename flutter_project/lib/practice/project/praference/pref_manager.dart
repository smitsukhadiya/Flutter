import 'package:shared_preferences/shared_preferences.dart';

class PrefManager{
  static const IS_LOGIN = 'isLogin';
  static const IS_VISITED = 'isVisited';

  static SharedPreferences? preferences;

  static Future<SharedPreferences?> init() async {
    preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  static void updateLoginStatus(bool status) async {
      await preferences?.setBool(IS_LOGIN,status);
  }

  static bool getLoginStatus(){
    return preferences?.getBool(IS_LOGIN) ?? false;
  }

  static Future<void> updateOnboardingStatus(bool status) async {
     await preferences?.setBool(IS_VISITED, status);
  }

  static bool getOnboardingStatus(){
    return preferences?.getBool(IS_VISITED) ?? false;
  }

}