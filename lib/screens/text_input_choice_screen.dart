import 'package:flutter/material.dart';
import 'package:finlog/screens/text_input_page/manual_input_screen.dart';
import 'package:finlog/screens/text_input_page/journal_input_date.dart';

class TextInputChoiceScreen extends StatefulWidget {
  const TextInputChoiceScreen({super.key});

  @override
  State<TextInputChoiceScreen> createState() => _TextInputChoiceScreenState();
}

class _TextInputChoiceScreenState extends State<TextInputChoiceScreen> {
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
