import 'package:hive_ce/hive.dart';

part 'onboarding_state.g.dart';

@HiveType(typeId: 2)
class OnboardingState extends HiveObject {
  @HiveField(0)
  bool hasCompletedOnboarding;

  OnboardingState({this.hasCompletedOnboarding = false});
}