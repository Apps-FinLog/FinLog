import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:finlog/models/bill_data.dart';
import 'package:finlog/constants/chart_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillStorageService extends ChangeNotifier {
  static const String _billBoxName = 'bills';
  
  // Cache for bills data
  List<BillData> _cachedBills = [];
  bool _isInitialized = false;

  Future<void> init() async {
    await _loadBills();
  }
  Future<Box<BillData>> _openBillBox() async {
    return await Hive.openBox<BillData>(_billBoxName);
  }

  // Load bills from Hive and cache them
  Future<void> _loadBills() async {
    try {
      final box = await _openBillBox();
      _cachedBills = box.values.toList();
      await box.close();
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading bills: $e');
      _cachedBills = [];
      _isInitialized = true;
    }
  }

  Future<void> saveBill(BillData billData) async {
    final box = await _openBillBox();
    await box.add(billData);
    await box.close();
    
    // Update cache
    _cachedBills.add(billData);
    notifyListeners(); // Notify listeners when new bill is saved
  }

  // Synchronous method to get all bills from cache
  List<BillData> getAllBills() {
    if (!_isInitialized) {
      debugPrint('BillStorageService not initialized. Call init() first.');
      return [];
    }
    return List.from(_cachedBills);
  }
  // Get bills for a specific month and year
  List<BillData> getBillsForMonth(int month, int year) {
    try {
      final bills = getAllBills();
      return bills.where((bill) {
        try {
          final billDate = DateFormat('dd/MM/yyyy').parseStrict(bill.displayDate);
          return billDate.month == month && billDate.year == year;
        } catch (e) {
          debugPrint('Error parsing date for bill: ${bill.displayDate}');
          return false;
        }
      }).toList();
    } catch (e) {
      debugPrint('Error fetching bills for month: $e');
      return [];
    }
  }

  // Get bills for the target month (June 2025)
  List<BillData> getTargetMonthBills() {
    return getBillsForMonth(ChartConstants.targetMonth, ChartConstants.targetYear);
  }

  // Get total expenses for target month
  double getTargetMonthTotalExpenses() {
    try {
      final bills = getTargetMonthBills();
      return bills.fold<double>(0.0, (double sum, BillData bill) => sum + bill.jumlahTotal);
    } catch (e) {
      debugPrint('Error calculating total expenses: $e');
      return 0.0;
    }
  }

  // Get bills count for target month
  int getTargetMonthBillsCount() {
    final bills = getTargetMonthBills();
    return bills.length;
  }

  // Get progress value for pie chart (0.0 to 1.0)
  double getTargetMonthProgressValue() {
    final totalExpenses = getTargetMonthTotalExpenses();
    if (totalExpenses == 0) return 0.0;
    
    final progress = totalExpenses / ChartConstants.maxMonthlyBudget;
    return progress > 1.0 ? 1.0 : progress; // Cap at 1.0
  }

  // Get current month name in Indonesian
  String getCurrentMonthName() {
    final now = DateTime.now();
    if (now.month == ChartConstants.targetMonth && now.year == ChartConstants.targetYear) {
      return ChartConstants.monthName;
    }
    // If not current month, return the target month name
    return ChartConstants.monthName;
  }

  // Check if target month has any data
  bool hasTargetMonthData() {
    final count = getTargetMonthBillsCount();
    return count > 0;
  }

  // You might want to add methods for deleting, updating, or getting a specific bill later.
}
