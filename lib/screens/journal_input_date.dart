import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming this file has the necessary colors
import 'package:finlog/screens/journal_input_type.dart';
import 'package:finlog/widgets/custom_date_picker_field.dart';

class JournalInputDateScreen extends StatefulWidget {
  const JournalInputDateScreen({super.key});

  @override
  State<JournalInputDateScreen> createState() => _JournalInputDateScreenState();
}

class _JournalInputDateScreenState extends State<JournalInputDateScreen> {
  late DateTime _selectedDate;
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime(2024, 12, 5); // Default selected date
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Widget _buildContentCard() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 30.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            finlogBluePrimaryDark,
            finlogBluePrimary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.8],
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.auto_awesome_outlined,
            color: Colors.white,
            size: 48,
          ),
          const SizedBox(height: 16),
          const Text(
            'Catat Keuangan\nseperti chat dengan\nsobat ^ ^',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 30),
          CustomDatePickerField(
            label: 'Tanggal',
            controller: _dateController,
            initialDate: _selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0, left: 4.0),
            child: Text(
              'Seingat kamu ya!',
              style: TextStyle(
                color: Colors.white.withAlpha((0.7) * 255 ~/ 1),
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Jurnal', // Changed title
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: _buildContentCard(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: finlogButtonGrey,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 1,
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: finlogButtonTextDark,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const JournalInputTypeScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: finlogButtonDark,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 1,
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
