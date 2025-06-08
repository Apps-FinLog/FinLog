import 'package:flutter/foundation.dart'; // Import for ChangeNotifier
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class UserProfileService extends ChangeNotifier { // Extend ChangeNotifier
  late Box _userProfileBox;

  Future<void> init() async {
    // Hive.initFlutter() is called once in main.dart by BillStorageService
    _userProfileBox = await Hive.openBox('userProfileBox');
    print('UserProfileService: Hive box "userProfileBox" opened.');
  }

  String getUserName() {
    final name = _userProfileBox.get('userName', defaultValue: 'John Doe');
    print('UserProfileService: Retrieved userName: $name');
    return name;
  }

  Future<void> saveUserName(String name) async {
    await _userProfileBox.put('userName', name);
    print('UserProfileService: Saved userName: $name');
    notifyListeners(); // Notify listeners after saving
  }

  String? getProfileImageBase64() {
    final base64String = _userProfileBox.get('profileImageBase64');
    print('UserProfileService: Retrieved profileImageBase64: ${base64String != null ? "exists" : "null"}');
    return base64String;
  }

  Future<void> saveProfileImageBase64(String base64String) async {
    await _userProfileBox.put('profileImageBase64', base64String);
    print('UserProfileService: Saved profileImageBase64: ${base64String.substring(0, 30)}...'); // Log a snippet
    notifyListeners(); // Notify listeners after saving
  }
}
