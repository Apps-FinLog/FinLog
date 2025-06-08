import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:finlog/widgets/components/card.dart';
import 'package:finlog/models/daily_expenditure.dart';
import 'package:finlog/widgets/history/history_list_item.dart';

class DailyExpenditureCard extends StatelessWidget {
  final DailyExpenditure dailyExpenditure;

  const DailyExpenditureCard({super.key, required this.dailyExpenditure});

  @override
  Widget build(BuildContext context) {
    return ReusablePageCard(
      title: DateFormat('EEEE, dd MMMM yyyy').format(dailyExpenditure.date),
      subtitle: 'Total: ${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(dailyExpenditure.items.fold(0.0, (sum, item) => sum + item.total))}',
      child: Column(
        children: dailyExpenditure.items
            .map((item) => HistoryListItem(billItem: item))
            .toList(),
      ),
    );
  }
}
