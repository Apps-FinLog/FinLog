import 'package:flutter/material.dart';
import 'package:finlog/models/bill_data.dart';
import 'package:intl/intl.dart';

class BillSummaryItem extends StatelessWidget {
  final BillData billData;
  final IconData? icon;
  final Color? iconColor;

  const BillSummaryItem({
    super.key,
    required this.billData,
    this.icon = Icons.receipt_outlined,
    this.iconColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child:            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  billData.billItems.isNotEmpty 
                    ? billData.billItems.first.name
                    : 'No items',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${billData.billItems.length} item(s)',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currencyFormatter.format(billData.jumlahTotal),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              if (billData.billItems.isNotEmpty)
                Text(
                  billData.billItems.first.name,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF888888),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
          const SizedBox(width: 16),
          Icon(
            icon,
            color: Colors.grey[300],
            size: 24,
          ),
        ],
      ),
    );
  }
}