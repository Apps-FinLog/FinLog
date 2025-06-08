import 'package:flutter/material.dart';
import 'package:finlog/models/bill_item.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart'; // Import HiveObjectMixin

part 'bill_data.g.dart';

@HiveType(typeId: 1)
class BillData extends ChangeNotifier with HiveObjectMixin {
  @HiveField(0)
  String displayDate;
  @HiveField(1)
  String displayTime;
  @HiveField(2)
  List<BillItem> billItems = [];
  @HiveField(3)
  double subtotal = 0.0;
  @HiveField(4)
  double pajak = 0.0;
  @HiveField(5)
  double diskon = 0.0;
  @HiveField(6)
  double lainnya = 0.0;
  @HiveField(7)
  double jumlahTotal = 0.0;

  BillData()
      : displayDate = DateFormat('dd/MM/yyyy').format(DateTime.now()),
        displayTime = DateFormat('HH:mm:ss').format(DateTime.now());

  void parseOcrResult(Map<String, dynamic> ocrData) {
    if (ocrData['displayDate'] != null && ocrData['displayDate'].isNotEmpty) {
      displayDate = ocrData['displayDate'];
    }

    // Robustly handle displayTime
    String? ocrDisplayTime = ocrData['displayTime'];
    if (ocrDisplayTime != null && ocrDisplayTime.isNotEmpty) {
      try {
        // Attempt to parse the time string to validate it
        DateFormat('HH:mm:ss').parseStrict(ocrDisplayTime);
        displayTime = ocrDisplayTime;
      } catch (e) {
        // If parsing fails, fall back to current time
        debugPrint('Invalid displayTime from OCR: "$ocrDisplayTime". Falling back to current time. Error: $e');
        displayTime = DateFormat('HH:mm:ss').format(DateTime.now());
      }
    } else {
      // If ocrDisplayTime is null or empty, use current time (already set by constructor)
      displayTime = DateFormat('HH:mm:ss').format(DateTime.now());
    }

    billItems = [];
    if (ocrData['billItems'] is List) {
      for (var itemJson in ocrData['billItems']) {
        try {
          billItems.add(BillItem(
            name: itemJson['name'] ?? 'Unknown Item',
            price: (itemJson['price'] as num?)?.toDouble() ?? 0.0,
            quantity: (itemJson['quantity'] as num?)?.toInt() ?? 0,
            total: (itemJson['total'] as num?)?.toDouble() ?? 0.0,
          ));
        } catch (e) {
          debugPrint("Error parsing bill item: $e, itemJson: $itemJson");
        }
      }
    }

    subtotal = (ocrData['subtotal'] as num?)?.toDouble() ?? 0.0;
    pajak = (ocrData['pajak'] as num?)?.toDouble() ?? 0.0;
    diskon = (ocrData['diskon'] as num?)?.toDouble() ?? 0.0;
    lainnya = (ocrData['lainnya'] as num?)?.toDouble() ?? 0.0;
    jumlahTotal = (ocrData['jumlahTotal'] as num?)?.toDouble() ?? 0.0;

    notifyListeners();
  }
}
