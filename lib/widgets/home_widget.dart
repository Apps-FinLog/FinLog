import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming your custom colors are here
import 'package:finlog/screens/journal_input_date.dart'; // Import for Catat Jurnal button
import 'package:finlog/widgets/hero_card.dart'; // Import for SummaryCard
import 'package:finlog/widgets/catat_cepat.dart';
class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  // Helper widget for the filter buttons
  Widget _buildFilterButton(BuildContext context, String text, IconData iconData, {bool isActive = false}) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Implement filter action
      },
      icon: Icon(iconData, size: 18, color: isActive ? finlogBluePrimary : Colors.grey[700]),
      label: Text(
        text,
        style: TextStyle(
          color: isActive ? finlogBluePrimary : Colors.grey[700],
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[100], // Very light grey, almost white
        elevation: 0.5,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey[300]!, width: 0.5),
        ),
      ),
    );
  }

  // below is the filter button caller method 

  Widget _buildFilterButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildFilterButton(context, 'Pengeluaran', Icons.arrow_upward, isActive: true),
        const SizedBox(width: 12),
        _buildFilterButton(context, 'Kategori', Icons.arrow_downward),
      ],
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    return (
      SummaryCard(
        onTap: () {
          // TODO: Implement onTap action
        },
        amount: 1300000, // Example amount
        title: 'Pengeluaran Mei 2025', // Example title
      )
    );
  }

  Widget _buildCatatCepatCard(BuildContext context) {
    return (
      CatatCepat()
    );
  }

  Widget _buildCatatJurnalCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [finlogBluePrimary, finlogBluePrimaryDark], // Slightly different gradient
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
         boxShadow: [
          BoxShadow(
            color: finlogBluePrimary.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'Catat Jurnal',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.chat_bubble_outline, color: Colors.white, size: 20),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Ada guilty confession kamu\njajan apa aja hari ini?',
                  style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>JournalInputDateScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: finlogButtonDark,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Yuk ~ catat!', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }


// below is the main build method for the widgets

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0), // Added top padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
        children: [
          _buildFilterButtons(context),
          const SizedBox(height: 20),
          _buildSummaryCard(context),
          const SizedBox(height: 24),
          _buildCatatCepatCard(context),
          const SizedBox(height: 20),
          _buildCatatJurnalCard(context),
          const SizedBox(height: 20), // Extra padding at the bottom
        ],
      ),
    );
  }
}
