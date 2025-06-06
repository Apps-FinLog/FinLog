import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';
import 'package:finlog/screens/verifikasi_input.dart';
import 'package:finlog/models/manual_input_data.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart'; // For TextInputFormatter

class ManualInputScreen extends StatefulWidget {
  const ManualInputScreen({super.key});

  @override
  State<ManualInputScreen> createState() => _ManualInputScreenState();
}

class _ManualInputScreenState extends State<ManualInputScreen> {
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController(); // New controller for description

  DateTime? _selectedDate;
  bool _isCategoryExpanded = false;
  String? _selectedCategory;
  final List<String> _categories = [
    'Makanan & Minuman',
    'Transportasi',
    'Belanja',
    'Tagihan',
    'Hiburan',
    'Kesehatan',
    'Pendidikan',
    'Lainnya',
  ];

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate!);
    _nominalController.addListener(_formatNominal);
  }

  @override
  void dispose() {
    _nominalController.removeListener(_formatNominal);
    _nominalController.dispose();
    _dateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _formatNominal() {
    String text = _nominalController.text;
    if (text.isEmpty) {
      return;
    }

    // Remove all non-digit characters
    String cleanText = text.replaceAll(RegExp(r'[^\d]'), '');
    if (cleanText.isEmpty) {
      return;
    }

    // Parse to double, then format as currency
    double value = double.parse(cleanText);
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    String newText = formatter.format(value);

    // Prevent infinite loop
    if (newText != text) {
      _nominalController.value = _nominalController.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: finlogBluePrimary, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black87, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: finlogBluePrimary, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate!);
      });
    }
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
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
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
          validator: validator,
          inputFormatters: inputFormatters,
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
            errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
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
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                  label: 'Nominal',
                  controller: _nominalController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  hintText: 'Contoh: Rp 1.000.000',
                  validator: (value) {
                    if (value == null || value.isEmpty || value.replaceAll(RegExp(r'[^\d]'), '').isEmpty) {
                      return 'Nominal tidak boleh kosong';
                    }
                    if (double.tryParse(value.replaceAll(RegExp(r'[^\d]'), '')) == null) {
                      return 'Nominal tidak valid';
                    }
                    return null;
                  },
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
                  onTap: () => _selectDate(context),
                  prefixIcon: const Icon(Icons.calendar_today_outlined, size: 20),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Deskripsi (Opsional)',
                  controller: _descriptionController,
                  hintText: 'Contoh: Beli makan siang',
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: _buildContentCard(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0), // Adjust padding as needed
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
                          if (_formKey.currentState!.validate()) {
                            if (_selectedCategory == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Pilih kategori terlebih dahulu')),
                              );
                              return;
                            }

                            final double nominal = double.parse(_nominalController.text.replaceAll(RegExp(r'[^\d]'), ''));
                            final ManualInputData manualInputData = ManualInputData(
                              nominal: nominal,
                              category: _selectedCategory!,
                              date: _selectedDate!,
                              description: _descriptionController.text.isNotEmpty ? _descriptionController.text : null,
                            );//handler buat event onclick 

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifikasiInputScreen(
                                  journalInput: manualInputData.toString(),
                                  manualInputData: manualInputData,
                                  sourceScreen: InputSource.manual,
                                ),
                              ),
                            );
                          }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
