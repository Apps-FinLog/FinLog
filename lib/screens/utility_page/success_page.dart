import 'package:flutter/material.dart';
import 'package:finlog/screens/utility_page/reusable_place_holder.dart';


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

import 'package:finlog/l10n/app_localizations.dart';


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
        title: const Text(
          'Success',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ReusablePlaceholder(

   
      imagePath: 'assets/images/flame.png',
      titleText: AppLocalizations.of(context)!.operationSuccessfulTitle,
      subtitleText: AppLocalizations.of(context)!.redirectingToHomePage,
    ), 

    );
  }
}


