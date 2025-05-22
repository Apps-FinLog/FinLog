import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:finlog/screens/onboarding_screen.dart';

void main() {
  testWidgets('OnboardingScreen builds without errors', (WidgetTester tester) async {
    // Build the OnboardingScreen widget.
    await tester.pumpWidget(const MaterialApp(home: OnboardingScreen()));
    // Allow the PageView to build and initialize its page
    await tester.pump();

    // If the widget builds without throwing any exceptions, the test passes.
    // We can add a simple expectation to ensure something from the screen is present.
    expect(find.byType(OnboardingScreen), findsOneWidget);
  });
}
