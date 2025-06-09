import 'package:flutter/material.dart';
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart'; // This will be navigated to from SplashScreen
import 'package:finlog/screens/home_screen.dart'; // Import HomeScreen
import 'package:finlog/services/bill_storage_service.dart'; // Import BillStorageService
import 'package:finlog/services/onboarding_service.dart'; // Import OnboardingService
import 'package:provider/provider.dart'; // Import Provider
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:finlog/hive_registrar.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async operations before runApp
  await Hive.initFlutter();
  Hive.registerAdapters(); // Register all adapters from hive_registrar.g.dart
  runApp(
    MultiProvider(
      providers: [
        Provider<BillStorageService>(create: (_) => BillStorageService()),
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
      // In main.dart - MyApp widget
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Default scaffold background
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const AppInitializer(), // Use a separate widget
      debugShowCheckedModeBanner: false,
    );
  }
}

// Add this new widget to handle initialization
class AppInitializer extends StatefulWidget {
  const AppInitializer({super.key});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: OnboardingService.hasCompletedOnboarding(),
      builder: (context, snapshot) {        // Add error handling
        if (snapshot.hasError) {
          debugPrint('Error checking onboarding: ${snapshot.error}');
          return const OnboardingScreen(); // Default to onboarding on error
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.data == true) {
          return const HomeScreen();
        } else {
          return const OnboardingScreen();
        }
      },
    );
  }
}
