import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';
import 'package:finlog/screens/verifikasi_screens/bill_details_screen.dart'; // Changed import
import 'package:finlog/models/manual_input_data.dart';
import 'package:finlog/models/bill_data.dart'; // New import
import 'package:intl/intl.dart';
import 'package:flutter/services.dart'; // For TextInputFormatter
import 'package:finlog/widgets/navs/dual_action_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ManualInputScreen extends StatefulWidget {
  const ManualInputScreen({super.key});

  @override
  State<ManualInputScreen> createState() => _ManualInputScreenState();
}

class _ManualInputScreenState extends State<ManualInputScreen> {
  // --- Controllers ---
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController(); // FIXED: Declared the missing controller
  late TextEditingController _dateController;

  // --- State Variables ---
  DateTime? _selectedDate;
  bool _isCategoryExpanded = false;
  String? _selectedCategory;
  late List<String> _categories;

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  void initState() {
    super.initState();
    // Initialize with a default date and format it
    _selectedDate = DateTime.now();
    _dateController = TextEditingController(text: DateFormat('dd/MM/yyyy').format(_selectedDate!));
    _nominalController.addListener(_formatNominal);
  }

  @override
  void dispose() {
    _nominalController.removeListener(_formatNominal);
    _nominalController.dispose();
    _dateController.dispose();
    _descriptionController.dispose(); // This will now work correctly
    super.dispose();
  }

  void _formatNominal() {
    String text = _nominalController.text;
    if (text.isEmpty) {
      return;
    }

    String cleanText = text.replaceAll(RegExp(r'[^\d]'), '');
    if (cleanText.isEmpty) {
      return;
    }

    double value = double.parse(cleanText);
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    String newText = formatter.format(value);

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
              primary: finlogBluePrimary,
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: finlogBluePrimary,
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
          width: 100,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(77),
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
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
    int? maxLines,
    int? minLines,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withAlpha(230),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          validator: validator,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white.withAlpha(153),
            ),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                    child: IconTheme(
                      data: IconThemeData(
                        color: Colors.white.withAlpha(204),
                      ),
                      child: prefixIcon,
                    ),
                  )
                : null,
            filled: true,
            fillColor: Colors.white.withAlpha(38),
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
                color: Colors.white.withAlpha(128),
              ),
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
        Text(
          AppLocalizations.of(context)!.categoryTitle,
          style: TextStyle(
            color: Colors.white.withAlpha(230),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Material(
          color: Colors.white.withAlpha(38),
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
                    _selectedCategory ?? AppLocalizations.of(context)!.selectCategory,
                    style: TextStyle(
                      color: _selectedCategory != null
                          ? Colors.white
                          : Colors.white.withAlpha(153),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    _isCategoryExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white.withAlpha(204),
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
              color: Colors.white.withAlpha(26),
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(maxHeight: 200),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Text(
                        category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
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
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 30.0),
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
          Text(
            AppLocalizations.of(context)!.recordFinanceNow,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 24),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                  label: AppLocalizations.of(context)!.nominalLabel,
                  controller: _nominalController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  hintText: AppLocalizations.of(context)!.nominalHint,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.replaceAll(RegExp(r'[^\d]'), '').isEmpty) {
                      return AppLocalizations.of(context)!.nominalEmptyValidation;
                    }
                    if (double.tryParse(value.replaceAll(RegExp(r'[^\d]'), '')) == null) {
                      return AppLocalizations.of(context)!.nominalInvalidValidation;
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, left: 4.0),
                  child: Text(
                    AppLocalizations.of(context)!.nominalEstimationHint,
                    style: TextStyle(
                      color: Colors.white.withAlpha(180),
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildCategoryAccordion(),
                const SizedBox(height: 20),
                _buildTextField(
                  label: AppLocalizations.of(context)!.dateLabel,
                  controller: _dateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  prefixIcon: const Icon(Icons.calendar_today_outlined, size: 20),
                  validator: (value) {
                    if (_selectedDate == null) {
                      return AppLocalizations.of(context)!.dateEmptyValidation;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: AppLocalizations.of(context)!.descriptionLabel,
                  controller: _descriptionController, // This will now work correctly
                  hintText: AppLocalizations.of(context)!.descriptionHint,
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  minLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _categories = [
      AppLocalizations.of(context)!.categoryFoodBeverage,
      AppLocalizations.of(context)!.categoryTransportation,
      AppLocalizations.of(context)!.categoryShopping,
      AppLocalizations.of(context)!.categoryBills,
      AppLocalizations.of(context)!.categoryEntertainment,
      AppLocalizations.of(context)!.categoryHealth,
      AppLocalizations.of(context)!.categoryEducation,
      AppLocalizations.of(context)!.categoryOther,
    ];
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        if (_isCategoryExpanded) {
          setState(() {
            _isCategoryExpanded = false;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.manualInputTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          backgroundColor: Colors.grey[50],
          elevation: 0.5,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: _buildContentCard(),
          ),
        ),
        // FIXED: The bottomNavigationBar now correctly uses only the DualActionButtons widget.
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: DualActionButtons(
            leftButtonText: AppLocalizations.of(context)!.backButton,
            rightButtonText: AppLocalizations.of(context)!.continueButton,
            onLeftButtonPressed: () {
              Navigator.of(context).pop();
            },
            onRightButtonPressed: () {
              FocusScope.of(context).unfocus();
              if (_selectedCategory == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(AppLocalizations.of(context)!.selectCategorySnackbar),
                    backgroundColor: Colors.redAccent,
                  ),
                );
                return;
              }
              if (_formKey.currentState!.validate()) {
                final double nominal = double.parse(
                  _nominalController.text.replaceAll(RegExp(r'[^\d]'), ''),
                );
                final ManualInputData manualInputData = ManualInputData(
                  nominal: nominal,
                  category: _selectedCategory!,
                  date: _selectedDate!,
                  description: _descriptionController.text.isNotEmpty
                      ? _descriptionController.text
                      : null,
                );

                // Create a Map compatible with BillData.parseOcrResult
                final Map<String, dynamic> billDataMap = {
                  'displayDate': DateFormat('dd/MM/yyyy').format(manualInputData.date),
                  'displayTime': DateFormat('HH:mm:ss').format(manualInputData.date),
                  'billItems': [
                    {
                      'name': manualInputData.description ?? manualInputData.category,
                      'price': manualInputData.nominal,
                      'quantity': 1,
                      'total': manualInputData.nominal,
                    }
                  ],
                  'subtotal': manualInputData.nominal,
                  'pajak': 0.0,
                  'diskon': 0.0,
                  'lainnya': 0.0,
                  'jumlahTotal': manualInputData.nominal,
                  'category': manualInputData.category, // Add category to the map
                  'summary': manualInputData.description, // Add description as summary
                };

                final BillData billData = BillData();
                billData.parseOcrResult(billDataMap);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BillDetailsScreen(billData: billData),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
