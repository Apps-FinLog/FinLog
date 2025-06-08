import 'package:flutter/material.dart';
import 'package:finlog/widgets/homeWidgets/home_filter_buttons.dart';
import 'package:finlog/widgets/homeWidgets/home_catat_cepat_card.dart';
import 'package:finlog/widgets/homeWidgets/home_catat_jurnal_card.dart';
import 'package:finlog/widgets/homeWidgets/home_summary_card.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0), // Added top padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
        children: [
          const HomeFilterButtons(),
          const SizedBox(height: 20),
          SummaryCard(
            onTap: () {
              // Navigate to the detailed summary page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Placeholder()), // Replace with actual page
              );
            },
            amount: 1300000, // Example amount
            title: 'Pengeluaran Mei 2025', // Example title
          ),
          const SizedBox(height: 24),
          CatatCepat(),
          const SizedBox(height: 20),
          const HomeCatatJurnalCard(),
          const SizedBox(height: 20), // Extra padding at the bottom
        ],
      ),
    );
  }
}
