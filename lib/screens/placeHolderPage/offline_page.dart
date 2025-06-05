import 'package:flutter/material.dart';

import 'package:finlog/screens/placeHolderPage/reusable_place_holder.dart';
class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ReusablePlaceholder(
      imagePath: 'assets/images/wifi-off.png',
      titleText: 'Anda sedang \nmode offline',
      subtitleText: 'mengalihkan ke \n pencatatan manual',
    ), 
    );
  }
}
