import 'package:flutter/material.dart';
import 'package:finlog/widgets/custom_app_bar_notif.dart';

import 'package:finlog/screens/placeHolderPage/reusablePlaceHolder.dart';
class UnderDevelopmentPage extends StatelessWidget {
  const UnderDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: const ReusablePlaceholder(
      imagePath: 'assets/images/wrench.png',
      titleText: 'Halaman ini\nsedang dalam\nPengembangan',
      subtitleText: 'mengalihkan ke\nhalaman utama',
    ),
    );
  }
}
