import 'package:flutter/material.dart';
import 'package:finlog/screens/onboarding_screen.dart'; // This will be navigated to from SplashScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinLog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter', // Menggunakan font Inter
        scaffoldBackgroundColor: Colors.blue.shade700, // Default background
        textTheme: const TextTheme(
          // Default text styles
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
    );
  }
}
