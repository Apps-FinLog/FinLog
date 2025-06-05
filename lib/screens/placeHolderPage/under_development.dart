import 'package:flutter/material.dart';

import 'package:finlog/screens/placeHolderPage/reusable_place_holder.dart';
class UnderDevelopmentPage extends StatelessWidget {
  const UnderDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ReusablePlaceholder(
      imagePath: 'assets/images/wrench.png',
      titleText: 'Halaman ini\nsedang dalam\nPengembangan',
      subtitleText: 'mengalihkan ke\nhalaman utama',
    ),
    );
  }
}
