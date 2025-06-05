import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';
import 'package:finlog/widgets/custom_date_picker_field.dart';
import 'package:finlog/models/category.dart';
import 'package:finlog/models/bill_data.dart'; // Import BillData
import 'package:provider/provider.dart'; // Import Provider
import 'package:finlog/screens/bill_details_screen.dart'; // Import BillDetailsScreen

class ManualInputScreen extends StatefulWidget {
  const ManualInputScreen({super.key});

  @override
  State<ManualInputScreen> createState() => _ManualInputScreenState();
}

class _ManualInputScreenState extends State<ManualInputScreen> {
  late DateTime _selectedDate;
  final TextEditingController _nominalController = TextEditingController();
  late TextEditingController _dateController;

  // State for Category Accordion
  bool _isCategoryExpanded = false;
  Category? _selectedCategory; // To store the selected category
  final List<Category> _categories = [
    Category(id: 'cat_01', name: 'Makanan & Minuman'),
    Category(id: 'cat_02', name: 'Transportasi'),
    Category(id: 'cat_03', name: 'Belanja'),
    Category(id: 'cat_04', name: 'Tagihan'),
    Category(id: 'cat_05', name: 'Hiburan'),
    Category(id: 'cat_06', name: 'Kesehatan'),
    Category(id: 'cat_07', name: 'Pendidikan'),
    Category(id: 'cat_08', name: 'Lainnya'),
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime(2024, 12, 5); // Default selected date
    _dateController = TextEditingController();
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
          width: 100,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.3) * 255 ~/ 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100,
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
        Material(
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
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedCategory?.name ?? 'Pilih Kategori',
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
              color: Colors.white.withAlpha((0.1) * 255 ~/ 1),
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(
              maxHeight: 200,
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
                        _isCategoryExpanded = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text(
                        category.name,
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

  Widget _buildContentCard() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [finlogBluePrimaryDark, finlogBluePrimary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.7],
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
            hintText: 'Rp1,000,000~',
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
          _buildCategoryAccordion(),
          const SizedBox(height: 20),
          CustomDatePickerField(
            label: 'Tanggal',
            controller: _dateController,
            initialDate: _selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          ),
          const SizedBox(height: 24),
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
                    final Map<String, dynamic> manualInputData = {
                      'amount': _nominalController.text.replaceAll(RegExp(r'[Rp,~]'), ''), // Clean nominal
                      'category': _selectedCategory?.name ?? 'N/A',
                      'date': _dateController.text,
                      'description': 'Manual input', // Default description
                      'currency': 'IDR', // Default currency
                      'paymentMethod': 'Cash', // Default payment method
                      'items': [ // For BillData's billItems
                        {
                          'name': _selectedCategory?.name ?? 'Manual Expense',
                          'price': double.tryParse(_nominalController.text.replaceAll(RegExp(r'[Rp,~]'), '')) ?? 0.0,
                          'quantity': 1,
                          'total': double.tryParse(_nominalController.text.replaceAll(RegExp(r'[Rp,~]'), '')) ?? 0.0,
                        }
                      ],
                      'subtotal': double.tryParse(_nominalController.text.replaceAll(RegExp(r'[Rp,~]'), '')) ?? 0.0,
                      'jumlahTotal': double.tryParse(_nominalController.text.replaceAll(RegExp(r'[Rp,~]'), '')) ?? 0.0,
                    };

                    // Directly send data to BillData and navigate to BillDetailsScreen
                    final billData = Provider.of<BillData>(context, listen: false);
                    billData.parseParsedExpense(manualInputData);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Manual input confirmed and saved!')),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BillDetailsScreen(),
                      ),
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
