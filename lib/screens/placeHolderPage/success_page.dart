import 'package:flutter/material.dart';
import 'package:finlog/widgets/custom_app_bar_notif.dart';
import 'package:finlog/screens/placeHolderPage/reusablePlaceHolder.dart';
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
