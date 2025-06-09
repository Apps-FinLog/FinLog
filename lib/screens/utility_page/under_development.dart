import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:finlog/screens/utility_page/reusable_place_holder.dart';
class UnderDevelopmentPage extends StatelessWidget {
  const UnderDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ReusablePlaceholder(
      imagePath: 'assets/images/wrench.png',
      titleText: AppLocalizations.of(context)!.underDevelopmentTitle,
      subtitleText: AppLocalizations.of(context)!.redirectingToHomePage,
    ),
    );
  }
}
