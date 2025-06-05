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

  void parseOcrResult(String ocrResult) {
    // =======================================================================
    // PENTING: IMPLEMENTASIKAN LOGIKA PARSING OCR ANDA DI SINI
    // =======================================================================
    // Contoh data dummy (HAPUS DAN GANTI DENGAN PARSING NYATA):
    displayDate = "18/12/2025";
    displayTime = "08:49:11";
    billItems = [
      BillItem(
        name: 'Ultramilk Cokelat 250ml',
        price: 3000,
        quantity: 3,
        total: 9000,
      ),
      BillItem(
        name: 'Kanzler Sosis Original',
        price: 10000,
        quantity: 1,
        total: 10000,
      ),
      BillItem(
        name: 'Silverqueen 62g',
        price: 12000,
        quantity: 2,
        total: 24000,
      ),
      BillItem(
        name: 'Air Mineral Botol 600ml',
        price: 3000,
        quantity: 1,
        total: 3000,
      ),
    ];
    // Hitung total berdasarkan item yang diparsing
    subtotal = billItems.fold(0, (sum, item) => sum + item.total);
    pajak = 0; // Hitung jika ada info pajak
    diskon = 0; // Hitung jika ada info diskon
    lainnya = 0;
    jumlahTotal = subtotal + pajak - diskon + lainnya;

    notifyListeners(); // Notify listeners that data has changed
  }
}
