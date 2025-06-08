import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';
import 'package:finlog/screens/verifikasi_screens/verifikasi_input.dart';

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

  @override
  void dispose() {
    _journalInputController.dispose();
    super.dispose();
  }

  void _confirmJournalEntry() {
    final String journalEntry = _journalInputController.text.trim();
    if (journalEntry.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifikasiInputScreen(
            journalInput: journalEntry,
            journalDate: widget.selectedDate,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a journal entry before confirming.')),
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
                const Expanded(
                  child: Text(
                    'Tulis Jurnal Keuanganmu\ndi sini!',
                    style: TextStyle(
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
                    hintText: 'Tuliskan pengeluaran atau pemasukanmu hari ini, contoh: "Makan siang di kantin Rp 25.000, beli buku Rp 50.000"',
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
        title: const Text(
          'Input Jurnal',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
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
                child: const Text(
                  'Back',
                  style: TextStyle(
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
                child: const Text(
                  'Confirm',
                  style: TextStyle(
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
