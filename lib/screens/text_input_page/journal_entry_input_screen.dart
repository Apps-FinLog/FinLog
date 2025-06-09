import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';
import 'package:finlog/screens/verifikasi_screens/bill_details_screen.dart'; // Import BillDetailsScreen
import 'package:finlog/services/gemini_service.dart'; // Import GeminiService
import 'package:finlog/models/bill_data.dart'; // Import BillData
import 'package:finlog/services/user_profile_service.dart'; // Import UserProfileService
import 'package:provider/provider.dart'; // Import Provider
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JournalEntryInputScreen extends StatefulWidget {
  final DateTime selectedDate;

  const JournalEntryInputScreen({
    super.key,
    required this.selectedDate,
  });

  @override
  State<JournalEntryInputScreen> createState() => _JournalEntryInputScreenState();
}

class _JournalEntryInputScreenState extends State<JournalEntryInputScreen> {
  final TextEditingController _journalInputController = TextEditingController();
  late GeminiService _geminiService; // Declare GeminiService instance
  Map<String, dynamic>? _parsedExpenseData; // Add parsed data state
  String? _errorMessage; // Add error message state

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProfileService = Provider.of<UserProfileService>(context, listen: false);
      _geminiService = GeminiService(userProfileService); // Initialize GeminiService with UserProfileService
    });
  }

  @override
  void dispose() {
    _journalInputController.dispose();
    super.dispose();
  }

  Future<void> _parseJournalEntry() async {
    _errorMessage = null; // Reset error message
    try {
      final parsedData = await _geminiService.parseExpense(_journalInputController.text.trim());
      if (!mounted) return; // Check mounted before setState
      setState(() {
        _parsedExpenseData = parsedData;
      });
      debugPrint('Parsed Expense Data: $_parsedExpenseData');
    } catch (error) { // Changed 'e' to 'error'
      if (!mounted) return; // Check mounted before setState
      setState(() {
        _errorMessage = 'Failed to parse expense: ${error.toString()}';
      });
    }
  }

  void _confirmJournalEntry() async { // Make it async
    final String journalEntry = _journalInputController.text.trim();
    if (journalEntry.isNotEmpty) {
      await _parseJournalEntry(); // Call parsing logic

      if (!mounted) return; // Check mounted before using context

      if (_parsedExpenseData != null) {
        final billData = BillData();
        billData.parseOcrResult(_parsedExpenseData!);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BillDetailsScreen(billData: billData),
          ),
        );
      } else if (_errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.failedToParseExpense(_errorMessage!))),
        );
      }
    } else {
      if (!mounted) return; // Check mounted before using context
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.enterJournalEntryBeforeConfirming)),
      );
    }
  }

  Widget _buildJournalInputCard() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            finlogBluePrimaryDark,
            finlogBluePrimary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.9],
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.book_outlined,
                  color: Colors.white,
                  size: 36,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.journalInputCardTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: TextField(
                  controller: _journalInputController,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: null, // Allows the TextField to expand vertically
                  keyboardType: TextInputType.multiline, // Enables multiline input
                  // expands: true, // Removed as it's not compatible with SingleChildScrollView directly
                  textAlignVertical: TextAlignVertical.top, // Aligns text to the top
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.journalInputHint,
                    hintStyle: TextStyle(color: Colors.white.withAlpha((0.6 * 255).toInt())),
                    filled: true,
                    fillColor: Colors.white.withAlpha((0.15 * 255).toInt()),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.white.withAlpha((0.3 * 255).toInt())),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.journalInputTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
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
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildJournalInputCard(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[50],
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
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
                child: Text(
                  AppLocalizations.of(context)!.backButton,
                  style: const TextStyle(
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
                onPressed: _confirmJournalEntry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: finlogButtonDark,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 1,
                ),
                child: Text(
                  AppLocalizations.of(context)!.confirmButton,
                  style: const TextStyle(
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
    );
  }
}
