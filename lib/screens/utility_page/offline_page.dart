import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:finlog/screens/utility_page/reusable_place_holder.dart';
class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ReusablePlaceholder(
      imagePath: 'assets/images/wifi-off.png',
      titleText: AppLocalizations.of(context)!.offlineModeTitle,
      subtitleText: AppLocalizations.of(context)!.redirectingToManualInput,
    ), 
    );
  }
}
