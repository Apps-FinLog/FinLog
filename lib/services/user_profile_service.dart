import 'package:flutter/foundation.dart'; // Import for ChangeNotifier
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:flutter/material.dart'; // Import for Locale

class UserProfileService extends ChangeNotifier {
  late Box _userProfileBox;
  Locale? _currentLocale;

  Locale get currentLocale => _currentLocale ?? const Locale('id'); // Default to Indonesian

  Future<void> init() async {
    _userProfileBox = await Hive.openBox('userProfileBox');
    print('UserProfileService: Hive box "userProfileBox" opened.');
    _loadLocale(); // Load locale on initialization
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

  String? getGeminiApiKey() {
    final apiKey = _userProfileBox.get('geminiApiKey');
    print('UserProfileService: Retrieved geminiApiKey: ${apiKey != null ? "exists" : "null"}');
    return apiKey;
  }

  Future<void> saveGeminiApiKey(String apiKey) async {
    await _userProfileBox.put('geminiApiKey', apiKey);
    print('UserProfileService: Saved geminiApiKey: ${apiKey.substring(0, 10)}...'); // Log a snippet
    notifyListeners(); // Notify listeners after saving
  }

  void _loadLocale() {
    final languageCode = _userProfileBox.get('languageCode', defaultValue: 'id');
    _currentLocale = Locale(languageCode);
    print('UserProfileService: Loaded locale: $_currentLocale');
  }

  Future<void> saveLocale(Locale locale) async {
    await _userProfileBox.put('languageCode', locale.languageCode);
    _currentLocale = locale;
    print('UserProfileService: Saved locale: $_currentLocale');
    notifyListeners(); // Notify listeners when locale changes
  }
}
