import 'package:flutter/material.dart';
// Assuming your card widget is located at this path as per your code
import 'package:finlog/widgets/components/card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The main scrollable view for the screen
    return SingleChildScrollView(
      // Padding around the content to prevent it from touching screen edges
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // First instance of the reusable card, matching your image
          ReusablePageCard(
            title: 'Transactions to PDF',
            subtitle: 'Donwload Transaksi menjadi PDF',
            // The child is a Column to hold the list of history items
            child: Column(
              // Using a list of a private, reusable widget for each item
              children: const [
                _HistoryListItem(
                  title: 'Pembelian Kopi Janji Jiwa',
                  subtitle: '17 Oktober 2023 - PDF',
                  icon: Icons.file_download_outlined,
                ),
                _HistoryListItem(
                  title: 'Makan Siang - Warteg Bahari',
                  subtitle: '16 Oktober 2023 - PDF',
                  icon: Icons.file_download_outlined,
                ),
                _HistoryListItem(
                  title: 'Transportasi Gojek',
                  subtitle: '16 Oktober 2023 - PDF',
                  icon: Icons.file_download_outlined,
                ),
                _HistoryListItem(
                  title: 'Belanja Bulanan di Indomaret',
                  subtitle: '15 Oktober 2023 - PDF',
                  icon: Icons.file_download_outlined,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24), // Spacer between the two cards

          // A second card to demonstrate reusability
          ReusablePageCard(
            title: 'Recent Activity',
            subtitle: 'View your latest account movements',
            child: Column(
              children: const [
                _HistoryListItem(
                  title: 'Gaji Bulanan PT. FinLog',
                  subtitle: '30 September 2023 - Income',
                  icon: Icons.arrow_upward_rounded,
                  iconColor: Colors.green,
                ),
                _HistoryListItem(
                  title: 'Pembayaran Tagihan Listrik',
                  subtitle: '28 September 2023 - Bills',
                  icon: Icons.receipt_long_outlined,
                  iconColor: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A private helper widget to represent a single row in the history list.
/// Using a dedicated widget like this makes the code cleaner and easier to
/// maintain. You can later connect this to your actual data model.
class _HistoryListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;

  const _HistoryListItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.iconColor = Colors.blue, // Default color is blue
  });

  @override
  Widget build(BuildContext context) {
    // Using Padding to create the vertical space between each item.
    // The last item will also have this padding, which looks good at the
    // bottom of the card.
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // This Expanded widget ensures the text column takes up all
          // available space, pushing the icon to the far right.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16), // Space between text and icon
          Icon(icon, color: iconColor, size: 28),
          // TODO: add the button handler here if needed
        ],
      ),
    );
  }
}