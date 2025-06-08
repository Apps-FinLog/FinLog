import 'package:flutter/material.dart';
import 'package:finlog/screens/utility_page/reusable_place_holder.dart';
class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ReusablePlaceholder(
      imagePath: 'assets/images/flame.png',
      titleText: 'Operasi Berhasil\nDilakukan',
      subtitleText: 'mengalihkan ke \n halaman utama',
    ), 
    );
  }
}
