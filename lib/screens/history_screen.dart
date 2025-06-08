import 'package:flutter/material.dart';
import 'package:finlog/widgets/components/card.dart';
import 'package:finlog/models/daily_expenditure.dart';
import 'package:finlog/widgets/history/daily_expenditure_card.dart';
import 'package:provider/provider.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:finlog/models/bill_data.dart';
import 'package:intl/intl.dart';
import 'package:finlog/widgets/loading_screen.dart'; // Import the new loading screen

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<DailyExpenditure> _dailyExpenditures = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBillData();
  }

  Future<void> _loadBillData() async {    final billStorageService = Provider.of<BillStorageService>(context, listen: false);
    final List<BillData> allBills = await billStorageService.getAllBills();

    // Group bills by date
    final Map<DateTime, List<BillData>> groupedBills = {};
    for (var bill in allBills) {
      try {
        final date = DateFormat('dd/MM/yyyy').parseStrict(bill.displayDate);
        final normalizedDate = DateTime(date.year, date.month, date.day); // Normalize to remove time component
        if (!groupedBills.containsKey(normalizedDate)) {
          groupedBills[normalizedDate] = [];
        }
        groupedBills[normalizedDate]!.add(bill);
      } catch (e) {
        debugPrint('Error parsing date for bill: ${bill.displayDate}. Error: $e');
        // Optionally, handle bills with unparseable dates, e.g., skip them or assign to a default date
      }
    }

    // Convert grouped bills to DailyExpenditure objects
    final List<DailyExpenditure> dailyExpenditures = groupedBills.entries.map((entry) {
      return DailyExpenditure(
        date: entry.key,
        bills: entry.value,
      );
    }).toList();

    // Sort by date in descending order
    dailyExpenditures.sort((a, b) => b.date.compareTo(a.date));

    setState(() {
      _dailyExpenditures = dailyExpenditures;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand( // Ensure the Stack takes all available space
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // Align the card itself to the start (left)
              children: [
              SizedBox(
                width: double.infinity, // Make the card expand to fill available width
                child: ReusablePageCard(
                title: 'Transactions to PDF',
                subtitle: 'Donwload Transaksi menjadi PDF',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start (top)
                  children: [
                  if (_dailyExpenditures.isEmpty && !_isLoading) // Only show "No data" if not loading
                    const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Text('No bill data available.'),
                    ),
                    ),
                  ],
                ),
                ),
              ),
                const SizedBox(height: 24), // Spacer between the two cards
                      ..._dailyExpenditures.map((dailyExp) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24.0), // Space between cards
                          child: DailyExpenditureCard(dailyExpenditure: dailyExp),
                        );
                      }),
                // The existing "Transactions to PDF" card
              ],
            ),
          ),
          if (_isLoading)
            const Positioned.fill(
              child: LoadingScreen(
                message: 'Memuat data transaksi...',
                subMessage: 'Mohon tunggu sebentar.',
              ),
            ),
        ],
      ),
    );
  }
}
