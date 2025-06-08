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
      subtitle: 'Total: \$${dailyExpenditure.items.fold(0.0, (sum, item) => sum + item.total).toStringAsFixed(2)}',
      child: Column(
        children: dailyExpenditure.items
            .map((item) => HistoryListItem(billItem: item))
            .toList(),
      ),
    );
  }
}
