import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming this file has the necessary colors
import 'package:intl/intl.dart'; // For date formatting if needed for calendar
import 'package:finlog/screens/journal_input_type.dart';

class JournalInputDateScreen extends StatefulWidget {
  const JournalInputDateScreen({super.key});

  @override
  State<JournalInputDateScreen> createState() => _JournalInputDateScreenState();
}

class _JournalInputDateScreenState extends State<JournalInputDateScreen> {
  DateTime _selectedDate = DateTime(2024, 12, 5); // Default selected date from image
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
    if (picked != null && picked != _selectedDate) {
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
        Text(label, style: TextStyle(color: Colors.white.withAlpha((0.9) * 255 ~/ 1), fontSize: 14)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white.withAlpha(38)),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.white.withAlpha((0.8) * 255 ~/ 1)),
                      child: prefixIcon,
                    ),
                  )
                : null,
            filled: true,
            fillColor: Colors.white.withAlpha((0.15) * 255 ~/ 1),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
               borderSide: BorderSide(color: Colors.white.withAlpha((0.5) * 255 ~/ 1)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarView() {
    List<String> dayHeaders = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];
    List<String?> calendarDays = [
      "1", "2", "3", "4", "5", "6", "7",
      "8", "9", "10", "11", "12", "13", "14",
      "15", "16", "17", "18", "19", "20", "21",
      "22", "23", "24", "25", "26", "27", "28",
      "29", "30", "31", null, null, null, null,
    ];
    calendarDays = calendarDays.sublist(0, 35); // Ensuring 5 rows of days

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.15) * 255 ~/ 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: Colors.white.withAlpha((0.8) * 255 ~/ 1)),
                onPressed: () { /* Decrement month logic */ },
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              Text(
                "December 2024", // Static from image
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.white.withAlpha((0.8) * 255 ~/ 1)),
                onPressed: () { /* Increment month logic */ },
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.5,
            ),
            itemCount: dayHeaders.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  dayHeaders[index],
                  style: TextStyle(
                      color: Colors.white.withAlpha((0.7) * 255 ~/ 1),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          const SizedBox(height: 5),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.5,
            ),
            itemCount: calendarDays.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final day = calendarDays[index];
              if (day == null) return Container();

              final isSelected = day == _selectedDate.day.toString() &&
                               _selectedDate.month == 12 &&
                               _selectedDate.year == 2024;
              return GestureDetector(
                onTap: () {
                  // Placeholder: Update _selectedDate and _dateController.text
                  // setState(() {
                  //   _selectedDate = DateTime(2024, 12, int.parse(day));
                  //   _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
                  // });
                },
                child: Container(
                  margin: const EdgeInsets.all(2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? finlogBlueSelectedDate : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    day,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white.withAlpha((0.9) * 255 ~/ 1),
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContentCard() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 30.0), // Added more bottom padding
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            finlogBluePrimaryDark,
            finlogBluePrimary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.8] // Adjusted stop for a slightly different gradient feel
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
                // Logic for tapping the date field - e.g., show system picker or rely on inline
                // _selectDate(context);
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
          _buildCalendarView(),
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
