import 'package:flutter/material.dart';
import 'package:finlog/widgets/custom_app_bar_notif.dart';

import 'package:finlog/screens/placeHolderPage/reusablePlaceHolder.dart';
class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: const ReusablePlaceholder(
      imagePath: 'assets/images/wifi-off.png',
      titleText: 'Anda sedang \nmode offline',
      subtitleText: 'mengalihkan ke \n pencatatan manual',
    ), 
    );
  }
}
