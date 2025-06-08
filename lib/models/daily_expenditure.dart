import 'package:finlog/models/bill_item.dart';

class DailyExpenditure {
  final DateTime date;
  final List<BillItem> items;

  DailyExpenditure({required this.date, required this.items});
}

// TODO : implement aggregate data from the objectBox here and then bringing it to the frontend
// This class represents a daily expenditure, which includes a date and a list of bill items.
