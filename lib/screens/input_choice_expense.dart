import 'dart:io';
import 'dart:math' as math; // Untuk animasi rotasi
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// GANTI 'finlog' dengan nama proyek Anda yang sebenarnya jika berbeda
import 'package:finlog/services/ocr_service.dart';
import 'package:finlog/screens/bill_details_screen.dart';
import 'package:finlog/screens/image_confirm_screen.dart';
import 'package:finlog/screens/manual_input_screen.dart';
import 'package:finlog/screens/journal_input_date.dart';

class InputChoiceScreenExpense extends StatefulWidget {
  const InputChoiceScreenExpense({super.key});

  @override
  State<InputChoiceScreenExpense> createState() => _InputChoiceScreenState();
}

class _InputChoiceScreenState extends State<InputChoiceScreenExpense> {
  // Helper widget to build each option item
  Widget _buildOptionItem(
    BuildContext context,
    String line1,
    String line2,
    IconData iconData, // Changed back to IconData
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(iconData, size: 24), // Use Icon widget with IconData
          SizedBox(height: 8), // Spacing between icon and text
          Text(
            line1,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            line2,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  @override // Added missing @override annotation
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/blurred-background.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            
            // Pusatkan tombol pilihan
            child: Container(
              padding: EdgeInsets.only(top:20, bottom: 20),
              color: Colors.white60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[ // ADDED CHILDREN LIST AS REQUESTED
                  _buildOptionItem(
                    context,
                    'Manual', // line1 for first item
                    'Input',  // line2 for first item
                     Icons.edit, // Using Icons.edit for Manual Input
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ManualInputScreen()),
                      );
                    },
                  ),
                  _buildOptionItem(
                    context,
                    'Jurnal', // line1 for second item
                    'Input',  // line2 for second item
                    Icons.book, // Using Icons.book for Jurnal Input
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const JournalInputDateScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: CustomBottomNavigationBar( ... ) // Jika ada
    );
  }
}
