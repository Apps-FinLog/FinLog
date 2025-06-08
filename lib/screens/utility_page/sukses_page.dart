import 'package:flutter/material.dart';

import 'package:finlog/screens/utility_page/reusable_place_holder.dart';
class SuksesPage extends StatelessWidget {
  const SuksesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ReusablePlaceholder(
      imagePath: 'assets/images/flame.png',
      titleText: 'Sukses',
      subtitleText: 'kembali ke halaman sebelumnya',
    ),
    );
  }
}
