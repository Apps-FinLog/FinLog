import 'package:flutter/material.dart';
import 'package:finlog/models/bill_item.dart';
import 'package:intl/intl.dart';

/// A helper widget to represent a single row in the history list.
class HistoryListItem extends StatelessWidget {
  final BillItem billItem;
  final IconData? icon;
  final Color? iconColor;

  const HistoryListItem({
    super.key,
    required this.billItem,
    this.icon = Icons.file_download_outlined, // Default icon for bill items
    this.iconColor = Colors.blue, // Default color is blue
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  billItem.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${billItem.quantity} x ${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(billItem.price)} = ${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(billItem.total)}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          
        ],
      ),
    );
  }
}
