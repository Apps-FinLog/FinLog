import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:finlog/l10n/app_localizations.dart';
import 'package:finlog/screens/text_input_page/manual_input_screen.dart';

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
    required BuildContext context, // Add BuildContext
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(),
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
            hintStyle: TextStyle(color: Colors.grey[400]),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ManualInputScreen()),
        );
      },
      child: Container(
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
              color: finlogBluePrimary.withValues(),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.recordFinanceNow,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.flash_on, color: Colors.white, size: 20),
              ],
            ),
            const SizedBox(height: 12),
                  _buildTextField(
                    context: context, // Pass context
                    label: AppLocalizations.of(context)!.nominalLabel,
                    controller: _nominalController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      style: TextStyle(color: Colors.white.withAlpha((0.7) * 255 ~/ 1), fontSize: 11),
                    ),
                  ),
            const SizedBox(height: 12),
            
          ],
        ),
      ),
    );
  }
}


// TODO : implement widget to accept the user money input
