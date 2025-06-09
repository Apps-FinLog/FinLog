import 'package:flutter/material.dart';
import 'package:finlog/screens/utility_page/reusable_place_holder.dart';
import 'package:finlog/l10n/app_localizations.dart';
class SuccessPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? imagePath;

  const SuccessPage({
    super.key,
    this.title,
    this.subtitle,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title ?? 'Success',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ReusablePlaceholder(
        imagePath: imagePath ?? 'assets/images/flame.png',
        titleText: title ?? AppLocalizations.of(context)!.operationSuccessfulTitle,
        subtitleText: subtitle ?? AppLocalizations.of(context)!.redirectingToHomePage,
      ),
    );
  }
}


