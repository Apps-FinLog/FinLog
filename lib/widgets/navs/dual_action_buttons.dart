import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';
class DualActionButtons extends StatelessWidget {
  // 1. PROPS (PROPERTIES) UNTUK REUSABILITY
  
  final String leftButtonText;
  final String rightButtonText;
  
  // VoidCallback adalah tipe data untuk fungsi yang tidak memiliki parameter dan tidak mengembalikan nilai.

  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;

  const DualActionButtons({
    super.key,
    // Kita berikan nilai default agar widget lebih mudah digunakan.
    this.leftButtonText = 'Back', 
    this.rightButtonText = 'Continue',
    required this.onLeftButtonPressed,
    required this.onRightButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    // 2. MENGGUNAKAN STRUKTUR DARI SNIPPET PERTAMA ANDA

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0), // Adjust padding as needed
      child: Row(
        children: [
          // TOMBOL KIRI
          Expanded(
            child: ElevatedButton(
              // 3. MENGHUBUNGKAN CALLBACK DARI PROPS
              onPressed: onLeftButtonPressed, 
              style: ElevatedButton.styleFrom(
                backgroundColor: finlogButtonGrey,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 1,
              ),
              // Menggunakan teks dari props
              child: Text(
                leftButtonText, 
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: finlogButtonTextDark)
              ),
            ),
          ),
          const SizedBox(width: 12),
          
          // TOMBOL KANAN
          Expanded(
            child: ElevatedButton(
              // Menghubungkan callback dari props
              onPressed: onRightButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: finlogButtonDark,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 1,
              ),
              // Menggunakan teks dari props
              child: Text(
                rightButtonText, 
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)
              ),
            ),
          ),
        ],
      ),
    );
  }
}