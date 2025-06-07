import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming this file has the necessary colors
import 'package:intl/intl.dart'; // For date formatting if needed for calendar


import 'package:finlog/widgets/navs/dual_action_buttons.dart';

import 'package:finlog/screens/text_input_page/journal_chat_input_screen.dart';



class JournalInputDateScreen extends StatefulWidget {
  const JournalInputDateScreen({super.key});

  @override
  State<JournalInputDateScreen> createState() => _JournalInputDateScreenState();
}

class _JournalInputDateScreenState extends State<JournalInputDateScreen> {
  DateTime _selectedDate = DateTime.now(); 
  late TextEditingController _dateController; // Initialize in initState


  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: "Pick a date");
    // Optionally, initialize with the selected date formatted
    // _dateController.text = DateFormat('d MMMM yyyy').format(_selectedDate);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  // This can be used if you want the "Pick a date" field to open a system date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: finlogBluePrimary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogTheme: DialogThemeData(backgroundColor: Colors.white),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
      });
    }
  }

  // Helper for TextFields
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? hintText,
    Widget? prefixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withAlpha((0.9) * 255 ~/ 1),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white.withAlpha(38)),
            prefixIcon:
                prefixIcon != null
                    ? Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                      child: IconTheme(
                        data: IconThemeData(
                          color: Colors.white.withAlpha((0.8) * 255 ~/ 1),
                        ),
                        child: prefixIcon,
                      ),
                    )
                    : null,
            filled: true,
            fillColor: Colors.white.withAlpha((0.15) * 255 ~/ 1),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white.withAlpha((0.5) * 255 ~/ 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentCard() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.fromLTRB(
        20.0,
        20.0,
        20.0,
        30.0,
      ), // Added more bottom padding
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [finlogBluePrimaryDark, finlogBluePrimary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.0,
            0.8,
          ], // Adjusted stop for a slightly different gradient feel
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress bar is removed as per new image
          // _buildCardProgressBar(),
          // const SizedBox(height: 20), // Removed as progress bar is gone
          Icon(
            Icons.auto_awesome_outlined, // Sparkling star icon
            color: Colors.white,
            size: 48,
          ),
          const SizedBox(height: 16),
          const Text(
            'Catat Keuangan\nseperti chat dengan\nsobat ^ ^', // New title
            style: TextStyle(
              color: Colors.white,
              fontSize: 26, // Slightly adjusted size for new text
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 30), // Increased spacing
          // Nominal field is removed
          _buildTextField(
            label: 'Tanggal',
            controller: _dateController,
            readOnly: true,
            onTap: () {
              _selectDate(context); // Enable system date picker
            },
            prefixIcon: Icon(Icons.calendar_today_outlined, size: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0, left: 4.0),
            child: Text(
              'Seingat kamu ya!', // New helper text
              style: TextStyle(
                color: Colors.white.withAlpha((0.7) * 255 ~/ 1),
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Removed custom calendar view as per request to use default Android date picker
          // _buildCalendarView(),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Jurnal',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: _buildContentCard())),            
            DualActionButtons(

              leftButtonText: 'Back',

              rightButtonText: 'Continue',


              onLeftButtonPressed: () {
                Navigator.of(context).pop();
              },

              onRightButtonPressed: () {
                // Di sini Anda bisa menambahkan logika validasi jika perlu,
                // misalnya, memastikan tanggal sudah dipilih.
                // if (_dateController.text != "Pick a date") { ... }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JournalChatInputScreen(),
                  ),

                );
              },

            ),

            // ========================================================
          ],
        ),
      ),
    );
  }
}
