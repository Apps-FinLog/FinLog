import 'package:flutter/foundation.dart';
import 'package:finlog/services/onboarding_service.dart';

class DebugHelper {
  static void logOnboardingState() async {
    if (kDebugMode) {
      try {
        final hasCompleted = await OnboardingService.hasCompletedOnboarding();
        print('🔍 Debug: Onboarding completion state: $hasCompleted');
      } catch (e) {
        print('🔍 Debug: Error checking onboarding state: $e');
      }
    }
  }

  static void resetOnboardingForTesting() async {
    if (kDebugMode) {
      try {
        await OnboardingService.resetOnboarding();
        print('🔍 Debug: Onboarding state reset for testing');
      } catch (e) {
        print('🔍 Debug: Error resetting onboarding: $e');
      }
    }
  }

  static void printNavigationDebug(String action) {
    if (kDebugMode) {
      print('🧭 Navigation Debug: $action');
    }
  }
}

