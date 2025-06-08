import 'package:flutter/material.dart';
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart'; // This will be navigated to from SplashScreen
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import flutter_dotenv
import 'package:finlog/services/bill_storage_service.dart'; // Import BillStorageService
import 'package:provider/provider.dart'; // Import Provider

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async operations before runApp
  await dotenv.load(fileName: ".env"); // Load the .env file
  await BillStorageService().init(); // Initialize Hive
  runApp(
    MultiProvider(
      providers: [
        Provider<BillStorageService>(
          create: (_) => BillStorageService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
        scaffoldBackgroundColor: Colors.white, // Default background
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
