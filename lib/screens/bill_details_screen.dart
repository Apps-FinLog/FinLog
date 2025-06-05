import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Import shared colors
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/models/bill_data.dart'; // Import BillData
import 'package:provider/provider.dart'; // Import Provider

class BillDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> ocrResult;
  const BillDetailsScreen({super.key, required this.ocrResult});

  @override
  State<BillDetailsScreen> createState() => _BillDetailsScreenState();
}

class _BillDetailsScreenState extends State<BillDetailsScreen> {
  late BillData _billData;

  @override
  void initState() {
    super.initState();
    _billData = BillData();
    _billData.parseOcrResult(widget.ocrResult);
  }

  void _ubahBill() {
    debugPrint('Tombol Ubah Bill ditekan');
    // TODO: Implementasi navigasi ke layar edit atau tampilkan form edit
  }

  void _konfirmasiBill() {
    debugPrint('Tombol Konfirmasi ditekan. Data: ${_billData.billItems}, Total: ${_billData.jumlahTotal}');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tagihan berhasil dikonfirmasi!')),
    );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen(initialIndex: 2)),
      (Route<dynamic> route) => false, // This makes sure all previous routes are removed
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withAlpha((isTotal ? 1.0 : 0.9) * 255 ~/ 1),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withAlpha((isTotal ? 1.0 : 0.9) * 255 ~/ 1),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BillData>.value(
      value: _billData,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'FinLog',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(backgroundColor: finlogProfileBgPlaceholder),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 1.0,
          foregroundColor: Colors.black,
        ),
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
                              'Splitt Bill',
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

                            if (billData.billItems.isEmpty)
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30.0),
                                  child: Text(
                                    "Tidak ada item terdeteksi.",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              )
                            else
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: billData.billItems.length,
                                itemBuilder: (context, index) {
                                  final item = billData.billItems[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.name,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                'Rp. ${item.price.toStringAsFixed(0)}',
                                                style: TextStyle(
                                                  color: Colors.white.withAlpha(
                                                    (0.8) * 255 ~/ 1,
                                                  ),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 55, // Lebar untuk kuantitas
                                          alignment: Alignment.topCenter,
                                          padding: const EdgeInsets.only(top: 1),
                                          child: Text(
                                            '${item.quantity}x',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 1),
                                            child: Text(
                                              'Rp. ${item.total.toStringAsFixed(0)}',
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            Divider(
                              color: Colors.white.withAlpha((0.3) * 255 ~/ 1),
                              height: 28,
                              thickness: 0.8,
                            ),

                            _buildSummaryRow(
                              'Subtotal',
                              'Rp. ${billData.subtotal.toStringAsFixed(0)}',
                            ),
                            _buildSummaryRow(
                              'Pajak',
                              'Rp. ${billData.pajak.toStringAsFixed(0)}',
                            ),
                            _buildSummaryRow(
                              'Diskon',
                              'Rp. ${billData.diskon.toStringAsFixed(0)}',
                            ),
                            _buildSummaryRow(
                              'Lainnya',
                              'Rp. ${billData.lainnya.toStringAsFixed(0)}',
                            ),
                            const SizedBox(height: 8),
                            _buildSummaryRow(
                              'Jumlah Total',
                              'Rp. ${billData.jumlahTotal.toStringAsFixed(0)}',
                              isTotal: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _ubahBill,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: finlogButtonGrey,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.5,
                            ),
                            child: const Text(
                              'Ubah Bill',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: finlogButtonTextDark,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _konfirmasiBill,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: gradientMiddle, // Atau gradientEnd
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Konfirmasi',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
