import 'package:flutter/material.dart';
import 'package:finlog/widgets/components/card.dart';
import 'package:finlog/models/bill_item.dart';
import 'package:finlog/models/daily_expenditure.dart';
import 'package:finlog/widgets/history/daily_expenditure_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  // Mock data for demonstration
  List<DailyExpenditure> get _mockDailyExpenditures {
    return [
      DailyExpenditure(
        date: DateTime(2025, 6, 7),
        items: [
          BillItem(name: 'Kopi Janji Jiwa', price: 25000, quantity: 1, total: 25000),
          BillItem(name: 'Makan Siang - Warteg Bahari', price: 30000, quantity: 1, total: 30000),
        ],
      ),
      DailyExpenditure(
        date: DateTime(2025, 6, 6),
        items: [
          BillItem(name: 'Transportasi Gojek', price: 15000, quantity: 1, total: 15000),
          BillItem(name: 'Belanja Bulanan di Indomaret', price: 120000, quantity: 1, total: 120000),
        ],
      ),
      DailyExpenditure(
        date: DateTime(2025, 6, 5),
        items: [
          BillItem(name: 'Beli Buku', price: 75000, quantity: 1, total: 75000),
          BillItem(name: 'Bayar Listrik', price: 150000, quantity: 1, total: 150000),
        ],
      ),
      DailyExpenditure(
        date: DateTime(2025, 6, 4),
        items: [
          BillItem(name: 'Pulsa Telepon', price: 50000, quantity: 1, total: 50000),
          BillItem(name: 'Donasi Amal', price: 20000, quantity: 1, total: 20000),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ReusablePageCard(
            title: 'Transactions to PDF',
            subtitle: 'Donwload Transaksi menjadi PDF',
            child: Column(
              children: [
                // Map mock daily expenditures to DailyExpenditureCard widgets
                ..._mockDailyExpenditures.map((dailyExp) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24.0), // Space between cards
                    child: DailyExpenditureCard(dailyExpenditure: dailyExp),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 24), // Spacer between the two cards
          // The existing "Transactions to PDF" card
          
        ],
      ),
    );
  }
}
