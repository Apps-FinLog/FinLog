import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:finlog/styles/colors.dart';

class CustomDatePickerField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const CustomDatePickerField({
    super.key,
    required this.label,
    required this.controller,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    if (widget.controller.text.isEmpty || widget.controller.text == "Pick a date") {
      widget.controller.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: finlogBluePrimary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogTheme: const DialogTheme(backgroundColor: Colors.white),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextStyle(color: Colors.white.withAlpha((0.9) * 255 ~/ 1), fontSize: 14)),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          readOnly: true,
          onTap: () => _selectDate(context),
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: "Pick a date",
            hintStyle: TextStyle(color: Colors.white.withAlpha(38)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 8.0),
              child: IconTheme(
                data: IconThemeData(color: Colors.white.withAlpha((0.8) * 255 ~/ 1)),
                child: const Icon(Icons.calendar_today_outlined, size: 20),
              ),
            ),
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
}
