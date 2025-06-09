import 'package:flutter/material.dart';
import 'package:finlog/screens/utility_page/reusable_place_holder.dart';
import 'package:finlog/l10n/app_localizations.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ReusablePlaceholder(
      imagePath: 'assets/images/flame.png',
      titleText: AppLocalizations.of(context)!.operationSuccessfulTitle,
      subtitleText: AppLocalizations.of(context)!.redirectingToHomePage,
    ), 
    );
  }
}
