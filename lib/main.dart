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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
=======
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
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
      ],
providers: [
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart';
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:finlog/services/user_profile_service.dart';
import 'package:finlog/services/onboarding_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finlog/l10n/app_localizations.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:finlog/hive_registrar.g.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart';
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:finlog/services/user_profile_service.dart';
import 'package:onboarding_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finlog/l10n/app_localizations.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:finlog/hive_registrar.g.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv

late BillStorageService billStorageService;
late UserProfileService userProfileService;
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );

</file_content>

Please note:
1. You do not need to re-write the file with these changes, as they have already been applied.
2. Proceed with the task using this updated file content as the new baseline.
3. If the user's edits have addressed part of the task or changed the requirements, adjust your approach accordingly.4. IMPORTANT: For any future changes to this file, use the final_file_content shown above as your reference. This content reflects the current state of the file, including both user edits and any auto-formatting (e.g., if you used single quotes but the formatter converted them to double quotes). Always base your SEARCH/REPLACE operations on this final version to ensure accuracy.


New problems detected after saving the file:
lib/main.dart
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 3: Expected an identifier.
- [dart Error] Line 2: Expected to find ';'.
- [dart Error] Line 3: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 4: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 5: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 6: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 7: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 9: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 10: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 11: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 12: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 13: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 14: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 15: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 16: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 17: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 18: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 19: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected to find '>'.
- [dart Error] Line 38: Expected to find '['.
- [dart Error] Line 38: Expected to find ','.
- [dart Error] Line 40: Expected an identifier.
- [dart Error] Line 40: Expected an identifier.
- [dart Error] Line 40: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected to find ','.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected to find '>'.
- [dart Error] Line 81: Expected to find '['.
- [dart Error] Line 81: Expected to find ';'.
- [dart Error] Line 81: Expected an identifier.
- [dart Error] Line 81: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 82: Expected to find ';'.
- [dart Error] Line 82: Expected an identifier.
- [dart Error] Line 82: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 83: Expected to find ';'.
- [dart Error] Line 83: Expected an identifier.
- [dart Error] Line 83: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 84: Expected to find ';'.
- [dart Error] Line 84: Expected an identifier.
- [dart Error] Line 84: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 85: Expected an identifier.
- [dart Error] Line 85: Expected an identifier.
- [dart Error] Line 85: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 86: Expected to find ';'.
- [dart Error] Line 85: Illegal assignment to non-assignable expression.
- [dart Error] Line 86: Expected an identifier.
- [dart Error] Line 86: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 86: Expected to find ';'.
- [dart Error] Line 86: Expected an identifier.
- [dart Error] Line 86: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 92: Expected to find ';'.
- [dart Error] Line 92: Expected an identifier.
- [dart Error] Line 92: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 93: Expected to find ';'.
- [dart Error] Line 93: Expected an identifier.
- [dart Error] Line 93: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 94: Expected to find ';'.
- [dart Error] Line 94: Expected an identifier.
- [dart Error] Line 94: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 95: Expected to find ';'.
- [dart Error] Line 95: Expected an identifier.
- [dart Error] Line 95: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 96: Expected an identifier.
- [dart Error] Line 95: Expected to find ';'.
- [dart Error] Line 96: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 97: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 98: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 98: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 100: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected to find ','.
- [dart Error] Line 136: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 137: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 138: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 139: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 140: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 141: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 142: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 143: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 144: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 145: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 146: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 148: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 149: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 150: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 151: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 152: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 153: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 154: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 155: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 156: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 157: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 158: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 164: Expected an identifier.
- [dart Error] Line 164: Functions must have an explicit list of parameters.
Try adding a parameter list.
- [dart Error] Line 164: A function body must be provided.
Try adding a function body.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected to find '>'.
- [dart Error] Line 180: Expected to find '['.
- [dart Error] Line 180: Expected to find ','.
- [dart Error] Line 182: Expected an identifier.
- [dart Error] Line 182: Expected an identifier.
- [dart Error] Line 182: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected to find ','.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected to find '>'.
- [dart Error] Line 223: Expected to find '['.
- [dart Error] Line 223: Expected to find ';'.
- [dart Error] Line 223: Expected an identifier.
- [dart Error] Line 223: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 224: Expected to find ';'.
- [dart Error] Line 224: Expected an identifier.
- [dart Error] Line 224: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 225: Expected to find ';'.
- [dart Error] Line 225: Expected an identifier.
- [dart Error] Line 225: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 226: Expected to find ';'.
- [dart Error] Line 226: Expected an identifier.
- [dart Error] Line 226: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 227: Expected an identifier.
- [dart Error] Line 227: Expected an identifier.
- [dart Error] Line 227: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 228: Expected to find ';'.
- [dart Error] Line 227: Illegal assignment to non-assignable expression.
- [dart Error] Line 228: Expected an identifier.
- [dart Error] Line 228: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 228: Expected to find ';'.
- [dart Error] Line 228: Expected an identifier.
- [dart Error] Line 228: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 234: Expected to find ';'.
- [dart Error] Line 234: Expected an identifier.
- [dart Error] Line 234: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 235: Expected to find ';'.
- [dart Error] Line 235: Expected an identifier.
- [dart Error] Line 235: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 236: Expected to find ';'.
- [dart Error] Line 236: Expected an identifier.
- [dart Error] Line 236: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 237: Expected to find ';'.
- [dart Error] Line 237: Expected an identifier.
- [dart Error] Line 237: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 238: Expected an identifier.
- [dart Error] Line 237: Expected to find ';'.
- [dart Error] Line 238: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 239: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 240: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 240: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 242: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected to find ','.
- [dart Error] Line 277: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 277: Expected to find ';'.
- [dart Error] Line 277: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 277: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 278: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 278: Expected to find ';'.
- [dart Error] Line 278: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 278: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 279: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 279: Expected to find ';'.
- [dart Error] Line 279: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 279: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 280: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 280: Expected to find ';'.
- [dart Error] Line 280: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 280: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 281: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 281: Expected to find ';'.
- [dart Error] Line 281: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 281: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 282: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 282: Expected to find ';'.
- [dart Error] Line 282: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 282: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 283: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 283: Expected to find ';'.
- [dart Error] Line 283: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 283: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 284: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 284: Expected to find ';'.
- [dart Error] Line 284: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 284: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 285: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 285: Expected to find ';'.
- [dart Error] Line 285: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 285: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 286: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 286: Expected to find ';'.
- [dart Error] Line 286: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 286: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 287: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 287: Expected to find ';'.
- [dart Error] Line 287: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 287: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Operator declarations must be preceded by the keyword 'operator'.
Try adding the keyword 'operator'.
- [dart Error] Line 288: The string '=' isn't a user-definable operator.
- [dart Error] Line 288: Methods must have an explicit list of parameters.
Try adding a parameter list.
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
=======
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
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
      ],
providers: [
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart';
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:finlog/services/user_profile_service.dart';
import 'package:finlog/services/onboarding_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finlog/l10n/app_localizations.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:finlog/hive_registrar.g.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart';
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:finlog/services/user_profile_service.dart';
import 'package:onboarding_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finlog/l10n/app_localizations.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:finlog/hive_registrar.g.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv

late BillStorageService billStorageService;
late UserProfileService userProfileService;
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );

</file_content>

Please note:
1. You do not need to re-write the file with these changes, as they have already been applied.
2. Proceed with the task using this updated file content as the new baseline.
3. If the user's edits have addressed part of the task or changed the requirements, adjust your approach accordingly.4. IMPORTANT: For any future changes to this file, use the final_file_content shown above as your reference. This content reflects the current state of the file, including both user edits and any auto-formatting (e.g., if you used single quotes but the formatter converted them to double quotes). Always base your SEARCH/REPLACE operations on this final version to ensure accuracy.


New problems detected after saving the file:
lib/main.dart
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 3: Expected an identifier.
- [dart Error] Line 2: Expected to find ';'.
- [dart Error] Line 3: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 4: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 5: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 6: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 7: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 9: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 10: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 11: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 12: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 13: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 14: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 15: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 16: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 17: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 18: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 19: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected to find '>'.
- [dart Error] Line 38: Expected to find '['.
- [dart Error] Line 38: Expected to find ','.
- [dart Error] Line 40: Expected an identifier.
- [dart Error] Line 40: Expected an identifier.
- [dart Error] Line 40: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected to find ','.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected to find '>'.
- [dart Error] Line 81: Expected to find '['.
- [dart Error] Line 81: Expected to find ';'.
- [dart Error] Line 81: Expected an identifier.
- [dart Error] Line 81: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 82: Expected to find ';'.
- [dart Error] Line 82: Expected an identifier.
- [dart Error] Line 82: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 83: Expected to find ';'.
- [dart Error] Line 83: Expected an identifier.
- [dart Error] Line 83: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 84: Expected to find ';'.
- [dart Error] Line 84: Expected an identifier.
- [dart Error] Line 84: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 85: Expected an identifier.
- [dart Error] Line 85: Expected an identifier.
- [dart Error] Line 85: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 86: Expected to find ';'.
- [dart Error] Line 85: Illegal assignment to non-assignable expression.
- [dart Error] Line 86: Expected an identifier.
- [dart Error] Line 86: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 86: Expected to find ';'.
- [dart Error] Line 86: Expected an identifier.
- [dart Error] Line 86: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 92: Expected to find ';'.
- [dart Error] Line 92: Expected an identifier.
- [dart Error] Line 92: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 93: Expected to find ';'.
- [dart Error] Line 93: Expected an identifier.
- [dart Error] Line 93: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 94: Expected to find ';'.
- [dart Error] Line 94: Expected an identifier.
- [dart Error] Line 94: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 95: Expected to find ';'.
- [dart Error] Line 95: Expected an identifier.
- [dart Error] Line 95: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 96: Expected an identifier.
- [dart Error] Line 95: Expected to find ';'.
- [dart Error] Line 96: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 97: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 98: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 98: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 100: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected to find ','.
- [dart Error] Line 136: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 137: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 138: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 139: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 140: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 141: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 142: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 143: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 144: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 145: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 146: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 148: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 149: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 150: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 151: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 152: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 153: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 154: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 155: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 156: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 157: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 158: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 164: Expected an identifier.
- [dart Error] Line 164: Functions must have an explicit list of parameters.
Try adding a parameter list.
- [dart Error] Line 164: A function body must be provided.
Try adding a function body.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected to find '>'.
- [dart Error] Line 180: Expected to find '['.
- [dart Error] Line 180: Expected to find ','.
- [dart Error] Line 182: Expected an identifier.
- [dart Error] Line 182: Expected an identifier.
- [dart Error] Line 182: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected to find ','.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected to find '>'.
- [dart Error] Line 223: Expected to find '['.
- [dart Error] Line 223: Expected to find ';'.
- [dart Error] Line 223: Expected an identifier.
- [dart Error] Line 223: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 224: Expected to find ';'.
- [dart Error] Line 224: Expected an identifier.
- [dart Error] Line 224: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 225: Expected to find ';'.
- [dart Error] Line 225: Expected an identifier.
- [dart Error] Line 225: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 226: Expected to find ';'.
- [dart Error] Line 226: Expected an identifier.
- [dart Error] Line 226: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 227: Expected an identifier.
- [dart Error] Line 227: Expected an identifier.
- [dart Error] Line 227: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 228: Expected to find ';'.
- [dart Error] Line 227: Illegal assignment to non-assignable expression.
- [dart Error] Line 228: Expected an identifier.
- [dart Error] Line 228: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 228: Expected to find ';'.
- [dart Error] Line 228: Expected an identifier.
- [dart Error] Line 228: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 234: Expected to find ';'.
- [dart Error] Line 234: Expected an identifier.
- [dart Error] Line 234: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 235: Expected to find ';'.
- [dart Error] Line 235: Expected an identifier.
- [dart Error] Line 235: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 236: Expected to find ';'.
- [dart Error] Line 236: Expected an identifier.
- [dart Error] Line 236: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 237: Expected to find ';'.
- [dart Error] Line 237: Expected an identifier.
- [dart Error] Line 237: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 238: Expected an identifier.
- [dart Error] Line 237: Expected to find ';'.
- [dart Error] Line 238: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 239: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 240: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 240: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 242: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected to find ','.
- [dart Error] Line 277: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 277: Expected to find ';'.
- [dart Error] Line 277: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 277: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 278: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 278: Expected to find ';'.
- [dart Error] Line 278: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 278: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 279: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 279: Expected to find ';'.
- [dart Error] Line 279: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 279: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 280: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 280: Expected to find ';'.
- [dart Error] Line 280: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 280: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 281: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 281: Expected to find ';'.
- [dart Error] Line 281: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 281: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 282: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 282: Expected to find ';'.
- [dart Error] Line 282: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 282: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 283: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 283: Expected to find ';'.
- [dart Error] Line 283: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 283: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 284: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 284: Expected to find ';'.
- [dart Error] Line 284: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 284: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 285: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 285: Expected to find ';'.
- [dart Error] Line 285: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 285: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 286: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 286: Expected to find ';'.
- [dart Error] Line 286: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 286: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 287: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 287: Expected to find ';'.
- [dart Error] Line 287: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 287: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Operator declarations must be preceded by the keyword 'operator'.
Try adding the keyword 'operator'.
- [dart Error] Line 288: The string '=' isn't a user-definable operator.
- [dart Error] Line 288: Methods must have an explicit list of parameters.
Try adding a parameter list.
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
=======
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
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
      ],
providers: [
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}

</final_file_content>

Please note:
1. You do not need to re-write the file with these changes, as they have already been applied.
2. Proceed with the task using this updated file content as the new baseline.
3. If the user's edits have addressed part of the task or changed the requirements, adjust your approach accordingly.4. IMPORTANT: For any future changes to this file, use the final_file_content shown above as your reference. This content reflects the current state of the file, including both user edits and any auto-formatting (e.g., if you used single quotes but the formatter converted them to double quotes). Always base your SEARCH/REPLACE operations on this final version to ensure accuracy.


New problems detected after saving the file:
lib/main.dart
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 3: Expected an identifier.
- [dart Error] Line 2: Expected to find ';'.
- [dart Error] Line 3: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 4: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 5: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 6: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 7: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 9: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 10: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 11: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 12: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 13: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 14: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 15: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 16: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 17: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 18: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 19: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected to find '>'.
- [dart Error] Line 38: Expected to find '['.
- [dart Error] Line 38: Expected to find ','.
- [dart Error] Line 40: Expected an identifier.
- [dart Error] Line 40: Expected an identifier.
- [dart Error] Line 40: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected to find ','.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected to find '>'.
- [dart Error] Line 81: Expected to find '['.
- [dart Error] Line 81: Expected to find ';'.
- [dart Error] Line 81: Expected an identifier.
- [dart Error] Line 81: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 82: Expected to find ';'.
- [dart Error] Line 82: Expected an identifier.
- [dart Error] Line 82: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 83: Expected to find ';'.
- [dart Error] Line 83: Expected an identifier.
- [dart Error] Line 83: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 84: Expected to find ';'.
- [dart Error] Line 84: Expected an identifier.
- [dart Error] Line 84: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 85: Expected an identifier.
- [dart Error] Line 85: Expected an identifier.
- [dart Error] Line 85: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 86: Expected to find ';'.
- [dart Error] Line 85: Illegal assignment to non-assignable expression.
- [dart Error] Line 86: Expected an identifier.
- [dart Error] Line 86: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 86: Expected to find ';'.
- [dart Error] Line 86: Expected an identifier.
- [dart Error] Line 86: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 92: Expected to find ';'.
- [dart Error] Line 92: Expected an identifier.
- [dart Error] Line 92: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 93: Expected to find ';'.
- [dart Error] Line 93: Expected an identifier.
- [dart Error] Line 93: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 94: Expected to find ';'.
- [dart Error] Line 94: Expected an identifier.
- [dart Error] Line 94: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 95: Expected to find ';'.
- [dart Error] Line 95: Expected an identifier.
- [dart Error] Line 95: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 96: Expected an identifier.
- [dart Error] Line 95: Expected to find ';'.
- [dart Error] Line 96: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 97: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 98: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 98: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 100: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected to find ','.
- [dart Error] Line 136: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 137: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 138: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 139: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 140: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 141: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 142: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 143: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 144: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 145: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 146: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 148: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 149: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 150: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 151: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 152: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 153: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 154: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 155: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 156: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 157: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 158: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 164: Expected an identifier.
- [dart Error] Line 164: Functions must have an explicit list of parameters.
Try adding a parameter list.
- [dart Error] Line 164: A function body must be provided.
Try adding a function body.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected to find '>'.
- [dart Error] Line 180: Expected to find '['.
- [dart Error] Line 180: Expected to find ','.
- [dart Error] Line 182: Expected an identifier.
- [dart Error] Line 182: Expected an identifier.
- [dart Error] Line 182: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected to find ','.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected to find '>'.
- [dart Error] Line 223: Expected to find '['.
- [dart Error] Line 223: Expected to find ';'.
- [dart Error] Line 223: Expected an identifier.
- [dart Error] Line 223: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 224: Expected to find ';'.
- [dart Error] Line 224: Expected an identifier.
- [dart Error] Line 224: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 225: Expected to find ';'.
- [dart Error] Line 225: Expected an identifier.
- [dart Error] Line 225: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 226: Expected to find ';'.
- [dart Error] Line 226: Expected an identifier.
- [dart Error] Line 226: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 227: Expected an identifier.
- [dart Error] Line 227: Expected an identifier.
- [dart Error] Line 227: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 228: Expected to find ';'.
- [dart Error] Line 227: Illegal assignment to non-assignable expression.
- [dart Error] Line 228: Expected an identifier.
- [dart Error] Line 228: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 228: Expected to find ';'.
- [dart Error] Line 228: Expected an identifier.
- [dart Error] Line 228: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 234: Expected to find ';'.
- [dart Error] Line 234: Expected an identifier.
- [dart Error] Line 234: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 235: Expected to find ';'.
- [dart Error] Line 235: Expected an identifier.
- [dart Error] Line 235: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 236: Expected to find ';'.
- [dart Error] Line 236: Expected an identifier.
- [dart Error] Line 236: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 237: Expected to find ';'.
- [dart Error] Line 237: Expected an identifier.
- [dart Error] Line 237: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 238: Expected an identifier.
- [dart Error] Line 237: Expected to find ';'.
- [dart Error] Line 238: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 239: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 240: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 240: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 242: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected to find ','.
- [dart Error] Line 277: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 277: Expected to find ';'.
- [dart Error] Line 277: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 277: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 278: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 278: Expected to find ';'.
- [dart Error] Line 278: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 278: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 279: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 279: Expected to find ';'.
- [dart Error] Line 279: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 279: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 280: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 280: Expected to find ';'.
- [dart Error] Line 280: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 280: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 281: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 281: Expected to find ';'.
- [dart Error] Line 281: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 281: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 282: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 282: Expected to find ';'.
- [dart Error] Line 282: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 282: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 283: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 283: Expected to find ';'.
- [dart Error] Line 283: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 283: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 284: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 284: Expected to find ';'.
- [dart Error] Line 284: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 284: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 285: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 285: Expected to find ';'.
- [dart Error] Line 285: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 285: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 286: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 286: Expected to find ';'.
- [dart Error] Line 286: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 286: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 287: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 287: Expected to find ';'.
- [dart Error] Line 287: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 287: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Operator declarations must be preceded by the keyword 'operator'.
Try adding the keyword 'operator'.
- [dart Error] Line 288: The string '=' isn't a user-definable operator.
- [dart Error] Line 288: Methods must have an explicit list of parameters.
Try adding a parameter list
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
=======
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
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
      ],
providers: [
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart';
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:finlog/services/user_profile_service.dart';
import 'package:finlog/services/onboarding_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finlog/l10n/app_localizations.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:finlog/hive_registrar.g.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart';
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:finlog/services/user_profile_service.dart';
import 'package:onboarding_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finlog/l10n/app_localizations.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:finlog/hive_registrar.g.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv

late BillStorageService billStorageService;
late UserProfileService userProfileService;
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );

</file_content>

Please note:
1. You do not need to re-write the file with these changes, as they have already been applied.
2. Proceed with the task using this updated file content as the new baseline.
3. If the user's edits have addressed part of the task or changed the requirements, adjust your approach accordingly.4. IMPORTANT: For any future changes to this file, use the final_file_content shown above as your reference. This content reflects the current state of the file, including both user edits and any auto-formatting (e.g., if you used single quotes but the formatter converted them to double quotes). Always base your SEARCH/REPLACE operations on this final version to ensure accuracy.


New problems detected after saving the file:
lib/main.dart
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 3: Expected an identifier.
- [dart Error] Line 2: Expected to find ';'.
- [dart Error] Line 3: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 4: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 5: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 6: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 7: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 9: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 10: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 11: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 12: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 13: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 14: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 15: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 16: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 17: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 18: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 19: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected to find '>'.
- [dart Error] Line 38: Expected to find '['.
- [dart Error] Line 38: Expected to find ','.
- [dart Error] Line 40: Expected an identifier.
- [dart Error] Line 40: Expected an identifier.
- [dart Error] Line 40: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected to find ','.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected to find '>'.
- [dart Error] Line 81: Expected to find '['.
- [dart Error] Line 81: Expected to find ';'.
- [dart Error] Line 81: Expected an identifier.
- [dart Error] Line 81: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 82: Expected to find ';'.
- [dart Error] Line 82: Expected an identifier.
- [dart Error] Line 82: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 83: Expected to find ';'.
- [dart Error] Line 83: Expected an identifier.
- [dart Error] Line 83: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 84: Expected to find ';'.
- [dart Error] Line 84: Expected an identifier.
- [dart Error] Line 84: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 85: Expected an identifier.
- [dart Error] Line 85: Expected an identifier.
- [dart Error] Line 85: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 86: Expected to find ';'.
- [dart Error] Line 85: Illegal assignment to non-assignable expression.
- [dart Error] Line 86: Expected an identifier.
- [dart Error] Line 86: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 86: Expected to find ';'.
- [dart Error] Line 86: Expected an identifier.
- [dart Error] Line 86: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 92: Expected to find ';'.
- [dart Error] Line 92: Expected an identifier.
- [dart Error] Line 92: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 93: Expected to find ';'.
- [dart Error] Line 93: Expected an identifier.
- [dart Error] Line 93: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 94: Expected to find ';'.
- [dart Error] Line 94: Expected an identifier.
- [dart Error] Line 94: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 95: Expected to find ';'.
- [dart Error] Line 95: Expected an identifier.
- [dart Error] Line 95: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 96: Expected an identifier.
- [dart Error] Line 95: Expected to find ';'.
- [dart Error] Line 96: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 97: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 98: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 98: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 100: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected to find ','.
- [dart Error] Line 136: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 137: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 138: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 139: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 140: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 141: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 142: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 143: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 144: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 145: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 146: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 148: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 149: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 150: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 151: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 152: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 153: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 154: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 155: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 156: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 157: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 158: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 164: Expected an identifier.
- [dart Error] Line 164: Functions must have an explicit list of parameters.
Try adding a parameter list.
- [dart Error] Line 164: A function body must be provided.
Try adding a function body.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected to find '>'.
- [dart Error] Line 180: Expected to find '['.
- [dart Error] Line 180: Expected to find ','.
- [dart Error] Line 182: Expected an identifier.
- [dart Error] Line 182: Expected an identifier.
- [dart Error] Line 182: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected to find ','.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected to find '>'.
- [dart Error] Line 223: Expected to find '['.
- [dart Error] Line 223: Expected to find ';'.
- [dart Error] Line 223: Expected an identifier.
- [dart Error] Line 223: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 224: Expected to find ';'.
- [dart Error] Line 224: Expected an identifier.
- [dart Error] Line 224: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 225: Expected to find ';'.
- [dart Error] Line 225: Expected an identifier.
- [dart Error] Line 225: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 226: Expected to find ';'.
- [dart Error] Line 226: Expected an identifier.
- [dart Error] Line 226: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 227: Expected an identifier.
- [dart Error] Line 227: Expected an identifier.
- [dart Error] Line 227: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 228: Expected to find ';'.
- [dart Error] Line 227: Illegal assignment to non-assignable expression.
- [dart Error] Line 228: Expected an identifier.
- [dart Error] Line 228: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 228: Expected to find ';'.
- [dart Error] Line 228: Expected an identifier.
- [dart Error] Line 228: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 234: Expected to find ';'.
- [dart Error] Line 234: Expected an identifier.
- [dart Error] Line 234: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 235: Expected to find ';'.
- [dart Error] Line 235: Expected an identifier.
- [dart Error] Line 235: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 236: Expected to find ';'.
- [dart Error] Line 236: Expected an identifier.
- [dart Error] Line 236: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 237: Expected to find ';'.
- [dart Error] Line 237: Expected an identifier.
- [dart Error] Line 237: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 238: Expected an identifier.
- [dart Error] Line 237: Expected to find ';'.
- [dart Error] Line 238: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 239: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 240: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 240: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 242: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected to find ','.
- [dart Error] Line 277: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 277: Expected to find ';'.
- [dart Error] Line 277: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 277: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 278: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 278: Expected to find ';'.
- [dart Error] Line 278: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 278: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 279: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 279: Expected to find ';'.
- [dart Error] Line 279: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 279: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 280: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 280: Expected to find ';'.
- [dart Error] Line 280: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 280: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 281: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 281: Expected to find ';'.
- [dart Error] Line 281: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 281: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 282: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 282: Expected to find ';'.
- [dart Error] Line 282: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 282: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 283: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 283: Expected to find ';'.
- [dart Error] Line 283: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 283: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 284: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 284: Expected to find ';'.
- [dart Error] Line 284: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 284: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 285: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 285: Expected to find ';'.
- [dart Error] Line 285: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 285: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 286: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 286: Expected to find ';'.
- [dart Error] Line 286: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 286: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 287: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 287: Expected to find ';'.
- [dart Error] Line 287: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 287: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Operator declarations must be preceded by the keyword 'operator'.
Try adding the keyword 'operator'.
- [dart Error] Line 288: The string '=' isn't a user-definable operator.
- [dart Error] Line 288: Methods must have an explicit list of parameters.
Try adding a parameter list.
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
=======
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
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
      ],
providers: [
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart';
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:finlog/services/user_profile_service.dart';
import 'package:finlog/services/onboarding_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finlog/l10n/app_localizations.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:finlog/hive_registrar.g.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv
import 'package:finlog/screens/splash_onboarding/onboarding_screen.dart';
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:finlog/services/user_profile_service.dart';
import 'package:onboarding_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finlog/l10n/app_localizations.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:finlog/hive_registrar.g.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv

late BillStorageService billStorageService;
late UserProfileService userProfileService;
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );

</file_content>

Please note:
1. You do not need to re-write the file with these changes, as they have already been applied.
2. Proceed with the task using this updated file content as the new baseline.
3. If the user's edits have addressed part of the task or changed the requirements, adjust your approach accordingly.4. IMPORTANT: For any future changes to this file, use the final_file_content shown above as your reference. This content reflects the current state of the file, including both user edits and any auto-formatting (e.g., if you used single quotes but the formatter converted them to double quotes). Always base your SEARCH/REPLACE operations on this final version to ensure accuracy.


New problems detected after saving the file:
lib/main.dart
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 2: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 3: Expected an identifier.
- [dart Error] Line 2: Expected to find ';'.
- [dart Error] Line 3: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 4: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 5: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 6: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 7: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 8: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 9: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 10: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 11: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 12: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 13: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 14: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 15: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 16: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 17: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 18: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 19: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected an identifier.
- [dart Error] Line 37: Expected to find '>'.
- [dart Error] Line 38: Expected to find '['.
- [dart Error] Line 38: Expected to find ','.
- [dart Error] Line 40: Expected an identifier.
- [dart Error] Line 40: Expected an identifier.
- [dart Error] Line 40: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected an identifier.
- [dart Error] Line 47: Expected to find ','.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected an identifier.
- [dart Error] Line 80: Expected to find '>'.
- [dart Error] Line 81: Expected to find '['.
- [dart Error] Line 81: Expected to find ';'.
- [dart Error] Line 81: Expected an identifier.
- [dart Error] Line 81: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 82: Expected to find ';'.
- [dart Error] Line 82: Expected an identifier.
- [dart Error] Line 82: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 83: Expected to find ';'.
- [dart Error] Line 83: Expected an identifier.
- [dart Error] Line 83: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 84: Expected to find ';'.
- [dart Error] Line 84: Expected an identifier.
- [dart Error] Line 84: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 85: Expected an identifier.
- [dart Error] Line 85: Expected an identifier.
- [dart Error] Line 85: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 86: Expected to find ';'.
- [dart Error] Line 85: Illegal assignment to non-assignable expression.
- [dart Error] Line 86: Expected an identifier.
- [dart Error] Line 86: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 86: Expected to find ';'.
- [dart Error] Line 86: Expected an identifier.
- [dart Error] Line 86: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 92: Expected to find ';'.
- [dart Error] Line 92: Expected an identifier.
- [dart Error] Line 92: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 93: Expected to find ';'.
- [dart Error] Line 93: Expected an identifier.
- [dart Error] Line 93: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 94: Expected to find ';'.
- [dart Error] Line 94: Expected an identifier.
- [dart Error] Line 94: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 95: Expected to find ';'.
- [dart Error] Line 95: Expected an identifier.
- [dart Error] Line 95: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 96: Expected an identifier.
- [dart Error] Line 95: Expected to find ';'.
- [dart Error] Line 96: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 97: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 98: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 98: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 100: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected an identifier.
- [dart Error] Line 132: Expected to find ','.
- [dart Error] Line 136: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 137: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 138: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 139: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 140: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 141: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 142: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 143: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 144: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 145: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 146: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 147: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 148: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 149: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 150: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 151: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 152: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 153: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 154: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 155: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 156: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 157: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 158: Directives must appear before any declarations.
Try moving the directive before any declarations.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 162: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 164: Expected an identifier.
- [dart Error] Line 164: Functions must have an explicit list of parameters.
Try adding a parameter list.
- [dart Error] Line 164: A function body must be provided.
Try adding a function body.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected an identifier.
- [dart Error] Line 179: Expected to find '>'.
- [dart Error] Line 180: Expected to find '['.
- [dart Error] Line 180: Expected to find ','.
- [dart Error] Line 182: Expected an identifier.
- [dart Error] Line 182: Expected an identifier.
- [dart Error] Line 182: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected an identifier.
- [dart Error] Line 189: Expected to find ','.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected an identifier.
- [dart Error] Line 222: Expected to find '>'.
- [dart Error] Line 223: Expected to find '['.
- [dart Error] Line 223: Expected to find ';'.
- [dart Error] Line 223: Expected an identifier.
- [dart Error] Line 223: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 224: Expected to find ';'.
- [dart Error] Line 224: Expected an identifier.
- [dart Error] Line 224: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 225: Expected to find ';'.
- [dart Error] Line 225: Expected an identifier.
- [dart Error] Line 225: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 226: Expected to find ';'.
- [dart Error] Line 226: Expected an identifier.
- [dart Error] Line 226: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 227: Expected an identifier.
- [dart Error] Line 227: Expected an identifier.
- [dart Error] Line 227: Missing selector such as '.identifier' or '[0]'.
Try adding a selector.
- [dart Error] Line 228: Expected to find ';'.
- [dart Error] Line 227: Illegal assignment to non-assignable expression.
- [dart Error] Line 228: Expected an identifier.
- [dart Error] Line 228: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 228: Expected to find ';'.
- [dart Error] Line 228: Expected an identifier.
- [dart Error] Line 228: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 234: Expected to find ';'.
- [dart Error] Line 234: Expected an identifier.
- [dart Error] Line 234: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 235: Expected to find ';'.
- [dart Error] Line 235: Expected an identifier.
- [dart Error] Line 235: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 236: Expected to find ';'.
- [dart Error] Line 236: Expected an identifier.
- [dart Error] Line 236: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 237: Expected to find ';'.
- [dart Error] Line 237: Expected an identifier.
- [dart Error] Line 237: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 238: Expected an identifier.
- [dart Error] Line 237: Expected to find ';'.
- [dart Error] Line 238: Unexpected text ';'.
Try removing the text.
- [dart Error] Line 239: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 240: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 240: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 242: Expected a method, getter, setter or operator declaration.
This appears to be incomplete code. Try removing it or completing it.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected an identifier.
- [dart Error] Line 274: Expected to find ','.
- [dart Error] Line 277: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 277: Expected to find ';'.
- [dart Error] Line 277: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 277: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 278: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 278: Expected to find ';'.
- [dart Error] Line 278: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 278: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 279: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 279: Expected to find ';'.
- [dart Error] Line 279: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 279: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 280: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 280: Expected to find ';'.
- [dart Error] Line 280: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 280: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 281: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 281: Expected to find ';'.
- [dart Error] Line 281: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 281: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 282: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 282: Expected to find ';'.
- [dart Error] Line 282: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 282: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 283: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 283: Expected to find ';'.
- [dart Error] Line 283: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 283: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 284: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 284: Expected to find ';'.
- [dart Error] Line 284: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 284: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 285: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 285: Expected to find ';'.
- [dart Error] Line 285: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 285: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 286: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 286: Expected to find ';'.
- [dart Error] Line 286: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 286: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 287: Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
Try adding the name of the type of the variable or the keyword 'var'.
- [dart Error] Line 287: Expected to find ';'.
- [dart Error] Line 287: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 287: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Expected a class member.
Try placing this code inside a class member.
- [dart Error] Line 288: Operator declarations must be preceded by the keyword 'operator'.
Try adding the keyword 'operator'.
- [dart Error] Line 288: The string '=' isn't a user-definable operator.
- [dart Error] Line 288: Methods must have an explicit list of parameters.
Try adding a parameter list.
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
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
=======
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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
    );
  }
}
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
=======
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
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e

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
<<<<<<< HEAD
        Provider<BillStorageService>(create: (_) => BillStorageService()),
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
=======
        ChangeNotifierProvider<BillStorageService>(
          create: (_) => billStorageService,
        ),
        ChangeNotifierProvider<UserProfileService>(
          create: (_) => userProfileService,
        ),
>>>>>>> 90901fbe541daa0d5b1c27a9844e06e34472a91e
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
<<<<<<< HEAD
        ),
      ),
      home: const OnboardingScreen(), // Directly navigate to OnboardingScreen
      debugShowCheckedModeBanner: false,
=======
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
