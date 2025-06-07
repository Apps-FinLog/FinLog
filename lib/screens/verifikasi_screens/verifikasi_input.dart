import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming this file has the necessary colors
import 'package:finlog/screens/verifikasi_screens/bill_details_screen.dart';
import 'package:finlog/screens/text_input_page/journal_chat_input_screen.dart';
import 'package:finlog/screens/text_input_page/manual_input_screen.dart'; // Import ManualInputScreen
import 'package:finlog/services/gemini_service.dart';
import 'package:finlog/models/manual_input_data.dart'; // Import ManualInputData
import 'package:intl/intl.dart'; // Import for DateFormat

enum InputSource { manual, journal, ocr }


class VerifikasiInputScreen extends StatefulWidget {
  final String journalInput;
  final ManualInputData? manualInputData; // Optional manual input data
  final InputSource sourceScreen; // To determine where to navigate back

  const VerifikasiInputScreen({
    super.key,
    required this.journalInput,
    this.manualInputData,
    this.sourceScreen = InputSource.journal, // Default to journal
  });

  @override
  State<VerifikasiInputScreen> createState() => _VerifikasiInputScreenState();
}

class _VerifikasiInputScreenState extends State<VerifikasiInputScreen> {
  final GeminiService _geminiService = GeminiService();
  Map<String, dynamic>? _parsedExpenseData;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    
    if (widget.sourceScreen == InputSource.journal || widget.sourceScreen == InputSource.ocr) {
      _parseJournalEntry();
    } else {
      // If manualInputData is provided or source is manual, no need to parse with Gemini
      // If manualInputData is provided or source is manual, no need to parse with Gemini
      _isLoading = false;
    }
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
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to parse expense: ${e.toString()}';
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
        MaterialPageRoute(builder: (context) => const JournalChatInputScreen()),
        
      );
    }
  }

  void _konfirmasi() {
    // Handle confirmation logic
    debugPrint('Konfirmasi ditekan');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Input berhasil dikonfirmasi! (simulasi)')),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BillDetailsScreen(ocrResult: _parsedExpenseData ?? {})),
      
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
          stops: [0.0, 0.9]
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: SingleChildScrollView( // To allow scrolling if content is long
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rincian Input',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Divider(color: Colors.white.withAlpha((0.3) * 255 ~/ 1), thickness: 0.8),
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
                            'Date: ${widget.manualInputData != null ? DateFormat('dd/MM/yyyy').format(widget.manualInputData!.date) : (_parsedExpenseData?['date'] ?? 'N/A')}',
                            style: TextStyle(
                              color: Colors.white.withAlpha((255 * 0.9).round()),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Amount: ${widget.manualInputData != null ? NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(widget.manualInputData!.nominal) : (_parsedExpenseData?['amount'] ?? 'N/A')} ${widget.manualInputData != null ? '' : (_parsedExpenseData?['currency'] ?? '')}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Category: ${widget.manualInputData != null ? widget.manualInputData!.category : (_parsedExpenseData?['category'] ?? 'N/A')}',
                            style: TextStyle(
                              color: Colors.white.withAlpha((255 * 0.9).round()),
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Description: ${widget.manualInputData != null ? (widget.manualInputData!.description ?? 'N/A') : (_parsedExpenseData?['description'] ?? 'N/A')}',
                            style: TextStyle(
                              color: Colors.white.withAlpha((255 * 0.9).round()),
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          if (widget.manualInputData == null) // Only show payment method for parsed data
                            Text(
                              'Payment Method: ${_parsedExpenseData?['paymentMethod'] ?? 'N/A'}',
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
                  backgroundColor: Colors.white.withAlpha((0.95) * 255 ~/ 1), // Light button
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 1,
                ),
                child: const Text(
                  'Tambah Lagi',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: finlogBluePrimaryDark, // Dark text on light button
                  ),
                ),
              ),
            ),

            // Divider before summary/totals
            Divider(color: Colors.white.withAlpha((0.3) * 255 ~/ 1), thickness: 0.8, height: 30),
            const SizedBox(height: 10),

            // Simulating summary/total section
            // This part can be updated later to show actual totals from parsed data
            Text(
              'Original Input:',
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
        title: const Text(
          'FinLog',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
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
                child: const Text(
                  'Konfirmasi',
                  style: TextStyle(
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