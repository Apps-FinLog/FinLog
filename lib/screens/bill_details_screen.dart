import 'package:flutter/material.dart';

// Taruh BillItem class di sini atau di file model terpisah
class BillItem {
  final String name;
  final double price;
  final int quantity;
  final double total;

  BillItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.total,
  });
}

// Warna dari desain
const Color gradientStart = Color(0xFF60A5FA);
const Color gradientMiddle = Color(0xFF0C6BFF);
const Color gradientEnd = Color(0xFF1E3A8A);
const Color finlogProfileBgPlaceholder = Color(0xFFD8D8D8);
const Color finlogButtonGrey = Color(0xFFE0E0E0);
const Color finlogButtonTextDark = Color(
  0xFF333333,
); // Teks lebih gelap untuk kontras

class BillDetailsScreen extends StatefulWidget {
  final String ocrResult;
  const BillDetailsScreen({super.key, required this.ocrResult});

  @override
  State<BillDetailsScreen> createState() => _BillDetailsScreenState();
}

class _BillDetailsScreenState extends State<BillDetailsScreen> {
  String displayDate = "DD/MM/YYYY";
  String displayTime = "HH:MM:SS";
  List<BillItem> billItems = [];
  double subtotal = 0.0;
  double pajak = 0.0;
  double diskon = 0.0;
  double lainnya = 0.0;
  double jumlahTotal = 0.0;

  @override
  void initState() {
    super.initState();
    _parseOcrResult();
  }

  void _parseOcrResult() {
    // =======================================================================
    // PENTING: IMPLEMENTASIKAN LOGIKA PARSING OCR ANDA DI SINI
    // =======================================================================
    // Contoh data dummy (HAPUS DAN GANTI DENGAN PARSING NYATA):
    setState(() {
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
    });
  }

  void _ubahBill() {
    print('Tombol Ubah Bill ditekan');
    // TODO: Implementasi navigasi ke layar edit atau tampilkan form edit
  }

  void _konfirmasiBill() {
    print('Tombol Konfirmasi ditekan. Data: $billItems, Total: $jumlahTotal');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tagihan berhasil dikonfirmasi!')),
    );
    // TODO: Implementasi navigasi selanjutnya, misal kembali ke home atau daftar tagihan
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
              color: Colors.white.withOpacity(isTotal ? 1.0 : 0.9),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withOpacity(isTotal ? 1.0 : 0.9),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
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
                        color: Colors.grey.withOpacity(0.3),
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
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '$displayDate   $displayTime',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.3),
                        height: 28,
                        thickness: 0.8,
                      ),

                      if (billItems.isEmpty)
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
                          itemCount: billItems.length,
                          itemBuilder: (context, index) {
                            final item = billItems[index];
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
                                            color: Colors.white.withOpacity(
                                              0.8,
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
                        color: Colors.white.withOpacity(0.3),
                        height: 28,
                        thickness: 0.8,
                      ),

                      _buildSummaryRow(
                        'Subtotal',
                        'Rp. ${subtotal.toStringAsFixed(0)}',
                      ),
                      _buildSummaryRow(
                        'Pajak',
                        'Rp. ${pajak.toStringAsFixed(0)}',
                      ),
                      _buildSummaryRow(
                        'Diskon',
                        'Rp. ${diskon.toStringAsFixed(0)}',
                      ),
                      _buildSummaryRow(
                        'Lainnya',
                        'Rp. ${lainnya.toStringAsFixed(0)}',
                      ),
                      const SizedBox(height: 8),
                      _buildSummaryRow(
                        'Jumlah Total',
                        'Rp. ${jumlahTotal.toStringAsFixed(0)}',
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
        ),
      ),
    );
  }
}
