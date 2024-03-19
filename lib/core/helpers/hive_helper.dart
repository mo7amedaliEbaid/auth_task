import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/user_model.dart';
import '../enums/enums.dart';

class HiveHelper {
  final String _name = 'mohamed';

  Future initHiveBoxes() async {
    await Hive.initFlutter();
    await Future.forEach(HiveKeys.values, (HiveKeys element) async {
      await Hive.openBox(element.name + _name);
    });
  }

  UserModel? getUser(String email) {
    return Hive.box(HiveKeys.user.name + _name + email).isNotEmpty
        ? userModelFromJson(Hive.box(HiveKeys.user.name + _name + email)
            .get(HiveKeys.user.name + _name + email))
        : null;
  }

  Future<void> setUserModel(UserModel userModel, String email) async {
    await Hive.box(HiveKeys.user.name + _name + email)
        .put(HiveKeys.user.name + _name + email, userModelToJson(userModel));
  }

  bool isEmailUsed(String email) {
    final box = Hive.box<UserModel>(HiveKeys.user.name + _name + email);
    return box.isNotEmpty;
  }
}
