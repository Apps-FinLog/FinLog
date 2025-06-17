import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Import shared colors

class BillActionButtons extends StatelessWidget {
  final VoidCallback onUbahBill;
  final VoidCallback onKonfirmasiBill;
  final bool isEditing;

  const BillActionButtons({
    super.key,
    required this.onUbahBill,
    required this.onKonfirmasiBill,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onUbahBill,
              style: ElevatedButton.styleFrom(
                backgroundColor: finlogButtonGrey,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0.5,
              ),
              child: Text(
                isEditing ? 'Batalkan' : 'Ubah Bill',
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
              onPressed: onKonfirmasiBill,
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
    );
  }
}
