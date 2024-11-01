import 'package:extract_text_from_audio_and_video/features/login/data/models/user_login_request_body.dart';
import 'package:extract_text_from_audio_and_video/features/sign_up/data/models/user_sign_up_request_body.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  static const boxName = 'userBox';
  HiveDatabase._();

  // فتح الصندوق (قاعدة البيانات) عند بدء التشغيل
  static Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  // دالة لإضافة بيانات إلى الصندوق
  Future<void> addData(String key, dynamic value) async {
    final box = Hive.box(boxName);
    await box.put(key, value);
  }

  Future<void> saveUserLoginData(UserLoginRequestBody userLoginData) async {
    final box = Hive.box(boxName);
    await box.add(userLoginData);
  }


  Future<void> saveUserSignUpData(UserSignUpRequestBody userSignUpData) async {
    final box = Hive.box(boxName);
    await box.add(userSignUpData);
  }

  // دالة لاسترجاع بيانات من الصندوق
  dynamic getData(String key) {
    final box = Hive.box(boxName);
    return box.get(key);
  }

  // دالة لحذف بيانات من الصندوق
  Future<void> deleteData(String key) async {
    final box = Hive.box(boxName);
    await box.delete(key);
  }

  // دالة لإغلاق الصندوق عند عدم الحاجة إليه
  Future<void> closeHive() async {
    await Hive.box(boxName).close();
  }
}
