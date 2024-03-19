import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/user_model.dart';
import '../core.dart';

class HiveHelper {
  final String _name = 'mohamed';

  Future initHiveBoxes() async {
    await Hive.initFlutter();
    await Future.forEach(HiveKeys.values, (HiveKeys element) async {
      await Hive.openBox(element.name + _name);
    });
  }

  bool getModeState() {
    return Hive.box(HiveKeys.darkModeKey.name + _name).isNotEmpty
        ? Hive.box(HiveKeys.darkModeKey.name + _name)
            .get(HiveKeys.darkModeKey.name + _name)
        : false;
  }

  void setModeState({required bool isDark}) {
    Hive.box(HiveKeys.darkModeKey.name + _name)
        .put(HiveKeys.darkModeKey.name + _name, isDark);
  }

  String getLang() {
    return Hive.box(HiveKeys.langKey.name + _name).isNotEmpty
        ? Hive.box(HiveKeys.langKey.name + _name)
            .get(HiveKeys.langKey.name + _name)
        : 'ar';
  }

  void setLang({required String langCode}) {
    Hive.box(HiveKeys.langKey.name + _name)
        .put(HiveKeys.langKey.name + _name, langCode);
  }

  Future<void> setIsFirst(bool isFirst) async {
    await Hive.box(HiveKeys.isFirst.name + _name)
        .put(HiveKeys.isFirst.name + _name, isFirst);
  }

  bool getIsFirst() {
    return Hive.box(HiveKeys.isFirst.name + _name).isNotEmpty
        ? Hive.box(HiveKeys.isFirst.name + _name)
            .get(HiveKeys.isFirst.name + _name)
        : true;
  }

  /* Future<void> logout(BuildContext context) async {
    await Hive.box(_HiveKeys.user.name + _name).clear();
    await Hive.box(_HiveKeys.token.name + _name).clear();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
  }*/

  Future<void> setToken(String token) async {
    await Hive.box(HiveKeys.token.name + _name)
        .put(HiveKeys.token.name + _name, token);
  }

  String? getToken() {
    return Hive.box(HiveKeys.token.name + _name).isNotEmpty
        ? Hive.box(HiveKeys.token.name + _name).get(HiveKeys.token.name + _name)
        : null;
  }

  UserModel? getUser() {
    return Hive.box(HiveKeys.user.name + _name).isNotEmpty
        ? userModelFromJson(Hive.box(HiveKeys.user.name + _name)
            .get(HiveKeys.user.name + _name))
        : null;
  }

  Future<void> setUserModel(UserModel userModel) async {
    await Hive.box(HiveKeys.user.name + _name)
        .put(HiveKeys.user.name + _name, userModelToJson(userModel));
  }
}
