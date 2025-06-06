import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class CatatCepat extends StatefulWidget {
  const CatatCepat({super.key});

  @override
  State<CatatCepat> createState() => _CatatCepatState();
}

class _CatatCepatState extends State<CatatCepat> {
  final TextEditingController _nominalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nominalController.addListener(_formatNominal);
  }

  @override
  void dispose() {
    _nominalController.removeListener(_formatNominal);
    _nominalController.dispose();
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
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    String newText = formatter.format(value);

    // Prevent infinite loop
    if (newText != text) {
      _nominalController.value = _nominalController.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? hintText,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black87.withOpacity(0.5)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [finlogBluePrimaryDark, finlogBluePrimary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: finlogBluePrimary.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Catat Cepat',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.flash_on, color: Colors.white, size: 20),
            ],
          ),
          const SizedBox(height: 12),
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
          const SizedBox(height: 12),
          
        ],
      ),
    );
  }
}


// TODO : implement widget to accept the user money input
