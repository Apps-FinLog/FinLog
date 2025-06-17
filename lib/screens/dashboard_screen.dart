import 'package:flutter/material.dart';
import 'package:finlog/l10n/app_localizations.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Example color for Dashboard
      body: Center(child: Text(AppLocalizations.of(context)!.dashboardContent)),
    );
  }
}
