import 'package:flutter/material.dart';
import 'package:finlog/widgets/homeWidgets/home_filter_buttons.dart';
import 'package:finlog/widgets/homeWidgets/home_catat_cepat_card.dart';
import 'package:finlog/widgets/homeWidgets/home_catat_jurnal_card.dart';
import 'package:finlog/widgets/homeWidgets/home_summary_card.dart';
import 'package:finlog/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({super.key});

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call super.build(context)
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0), // Added top padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
        children: [
          const HomeFilterButtons(),
          const SizedBox(height: 20),          SummaryCard(
            onTap: () {
              // Navigate to the detailed summary page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Placeholder()), // Replace with actual page
              );
            },
            title: AppLocalizations.of(context)!.expenditureMonthYear(
              DateFormat.MMMM(Localizations.localeOf(context).languageCode).format(DateTime.now()),
              DateTime.now().year.toString(),
            ),
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
