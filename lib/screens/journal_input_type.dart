import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming this file has the necessary colors
import 'package:finlog/screens/verifikasi_input.dart';

// Placeholder for a message model
class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});
}

class JournalInputTypeScreen extends StatefulWidget {
  const JournalInputTypeScreen({super.key});

  @override
  State<JournalInputTypeScreen> createState() => _JournalInputTypeScreenState();
}

class _JournalInputTypeScreenState extends State<JournalInputTypeScreen> {
  final TextEditingController _chatInputController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt arcu a urna placerat, id consectetur mi posuere. Integer scelerisque ornare tellus, eu varius',
      isUserMessage: false,
    ),
  ];
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _chatInputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_chatInputController.text.trim().isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(text: _chatInputController.text.trim(), isUserMessage: true));
      _chatInputController.clear();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });
  }

  Widget _buildChatMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7), // Slightly less width
        decoration: BoxDecoration(
          color: message.isUserMessage ? finlogBluePrimary.withOpacity(0.3) : Colors.white,
          borderRadius: BorderRadius.circular(12),
           boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 3,
              offset: const Offset(0, 1),
            )
          ]
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isUserMessage ? Colors.white : Colors.black87,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildChatCard() {
    // This widget now defines the chat card itself, which will be placed within the main screen layout
    return Container(
      // No margin here, the parent Column in Scaffold.body will handle padding/margin for the card
      clipBehavior: Clip.antiAlias, // Ensures input field at bottom adheres to rounded corners
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
        borderRadius: BorderRadius.circular(24.0), // Rounded corners for the card
      ),
      child: Column(
        children: [
          // Header section within the card (Icon and Title)
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.auto_awesome_outlined,
                  color: Colors.white,
                  size: 36,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Catat Keuangan\nseperti chat dengan\nsobat ^ ^',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                ),
                // Back button removed from here
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
            // color: finlogBluePrimaryDark.withOpacity(0.5), // Keeping input area part of gradient
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _chatInputController,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    decoration: InputDecoration(
                      hintText: 'Makan mie ayam...',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.15),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                Material(
                  color: finlogButtonDark,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: _sendMessage,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16), // Spacing between input and buttons
          // Bottom Navigation Buttons (Back and Confirm)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0), // Add horizontal padding to align with input field
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
                      'Back', // Or perhaps "Cancel"
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
                    onPressed: () {
                      // Handle confirm action
                      // For example, collect all messages or the parsed result from chat
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const VerifikasiInputScreen()),
                      );
                    },
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Jurnal (Chat)', // More specific title
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.grey[200], // Standard screen background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the main content area
          child: Column(
            children: [
              Expanded( // This Expanded makes the chat card take available vertical space
                child: _buildChatCard(),
              ),
              // Removed the SizedBox and Row containing buttons from here
            ],
          ),
        ),
      ),
    );
  }
}
