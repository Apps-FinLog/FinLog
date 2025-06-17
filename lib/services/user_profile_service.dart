import 'package:hive_ce/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert'; // <-- TAMBAHKAN IMPORT INI


class UserProfileService extends ChangeNotifier {
  late Box _userProfileBox;
  Locale? _currentLocale;

  // --- PERUBAHAN 1: Tambahkan variabel untuk cache gambar ---
  Uint8List? _cachedImageBytes;
  Uint8List? get cachedImageBytes => _cachedImageBytes;
  // --- AKHIR PERUBAHAN 1 ---

  Locale get currentLocale => _currentLocale ?? const Locale('id');

  Future<void> init() async {
    _userProfileBox = await Hive.openBox('userProfileBox');
    if (kDebugMode) {
      debugPrint('UserProfileService: Hive box "userProfileBox" opened.');
    }
    _loadLocale();
    _loadProfileImageFromStorage(); // <-- PANGGIL METHOD BARU UNTUK MENGISI CACHE
  }

  // --- PERUBAHAN 2: Method baru untuk mengisi cache saat inisialisasi ---
  void _loadProfileImageFromStorage() {
    final base64String = _userProfileBox.get('profileImageBase64');
    if (base64String != null) {
      try {
        _cachedImageBytes = base64Decode(base64String);
        if (kDebugMode) {
          debugPrint(
            'UserProfileService: Profile image loaded into cache from storage.',
          );
        }
      } catch (e) {
        _cachedImageBytes = null;
        if (kDebugMode) {
          debugPrint(
            'UserProfileService: Failed to decode stored image. Error: $e',
          );
        }
      }
    }
  }
  // --- AKHIR PERUBAHAN 2 ---

  String getUserName() {
    final name = _userProfileBox.get('userName', defaultValue: 'John Doe');
    return name;
  }

  Future<void> saveUserName(String name) async {
    await _userProfileBox.put('userName', name);
    notifyListeners();
  }

  String? getProfileImageBase64() {
    return _userProfileBox.get('profileImageBase64');
  }

  Future<void> saveProfileImageBase64(String base64String) async {
    await _userProfileBox.put('profileImageBase64', base64String);

    // --- PERUBAHAN 3: Perbarui cache setiap kali gambar disimpan ---
    try {
      _cachedImageBytes = base64Decode(base64String);
      if (kDebugMode) {
        debugPrint('UserProfileService: Cache updated with new profile image.');
      }
    } catch (e) {
      _cachedImageBytes = null;
      if (kDebugMode) {
        debugPrint(
          'UserProfileService: Failed to decode new image for cache. Error: $e',
        );
      }
    }
    // --- AKHIR PERUBAHAN 3 ---

    notifyListeners();
  }

  // ... (sisa kode untuk Gemini API Key dan Locale tetap sama)
  String? getGeminiApiKey() {
    return _userProfileBox.get('geminiApiKey');
  }

  Future<void> saveGeminiApiKey(String apiKey) async {
    await _userProfileBox.put('geminiApiKey', apiKey);
    notifyListeners();
  }

  void _loadLocale() {
    final languageCode = _userProfileBox.get('languageCode', defaultValue: 'id');
    _currentLocale = Locale(languageCode);
  }

  Future<void> saveLocale(Locale locale) async {
    await _userProfileBox.put('languageCode', locale.languageCode);
    _currentLocale = locale;
    notifyListeners();
  }
}
