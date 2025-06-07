import 'package:flutter/material.dart';
import 'package:finlog/models/bill_item.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class BillData extends ChangeNotifier {
  String displayDate;
  String displayTime;
  List<BillItem> billItems = [];
  double subtotal = 0.0;
  double pajak = 0.0;
  double diskon = 0.0;
  double lainnya = 0.0;
  double jumlahTotal = 0.0;

  BillData()
      : displayDate = DateFormat('dd/MM/yyyy').format(DateTime.now()),
        displayTime = DateFormat('HH:mm:ss').format(DateTime.now());

  void parseOcrResult(Map<String, dynamic> ocrData) {
    if (ocrData['displayDate'] != null && ocrData['displayDate'].isNotEmpty) {
      displayDate = ocrData['displayDate'];
    }
    if (ocrData['displayTime'] != null && ocrData['displayTime'].isNotEmpty) {
      displayTime = ocrData['displayTime'];
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
