import 'package:intl/intl.dart';

class ManualInputData {
  final double nominal;
  final String category;
  final DateTime date;
  final String? description; // Make description optional

  ManualInputData({
    required this.nominal,
    required this.category,
    required this.date,
    this.description, // Add to constructor
  });

  @override
  String toString() {
    return 'Nominal: $nominal, Category: $category, Date: ${DateFormat('dd/MM/yyyy').format(date)}, Description: ${description ?? 'N/A'}';
  }
}
