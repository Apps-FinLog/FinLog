import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:flutter/material.dart'; // Digunakan untuk Locale dan ChangeNotifier
import 'package:flutter/foundation.dart'; // Diperlukan untuk kDebugMode

class UserProfileService extends ChangeNotifier {
  late Box _userProfileBox;
  Locale? _currentLocale;

  Locale get currentLocale => _currentLocale ?? const Locale('id'); // Default to Indonesian

  Future<void> init() async {
    _userProfileBox = await Hive.openBox('userProfileBox');
    if (kDebugMode) {
      debugPrint('UserProfileService: Hive box "userProfileBox" opened.');
    }
    _loadLocale(); // Load locale on initialization
  }

  String getUserName() {
    final name = _userProfileBox.get('userName', defaultValue: 'John Doe');
    if (kDebugMode) {
      debugPrint('UserProfileService: Retrieved userName: $name');
    }
    return name;
  }

  Future<void> saveUserName(String name) async {
    await _userProfileBox.put('userName', name);
    if (kDebugMode) {
      debugPrint('UserProfileService: Saved userName: $name');
    }
    notifyListeners(); // Notify listeners after saving
  }

  String? getProfileImageBase64() {
    final base64String = _userProfileBox.get('profileImageBase64');
    if (kDebugMode) {
      debugPrint(
        'UserProfileService: Retrieved profileImageBase64: ${base64String != null ? "exists" : "null"}',
      );
    }
    return base64String;
  }

  Future<void> saveProfileImageBase64(String base64String) async {
    await _userProfileBox.put('profileImageBase64', base64String);
    if (kDebugMode) {
      // Log a snippet, check if string is long enough to avoid errors
      final logSnippet =
          base64String.length > 30
              ? '${base64String.substring(0, 30)}...'
              : base64String;
      debugPrint('UserProfileService: Saved profileImageBase64: $logSnippet');
    }
    notifyListeners(); // Notify listeners after saving
  }

  String? getGeminiApiKey() {
    final apiKey = _userProfileBox.get('geminiApiKey');
    if (kDebugMode) {
      debugPrint(
        'UserProfileService: Retrieved geminiApiKey: ${apiKey != null ? "exists" : "null"}',
      );
    }
    return apiKey;
  }

  Future<void> saveGeminiApiKey(String apiKey) async {
    await _userProfileBox.put('geminiApiKey', apiKey);
    if (kDebugMode) {
      // Log a snippet, check if string is long enough to avoid errors
      if (apiKey.isNotEmpty) {
        final logSnippet =
            apiKey.length > 10 ? '${apiKey.substring(0, 10)}...' : apiKey;
        debugPrint('UserProfileService: Saved geminiApiKey: $logSnippet');
      } else {
        debugPrint('UserProfileService: Saved an empty geminiApiKey.');
      }
    }
    notifyListeners(); // Notify listeners after saving
  }

  void _loadLocale() {
    final languageCode = _userProfileBox.get('languageCode', defaultValue: 'id');
    _currentLocale = Locale(languageCode);
    if (kDebugMode) {
      debugPrint('UserProfileService: Loaded locale: $_currentLocale');
    }
  }

  Future<void> saveLocale(Locale locale) async {
    await _userProfileBox.put('languageCode', locale.languageCode);
    _currentLocale = locale;
    if (kDebugMode) {
      debugPrint('UserProfileService: Saved locale: $_currentLocale');
    }
    notifyListeners(); // Notify listeners when locale changes
  }
}
