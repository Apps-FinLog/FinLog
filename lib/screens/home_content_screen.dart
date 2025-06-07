import 'package:flutter/material.dart';
import 'package:finlog/widgets/home_filter_buttons.dart';
import 'package:finlog/widgets/home_summary_card.dart';
import 'package:finlog/widgets/home_catat_cepat_card.dart';
import 'package:finlog/widgets/home_catat_jurnal_card.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0), // Added top padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
        children: const [
          HomeFilterButtons(),
          SizedBox(height: 20),
          HomeSummaryCard(),
          SizedBox(height: 24),
          HomeCatatCepatCard(),
          SizedBox(height: 20),
          HomeCatatJurnalCard(),
          SizedBox(height: 20), // Extra padding at the bottom
        ],
      ),
    );
  }
}
