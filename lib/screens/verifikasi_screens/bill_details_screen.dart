import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Import shared colors
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/models/bill_data.dart'; // Import BillData
import 'package:provider/provider.dart'; // Import Provider
import 'package:finlog/widgets/headers/custom_app_bar.dart'; // Import CustomAppBar
import 'package:finlog/widgets/bill_widgets/bill_summary_row.dart'; // Import BillSummaryRow
import 'package:finlog/widgets/bill_widgets/bill_item_list.dart'; // Import BillItemList
import 'package:finlog/widgets/bill_widgets/bill_action_buttons.dart'; // Import BillActionButtons

class BillDetailsScreen extends StatefulWidget {
  final BillData billData;
  const BillDetailsScreen({super.key, required this.billData});

  @override
  State<BillDetailsScreen> createState() => _BillDetailsScreenState();
}

class _BillDetailsScreenState extends State<BillDetailsScreen> {
  late BillData _billData;

  @override
  void initState() {
    super.initState();
    _billData = widget.billData;
  }

  void _ubahBill() {
    debugPrint('Tombol Ubah Bill ditekan');
    // TODO: Implementasi navigasi ke layar edit atau tampilkan form edit
  }

  void _konfirmasiBill() {
    debugPrint('Tombol Konfirmasi ditekan. Data: ${_billData.billItems}, Total: ${_billData.jumlahTotal}');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen(initialIndex: 2)),
      (Route<dynamic> route) => false, // This makes sure all previous routes are removed
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BillData>.value(
      value: _billData,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'FinLog'),
        backgroundColor: Colors.grey[100], // Latar body utama sedikit abu-abu
        body: SafeArea(
          child: Consumer<BillData>(
            builder: (context, billData, child) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [gradientStart, gradientMiddle, gradientEnd],
                            stops: [0.0, 0.4, 1.0],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha((0.3) * 255 ~/ 1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Verifikasi Tagihan',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Item yang Terpindai',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Pastikan semua item sudah terbaca dengan benar',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withAlpha((0.8) * 255 ~/ 1),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '${billData.displayDate}   ${billData.displayTime}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Divider(
                              color: Colors.white.withAlpha((0.3) * 255 ~/ 1),
                              height: 28,
                              thickness: 0.8,
                            ),

                            BillItemList(billData: billData),

                            Divider(
                              color: Colors.white.withAlpha((0.3) * 255 ~/ 1),
                              height: 28,
                              thickness: 0.8,
                            ),

                            BillSummaryRow(
                              label: 'Subtotal',
                              value: 'Rp. ${billData.subtotal.toStringAsFixed(0)}',
                            ),
                            BillSummaryRow(
                              label: 'Pajak',
                              value: 'Rp. ${billData.pajak.toStringAsFixed(0)}',
                            ),
                            BillSummaryRow(
                              label: 'Diskon',
                              value: 'Rp. ${billData.diskon.toStringAsFixed(0)}',
                            ),
                            BillSummaryRow(
                              label: 'Lainnya',
                              value: 'Rp. ${billData.lainnya.toStringAsFixed(0)}',
                            ),
                            const SizedBox(height: 8),
                            BillSummaryRow(
                              label: 'Jumlah Total',
                              value: 'Rp. ${billData.jumlahTotal.toStringAsFixed(0)}',
                              isTotal: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BillActionButtons(
                    onUbahBill: _ubahBill,
                    onKonfirmasiBill: _konfirmasiBill,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
