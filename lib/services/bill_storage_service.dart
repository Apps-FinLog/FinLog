import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:finlog/models/bill_data.dart';
import 'package:finlog/models/bill_item.dart'; // Import BillItem

class BillStorageService {
  static const String _billBoxName = 'bills';

  Future<void> init() async {
  }

  Future<Box<BillData>> _openBillBox() async {
    return await Hive.openBox<BillData>(_billBoxName);
  }

  Future<void> saveBill(BillData billData) async {
    final box = await _openBillBox();
    await box.add(billData);
    await box.close();
  }

  Future<List<BillData>> getAllBills() async {
    final box = await _openBillBox();
    final bills = box.values.toList();
    await box.close();
    return bills;
  }

  // You might want to add methods for deleting, updating, or getting a specific bill later.
}
