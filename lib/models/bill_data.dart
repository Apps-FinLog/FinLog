import 'package:flutter/material.dart';
import 'package:finlog/models/bill_item.dart';

class BillData extends ChangeNotifier {
  String displayDate = "DD/MM/YYYY";
  String displayTime = "HH:MM:SS";
  List<BillItem> billItems = [];
  double subtotal = 0.0;
  double pajak = 0.0;
  double diskon = 0.0;
  double lainnya = 0.0;
  double jumlahTotal = 0.0;

  void parseOcrResult(Map<String, dynamic> ocrData) {
    displayDate = ocrData['displayDate'] ?? "DD/MM/YYYY";
    displayTime = ocrData['displayTime'] ?? "HH:MM:SS";

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
