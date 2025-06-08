import 'package:flutter/material.dart';
import 'package:finlog/models/bill_data.dart';
import 'package:intl/intl.dart'; // Import for NumberFormat

class BillItemList extends StatelessWidget {
  final BillData billData;

  const BillItemList({super.key, required this.billData});

  @override
  Widget build(BuildContext context) {
    if (billData.billItems.isEmpty) {
      return const Center(
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
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: billData.billItems.length,
        itemBuilder: (context, index) {
          final item = billData.billItems[index];
          final currencyFormatter = NumberFormat.currency(
            locale: 'id_ID',
            symbol: 'Rp ',
            decimalDigits: 0,
          );

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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        currencyFormatter.format(item.price),
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
                      currencyFormatter.format(item.total),
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
      );
    }
  }
}
