import 'package:flutter/material.dart';
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart'; // This will be navigated to from SplashScreen
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import flutter_dotenv
import 'package:finlog/services/bill_storage_service.dart'; // Import BillStorageService
import 'package:finlog/services/user_profile_service.dart'; // Import UserProfileService
import 'package:provider/provider.dart'; // Import Provider
import 'package:flutter_localizations/flutter_localizations.dart'; // Import for localization delegates
import 'package:finlog/l10n/app_localizations.dart'; // Import generated localizations

late BillStorageService billStorageService;
late UserProfileService userProfileService;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async operations before runApp
  await dotenv.load(fileName: ".env"); // Load the .env file

  billStorageService = BillStorageService();
  await billStorageService.init(); // Initialize BillStorageService

  userProfileService = UserProfileService();
  await userProfileService.init(); // Initialize UserProfileService

  runApp(
    MultiProvider(
      providers: [
        Provider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
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
    return Consumer<UserProfileService>(
      builder: (context, userProfileService, child) {
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
          locale: userProfileService.currentLocale, // Use the locale from UserProfileService
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales, // Use supported locales from generated file
          home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
