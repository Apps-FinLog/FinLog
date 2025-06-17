import 'package:flutter/material.dart';
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart';
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:finlog/services/user_profile_service.dart';
import 'package:finlog/services/onboarding_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finlog/l10n/app_localizations.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:finlog/hive_registrar.g.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv

late BillStorageService billStorageService;
late UserProfileService userProfileService;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Hive.initFlutter();
  Hive.registerAdapters();

  billStorageService = BillStorageService();
  await billStorageService.init();

  userProfileService = UserProfileService();
  await userProfileService.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BillStorageService>(
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
            fontFamily: 'Inter',
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white70),
              titleLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ), dialogTheme: DialogThemeData(backgroundColor: Colors.white),
          ),
          locale: userProfileService.currentLocale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: const AppInitializer(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

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
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          debugPrint('Error checking onboarding: ${snapshot.error}');
          return const OnboardingScreen();
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
