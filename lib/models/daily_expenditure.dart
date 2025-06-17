import 'package:finlog/models/bill_data.dart';

class DailyExpenditure {
  final DateTime date;
  final List<BillData> bills;

  DailyExpenditure({required this.date, required this.bills});
}

// TODO : implement aggregate data from the objectBox here and then bringing it to the frontend
// This class represents a daily expenditure, which includes a date and a list of bill data.
