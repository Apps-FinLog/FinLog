import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming this file has the necessary colors
import 'package:finlog/screens/bill_details_screen.dart';
import 'package:finlog/screens/journal_input_type.dart'; // Import the JournalInputTypeScreen

// Placeholder for an input item model, if you were to make this dynamic
class VerifikasiItem {
  final String id; // Placeholder
  VerifikasiItem({required this.id});
}

class VerifikasiInputScreen extends StatefulWidget {
  const VerifikasiInputScreen({super.key});

  @override
  State<VerifikasiInputScreen> createState() => _VerifikasiInputScreenState();
}

class _VerifikasiInputScreenState extends State<VerifikasiInputScreen> {
  // Dummy list of items to simulate a list

  void _tambahLagi() {
    // Navigate back to the JournalInputTypeScreen to add more entries
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const JournalInputTypeScreen()),
    );
  }

  void _konfirmasi() {
    // Handle confirmation logic
    debugPrint('Konfirmasi ditekan');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Input berhasil dikonfirmasi! (simulasi)')),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BillDetailsScreen(ocrResult: '')),
    );
  }

  // Helper widget to build a skeleton loading bar
  Widget _buildSkeletonBar({double widthFactor = 0.8, double height = 16.0, double verticalMargin = 6.0}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      width: MediaQuery.of(context).size.width * widthFactor,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.3) * 255 ~/ 1), // Lighter color for skeleton
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildInputItemSection() {
    // This simulates a section with a couple of input lines
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSkeletonBar(widthFactor: 0.7, height: 18),
        _buildSkeletonBar(widthFactor: 0.5, height: 14),
        const SizedBox(height: 10), // Space before next group or button
      ],
    );
  }

  Widget _buildContentCard() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            finlogBluePrimaryDark,
            finlogBluePrimary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.9]
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: SingleChildScrollView( // To allow scrolling if content is long
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rincian Input',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Divider(color: Colors.white.withAlpha((0.3) * 255 ~/ 1), thickness: 0.8),
            const SizedBox(height: 12),
            Text(
              '18/12/2025', // Date from image
              style: TextStyle(
                color: Colors.white.withAlpha((0.9) * 255 ~/ 1),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            // Simulating multiple input groups
            _buildInputItemSection(),
            _buildInputItemSection(),


            // "Tambah Lagi" Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _tambahLagi,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withAlpha((0.95) * 255 ~/ 1), // Light button
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 1,
                ),
                child: const Text(
                  'Tambah Lagi',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: finlogBluePrimaryDark, // Dark text on light button
                  ),
                ),
              ),
            ),

            // Divider before summary/totals
            Divider(color: Colors.white.withAlpha((0.3) * 255 ~/ 1), thickness: 0.8, height: 30),
            const SizedBox(height: 10),

            // Simulating summary/total section
            _buildSkeletonBar(widthFactor: 0.4, height: 18),
            _buildSkeletonBar(widthFactor: 0.3, height: 14),
            const SizedBox(height: 20), // Extra space at the bottom of the card content
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FinLog',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              // Placeholder for profile image, replace with actual image/icon
              backgroundColor: finlogProfileBgPlaceholder, // Use your defined color
              // child: Image.asset('assets/images/your_avatar.png'), // Example
            ),
          ),
        ],
        backgroundColor: Colors.grey[50], // Light AppBar background
        elevation: 0.8,
        // leading: IconButton( // Optional: Add back button if this screen is not a root
        //   icon: Icon(Icons.arrow_back, color: Colors.black87),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
      ),
      backgroundColor: Colors.grey[200], // Standard screen background
      body: Column( // Use Column to stack card and bottom button
        children: [
          Expanded( // Card takes available space
            child: _buildContentCard(),
          ),
          // "Konfirmasi" Button at the bottom
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 24.0), // Padding for the button
            child: SizedBox( // Use SizedBox to control button width if needed
              width: double.infinity, // Make button full width within padding
              child: ElevatedButton(
                onPressed: _konfirmasi,
                style: ElevatedButton.styleFrom(
                  backgroundColor: finlogButtonDark, // Dark button as per image
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Konfirmasi',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
