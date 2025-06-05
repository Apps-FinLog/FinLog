import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming this file has the necessary colors
import 'package:finlog/screens/verifikasi_input.dart';

class ManualInputScreen extends StatefulWidget {
  const ManualInputScreen({super.key});

  @override
  State<ManualInputScreen> createState() => _ManualInputScreenState();
}

class _ManualInputScreenState extends State<ManualInputScreen> {
  final DateTime _selectedDate = DateTime(2024, 12, 5);
  final TextEditingController _nominalController =
      TextEditingController(text: "Rp1,000,000~");
  late TextEditingController _dateController;

  // State for Category Accordion
  bool _isCategoryExpanded = false;
  String? _selectedCategory; // To store the selected category
  final List<String> _categories = [ // Dummy categories
    'Makanan & Minuman',
    'Transportasi',
    'Belanja',
    'Tagihan',
    'Hiburan',
    'Kesehatan',
    'Pendidikan',
    'Lainnya',
  ];

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: "Pick a date");
  }

  @override
  void dispose() {
    _nominalController.dispose();
    _dateController.dispose();
    super.dispose();
  }


  Widget _buildCardProgressBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 100, // Total width of the progress bar container
          height: 8,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.3) * 255 ~/ 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100, // Fill the entire width to indicate completion of this step
              height: 8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? hintText,
    Widget? prefixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
    TextInputType? keyboardType,
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
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white.withAlpha((0.6) * 255 ~/ 1)),
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

  Widget _buildCategoryAccordion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kategori", style: TextStyle(color: Colors.white.withAlpha((0.9) * 255 ~/ 1), fontSize: 14)),
        const SizedBox(height: 8),
        Material( // To get InkWell effect
          color: Colors.white.withAlpha((0.15) * 255 ~/ 1),
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              setState(() {
                _isCategoryExpanded = !_isCategoryExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // No borderSide: BorderSide.none, as Material's color handles the background
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedCategory ?? 'Pilih Kategori',
                    style: TextStyle(
                      color: _selectedCategory != null ? Colors.white : Colors.white.withAlpha((0.6) * 255 ~/ 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    _isCategoryExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.white.withAlpha((0.8) * 255 ~/ 1),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isCategoryExpanded)
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((0.1) * 255 ~/ 1), // Slightly different background for dropdown items
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              maxHeight: 200, // Limit the height of the dropdown
            ),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                        _isCategoryExpanded = false; // Collapse after selection
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text(
                        category,
                        style: const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }


  Widget _buildCalendarView() {
    List<String> dayHeaders = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];
    List<String?> calendarDays = [
      "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14",
      "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28",
      "29", "30", "31", null, null, null, null,
    ];
    calendarDays = calendarDays.sublist(0, 35);

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
                "December 2024",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, childAspectRatio: 1.5),
            itemCount: dayHeaders.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Center(
              child: Text(dayHeaders[index], style: TextStyle(color: Colors.white.withAlpha((0.7) * 255 ~/ 1), fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 5),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, childAspectRatio: 1.5),
            itemCount: calendarDays.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final day = calendarDays[index];
              if (day == null) return Container();
              final isSelected = day == _selectedDate.day.toString() && _selectedDate.month == 12 && _selectedDate.year == 2024;
              return GestureDetector(
                onTap: () {
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
                  child: Text(day, style: TextStyle(color: isSelected ? Colors.white : Colors.white.withAlpha((0.9) * 255 ~/ 1), fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, fontSize: 14)),
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
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [finlogBluePrimaryDark, finlogBluePrimary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.7]
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCardProgressBar(),
          const SizedBox(height: 20),
          const Icon(Icons.calculate_outlined, color: Colors.white, size: 48),
          const SizedBox(height: 16),
          const Text(
            'Catat Keuangan\nSekarang Yuk!',
            style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold, height: 1.3),
          ),
          const SizedBox(height: 24),
          _buildTextField(
            label: 'Nominal',
            controller: _nominalController,
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0, left: 4.0),
            child: Text(
              'Estimasi nominal lebih penting dibanding detail rinci nominal',
              style: TextStyle(color: Colors.white.withAlpha((0.7) * 255 ~/ 1), fontSize: 11),
            ),
          ),
          const SizedBox(height: 20),
          // Kategori Accordion Added Here
          _buildCategoryAccordion(),
          const SizedBox(height: 20),
          _buildTextField(
            label: 'Tanggal',
            controller: _dateController,
            readOnly: true,
            onTap: () {
              // _selectDate(context); // Example: Open system date picker
            },
            prefixIcon: const Icon(Icons.calendar_today_outlined, size: 20),
          ),
          const SizedBox(height: 16),
          _buildCalendarView(),
          const SizedBox(height: 24), // Spacing before buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: finlogButtonGrey,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 1,
                  ),
                  child: const Text('Back', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: finlogButtonTextDark)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VerifikasiInputScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: finlogButtonDark,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 1,
                  ),
                  child: const Text('Continue', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Manual', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        backgroundColor: Colors.grey[50],
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView( // Make the entire body scrollable
          child: _buildContentCard(),
        ),
      ),
    );
  }
}
