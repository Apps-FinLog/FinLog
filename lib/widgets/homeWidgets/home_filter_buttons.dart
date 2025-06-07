import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';

class HomeFilterButtons extends StatelessWidget {
  const HomeFilterButtons({super.key});

  // Helper widget for the filter buttons
  Widget _buildFilterButton(BuildContext context, String text, IconData iconData, {bool isActive = false}) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Implement filter action
      },
      icon: Icon(iconData, size: 18, color: isActive ? finlogBluePrimary : Colors.grey[700]),
      label: Text(
        text,
        style: TextStyle(
          color: isActive ? finlogBluePrimary : Colors.grey[700],
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[100], // Very light grey, almost white
        elevation: 0.5,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey[300]!, width: 0.5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildFilterButton(context, 'Pengeluaran', Icons.arrow_upward, isActive: true),
        const SizedBox(width: 12),
        _buildFilterButton(context, 'Kategori', Icons.arrow_downward),
      ],
    );
  }
}
