import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming this file has the necessary colors
import 'package:finlog/screens/verifikasi_screens/verifikasi_input.dart';
import 'package:finlog/widgets/navs/dual_action_buttons.dart';

// Placeholder for a message model
class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});
}

class JournalChatInputScreen extends StatefulWidget {
  const JournalChatInputScreen({super.key});
class JournalChatInputScreen extends StatefulWidget {
  const JournalChatInputScreen({super.key});

  @override
  State<JournalChatInputScreen> createState() => _JournalChatInputScreenState();
  State<JournalChatInputScreen> createState() => _JournalChatInputScreenState();
}

class _JournalChatInputScreenState extends State<JournalChatInputScreen> {
class _JournalChatInputScreenState extends State<JournalChatInputScreen> {
  final TextEditingController _chatInputController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text:
          'Halo, selamat datang di FinLog, aplikasi pencatatan keuangan! ^ ^\n Cukup tuliskan pengeluaranmu dalam satu kalimat, contohnya:\n"Beli kopi kenangan 25rb"',
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
      _messages.add(
          ChatMessage(text: _chatInputController.text.trim(), isUserMessage: true));
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
      alignment:
          message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
            color: message.isUserMessage
                ? finlogBluePrimary.withAlpha((0.3) * 255 ~/ 1)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.05) * 255 ~/ 1),
                blurRadius: 3,
                offset: const Offset(0, 1),
              )
            ]),
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
            stops: const [0.0, 0.9]),
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
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding:
                  const EdgeInsets.only(top: 0, bottom: 10, left: 8, right: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildChatMessageBubble(_messages[index]);
              },
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end, // Align children to the bottom
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _chatInputController,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    maxLines: null, // Allows the TextField to expand vertically
                    keyboardType: TextInputType.multiline, // Enables multiline input
                    maxLines: 5,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Makan mie ayam...',
                      hintStyle: TextStyle(
                          color: Colors.white.withAlpha((0.6) * 255 ~/ 1)),
                      filled: true,
                      fillColor: Colors.white.withAlpha((0.15) * 255 ~/ 1),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.white.withAlpha((0.3) * 255 ~/ 1)),
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
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(
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
      resizeToAvoidBottomInset: true, // Prevent screen from resizing when keyboard appears
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the main content area
          child: Column(
            children: [
              Expanded( // This Expanded makes the chat card take available vertical space
                child: _buildChatCard(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[50], // Background color for the bottom navigation bar
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0), // Adjust padding as needed
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
                  // Find the last user message to send for verification
                  final String lastUserMessage = _messages.lastWhere(
                    (msg) => msg.isUserMessage,
                    orElse: () => ChatMessage(text: '', isUserMessage: true),
                  ).text;

                      if (lastUserMessage.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifikasiInputScreen(journalInput: lastUserMessage),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a journal entry before confirming.')),
                        );
                      }
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Jurnal (Chat)',
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
      // The body now contains just the chat card, which will resize when the keyboard appears.
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: _buildChatCard(),
      ),
      // The buttons are moved here. This section is not part of the body and will be
      // covered by the keyboard instead of being pushed up.
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
        child: DualActionButtons(
          leftButtonText: 'Back',
          rightButtonText: 'Confirm',
          onLeftButtonPressed: () {
            Navigator.of(context).pop();
          },
          onRightButtonPressed: () {
            // Find the last message from the user to send to verification
            final String lastUserMessage = _messages
                .lastWhere(
                  (msg) => msg.isUserMessage,
                  orElse: () => ChatMessage(text: '', isUserMessage: true),
                )
                .text;

            if (lastUserMessage.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerifikasiInputScreen(
                    journalInput: lastUserMessage,
                    sourceScreen: InputSource.journal,
                  ),
                ),
              );
            } else {
              // Show an error message if the user hasn't typed anything
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tulis jurnal kamu dulu ya!')),
              );
            }
          },
        ),
      ),
    );
  }
}