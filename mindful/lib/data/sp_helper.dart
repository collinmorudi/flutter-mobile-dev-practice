import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  static const keyName = "name";
  static const keyImage = "image";

  Future<bool> setSettings(String, name, String image) async {
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setString(keyName, name);
      await preferences.setString(keyImage, image);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<Map<String, String>> getSettings() async {
    final SharedPreferences preferences =
          await SharedPreferences.getInstance();
    
    final String name = preferences.getString(keyName) ?? "";
    final String image = preferences.getString(keyImage) ?? "";

    try {
  return {
    keyName: name,
    keyImage: image
  };
} on Exception catch (_) {
  return {};
}

  }
}
