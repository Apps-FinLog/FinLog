import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';
import 'package:finlog/screens/text_input_page/journal_input_date.dart';
import 'package:finlog/l10n/app_localizations.dart';

class HomeCatatJurnalCard extends StatelessWidget {
  const HomeCatatJurnalCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            color: finlogBluePrimary.withAlpha((0.3 * 255).round()),
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
                  children: [
                    Text(
                      AppLocalizations.of(context)!.journalInputTitle,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 20),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.journalInputCardTitle,
                  style: TextStyle(color: Colors.white.withAlpha((0.9 * 255).round()), fontSize: 14, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              // TODO: Navigate to Jurnal Input
              
              Navigator.push(context, MaterialPageRoute(builder:(context)=>JournalInputDateScreen()));
            
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: finlogButtonDark,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(AppLocalizations.of(context)!.recordFinanceToday, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
