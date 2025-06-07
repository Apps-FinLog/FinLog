import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming this file has the necessary colors
import 'package:finlog/screens/verifikasi_input.dart';

// Placeholder for a message model
class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});
}

class JournalChatInputScreen extends StatefulWidget {
  final DateTime selectedDate; // Add this parameter

  const JournalChatInputScreen({
    super.key,
    required this.selectedDate, // Make it required
  });

  @override
  State<JournalChatInputScreen> createState() => _JournalChatInputScreenState();
}

class _JournalChatInputScreenState extends State<JournalChatInputScreen> {
  final TextEditingController _chatInputController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text:
          'Halo, selamat datang di FinLog, aplikasi pencatatan keuangan yang mudah dan menyenangkan! ^ ^\n',
      isUserMessage: false,
    ),
  ];
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _chatInputController.dispose(); // Dispose the chat input controller
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final String journalEntry = _chatInputController.text.trim();
    if (journalEntry.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(text: journalEntry, isUserMessage: true));
        _chatInputController.clear();
      });
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );

      // Navigate to VerifikasiInputScreen with the journal entry and selected date
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifikasiInputScreen(
            journalInput: journalEntry,
            journalDate: widget.selectedDate, // Pass the selected date
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a journal entry before confirming.')),
      );
    }
  }

  Widget _buildChatMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
        decoration: BoxDecoration(
          color: message.isUserMessage ? finlogBluePrimary : Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isUserMessage ? Colors.white : Colors.white.withOpacity(0.9),
            fontSize: 15,
          ),
        ),
      ),
    );
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
                  Icons.book_outlined, // Changed icon to reflect journaling
                  color: Colors.white,
                  size: 36,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Tulis Jurnal Keuanganmu\ndi sini!', // Changed title
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
          // Chat messages area
          Expanded( // This Expanded makes the ListView take available space *within the card*
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 0, bottom: 10, left: 8, right: 8), // Adjusted padding
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildChatMessageBubble(_messages[index]);
              },
            ),
          ),

          // Input field area at the bottom of the card
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end, // Align children to the bottom
              children: [
                Expanded(
                  child: TextField(
                    controller: _chatInputController,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    maxLines: null, // Allows the TextField to expand vertically
                    keyboardType: TextInputType.multiline, // Enables multiline input
                    decoration: InputDecoration(
                      hintText: 'Makan mie ayam...',
                      hintStyle: TextStyle(color: Colors.white.withAlpha((0.6) * 255 ~/ 1)),
                      filled: true,
                      fillColor: Colors.white.withAlpha((0.15) * 255 ~/ 1),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white.withAlpha((0.3) * 255 ~/ 1)),
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  mini: true,
                  backgroundColor: finlogBluePrimary,
                  elevation: 0,
                  child: const Icon(Icons.send, color: Colors.white, size: 20),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Jurnal', // Updated title
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.grey[200], // Standard screen background
      resizeToAvoidBottomInset: true, // Prevent screen from resizing when keyboard appears
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: _buildJournalInputCard(), // Use the new journal input card
              ),
            ],
          ),
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
                onPressed: _sendMessage, // Use _sendMessage to confirm and navigate
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
