import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:finlog/models/onboarding_state.dart';
import 'package:flutter/foundation.dart';
class OnboardingService {
  static const String _boxName = 'onboarding';
  static const String _stateKey = 'state';

  static Future<Box<OnboardingState>> _getBox() async {
    try {
      if (Hive.isBoxOpen(_boxName)) {
        return Hive.box<OnboardingState>(_boxName);
      }
      return await Hive.openBox<OnboardingState>(_boxName);
    } catch (e) {
      debugPrint('Error opening Hive box: $e');
      rethrow;
    }
  }

  static Future<bool> hasCompletedOnboarding() async {
    try {
      final box = await _getBox();
      final state = box.get(_stateKey);
      return state?.hasCompletedOnboarding ?? false;
    } catch (e) {
      debugPrint('Error reading onboarding state: $e');
      return false; // Default to showing onboarding on error
    }
  }

  static Future<void> markOnboardingComplete() async {
    try {
      final box = await _getBox();
      await box.put(_stateKey, OnboardingState(hasCompletedOnboarding: true));
      await box.flush(); // Force write to disk
      debugPrint('✅ Onboarding state saved successfully');
    } catch (e) {
      debugPrint('Error marking onboarding complete: $e');
      rethrow;
    }
  }

  static Future<void> resetOnboarding() async {
    try {
      final box = await _getBox();
      await box.put(_stateKey, OnboardingState(hasCompletedOnboarding: false));
      await box.flush(); // Force write to disk
    } catch (e) {
      debugPrint('Error resetting onboarding: $e');
      rethrow;
    }
  }
}