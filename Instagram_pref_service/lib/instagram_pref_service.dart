library instagram_pref_service;

import 'package:get_storage/get_storage.dart';

enum StorageKeys {
  UID,
  TOKEN,
}

class Prefs {
  static Future<bool> init() {
    return GetStorage.init();
  }

  static void store(StorageKeys key, String data) {
    GetStorage().write(_getKey(key), data);
  }

  static String? load(StorageKeys key) {
    return GetStorage().read(_getKey(key)) as String?;
  }

  static void remove(StorageKeys key) {
    GetStorage().remove(_getKey(key));
  }

  static String _getKey(StorageKeys key) {
    switch(key) {
      case StorageKeys.UID: return "uid";
      case StorageKeys.TOKEN: return "token";
    }
  }
}

