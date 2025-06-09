import 'package:finlog/screens/text_input_page/journal_entry_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming this file has the necessary colors
import 'package:finlog/screens/verifikasi_screens/bill_details_screen.dart';
import 'package:finlog/screens/text_input_page/manual_input_screen.dart'; // Import ManualInputScreen
import 'package:finlog/services/gemini_service.dart';
import 'package:finlog/models/manual_input_data.dart'; // Import ManualInputData
import 'package:finlog/models/bill_data.dart'; // Import BillData
import 'package:intl/intl.dart'; // Import for DateFormat
import 'package:finlog/services/user_profile_service.dart'; // Import UserProfileService
import 'package:provider/provider.dart'; // Import Provider
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum InputSource { manual, journal, ocr }


class VerifikasiInputScreen extends StatefulWidget {
  final String journalInput;
  final ManualInputData? manualInputData; // Optional manual input data
  final InputSource sourceScreen; // To determine where to navigate back
  final DateTime? journalDate; // Add this parameter

  const VerifikasiInputScreen({
    super.key,
    required this.journalInput,
    this.manualInputData,
    this.sourceScreen = InputSource.journal, // Default to journal
    this.journalDate, // Make it optional for now, but will be required for journal input flow
  });

  @override
  State<VerifikasiInputScreen> createState() => _VerifikasiInputScreenState();
}

class _VerifikasiInputScreenState extends State<VerifikasiInputScreen> {
  late GeminiService _geminiService; // Declare GeminiService instance
  Map<String, dynamic>? _parsedExpenseData;
  bool _isLoading = false;
  String? _errorMessage;

  String _formatDateString(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return AppLocalizations.of(context)!.notAvailable;
    }
    try {
      // Attempt to parse various common date formats
      DateTime date;
      if (dateString.contains('/')) {
        // Try DD/MM/YYYY or MM/DD/YYYY
        List<String> parts = dateString.split('/');
        if (parts.length == 3) {
          if (parts[0].length == 4) { // YYYY/MM/DD
            date = DateTime.parse('${parts[0]}-${parts[1]}-${parts[2]}');
          } else if (int.parse(parts[0]) > 12) { // DD/MM/YYYY
            date = DateFormat('dd/MM/yyyy').parse(dateString);
          } else { // Assume MM/DD/YYYY or DD/DD/YYYY, try parsing
            try {
              date = DateFormat('dd/MM/yyyy').parse(dateString);
            } catch (_) {
              date = DateFormat('MM/dd/yyyy').parse(dateString);
            }
          }
        } else {
          return AppLocalizations.of(context)!.invalidDateFormat;
        }
      } else if (dateString.contains('-')) {
        // Try YYYY-MM-DD
        date = DateTime.parse(dateString);
      } else {
        return AppLocalizations.of(context)!.invalidDateFormat;
      }
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      debugPrint('Error parsing date string "$dateString": $e');
      return AppLocalizations.of(context)!.invalidDate;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProfileService = Provider.of<UserProfileService>(context, listen: false);
      _geminiService = GeminiService(userProfileService); // Initialize GeminiService with UserProfileService

      // Always parse with Gemini for journal or OCR inputs to get amount, category, etc.
      // The date will be prioritized from widget.journalDate in _buildContentCard.
      if (widget.sourceScreen == InputSource.journal || widget.sourceScreen == InputSource.ocr) {
        _parseJournalEntry();
      } else {
        // If manualInputData is provided or source is manual, no need to parse with Gemini
        _isLoading = false;
      }
    });
  }

  Future<void> _parseJournalEntry() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final parsedData = await _geminiService.parseExpense(widget.journalInput);
      setState(() {
        _parsedExpenseData = parsedData;
      });
      debugPrint('Parsed Expense Data: $_parsedExpenseData');
      debugPrint('Parsed Expense Data: $_parsedExpenseData');
    } catch (error) { // Changed 'e' to 'error'
      setState(() {
        _errorMessage = AppLocalizations.of(context)!.failedToParseExpense(error.toString());
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _tambahLagi() {
    if (widget.sourceScreen == InputSource.manual) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ManualInputScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) => JournalEntryInputScreen(
            selectedDate: widget.journalDate ?? DateTime.now(), // Pass the original journalDate back, or today's date as fallback
          ),
        ),
      );
    }
  }

  void _konfirmasi() {
    // Handle confirmation logic
    debugPrint('Konfirmasi ditekan');
    final billData = BillData();
    billData.parseOcrResult(_parsedExpenseData ?? {});
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BillDetailsScreen(billData: billData)),
    );
  }

  Widget _buildContentCard() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            finlogBluePrimaryDark,
            finlogBluePrimary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.9]
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: SingleChildScrollView( // To allow scrolling if content is long
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.inputDetailsTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Divider(color: Colors.white.withAlpha((0.3 * 255).toInt()), thickness: 0.8),
            const SizedBox(height: 12),
            _isLoading && widget.manualInputData == null
                ? const Center(child: CircularProgressIndicator(color: Colors.white))
                : _errorMessage != null && widget.manualInputData == null
                    ? Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.dateLabelColon} ${widget.manualInputData != null ? DateFormat('dd/MM/yyyy').format(widget.manualInputData!.date) : (widget.journalDate != null ? DateFormat('dd/MM/yyyy').format(widget.journalDate!) : _formatDateString(_parsedExpenseData?['displayDate']))}',
                            style: TextStyle(
                              color: Colors.white.withAlpha((255 * 0.9).round()),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${AppLocalizations.of(context)!.amountLabelColon} ${widget.manualInputData != null ? NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(widget.manualInputData!.nominal) : (_parsedExpenseData?['jumlahTotal'] != null ? NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(_parsedExpenseData!['jumlahTotal']) : AppLocalizations.of(context)!.notAvailable)} ${AppLocalizations.of(context)!.currencyIDR}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${AppLocalizations.of(context)!.categoryLabelColon} ${widget.manualInputData != null ? widget.manualInputData!.category : (_parsedExpenseData?['category'] ?? AppLocalizations.of(context)!.categoryOther)}', // Use parsed category or default to 'Lainnya'
                            style: TextStyle(
                              color: Colors.white.withAlpha((255 * 0.9).round()),
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${AppLocalizations.of(context)!.descriptionLabelColon} ${widget.manualInputData != null ? (widget.manualInputData!.description ?? AppLocalizations.of(context)!.notAvailable) : (_parsedExpenseData?['summary'] ?? widget.journalInput)}', // Use Gemini summary or original journal input as description
                            style: TextStyle(
                              color: Colors.white.withAlpha((255 * 0.9).round()),
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          if (widget.manualInputData == null) // Only show payment method for parsed data
                            Text(
                              '${AppLocalizations.of(context)!.paymentMethodLabelColon} ${AppLocalizations.of(context)!.notAvailable}', // Default for journal input
                              style: TextStyle(
                                color: Colors.white.withAlpha((255 * 0.9).round()),
                                fontSize: 15,
                              ),
                            ),
                        ],
                      ),
            const SizedBox(height: 20),

            // "Tambah Lagi" Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _tambahLagi,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withAlpha((0.95 * 255).toInt()), // Light button
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 1,
                ),
                child: Text(
                  AppLocalizations.of(context)!.addMoreButton,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: finlogBluePrimaryDark, // Dark text on light button
                  ),
                ),
              ),
            ),

            // Divider before summary/totals
            Divider(color: Colors.white.withAlpha((0.3 * 255).toInt()), thickness: 0.8, height: 30),
            const SizedBox(height: 10),

            // Simulating summary/total section
            // This part can be updated later to show actual totals from parsed data
            Text(
              AppLocalizations.of(context)!.originalInputLabel,
              style: TextStyle(
                color: Colors.white.withAlpha((255 * 0.9).round()),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.journalInput,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20), // Extra space at the bottom of the card content
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.finlogAppTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              // Placeholder for profile image, replace with actual image/icon
              backgroundColor: finlogProfileBgPlaceholder, // Use your defined color
              // child: Image.asset('assets/images/your_avatar.png'), // Example
            ),
          ),
        ],
        backgroundColor: Colors.grey[50], // Light AppBar background
        elevation: 0.8,
        // leading: IconButton( // Optional: Add back button if this screen is not a root
        //   icon: Icon(Icons.arrow_back, color: Colors.black87),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
      ),
      backgroundColor: Colors.grey[200], // Standard screen background
      body: Column( // Use Column to stack card and bottom button
        children: [
          Expanded( // Card takes available space
            child: _buildContentCard(),
          ),
          // "Konfirmasi" Button at the bottom
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 24.0), // Padding for the button
            child: SizedBox( // Use SizedBox to control button width if needed
              width: double.infinity, // Make button full width within padding
              child: ElevatedButton(
                onPressed: _konfirmasi,
                style: ElevatedButton.styleFrom(
                  backgroundColor: finlogButtonDark, // Dark button as per image
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  AppLocalizations.of(context)!.confirmButton,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
