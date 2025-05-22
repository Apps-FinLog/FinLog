import 'package:flutter/material.dart';
import 'package:finlog/styles/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      appBar: AppBar(
        backgroundColor: Colors.white, // White app bar background
        centerTitle: true, // Center the title
        title: Text(
          'FinLog',
          style: AppTextStyles.appBarTitle, // Use the defined text style
        ),
        elevation: 0, // Remove shadow for a flat look
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // Height of the line
          child: Container(
            color: const Color(0xFFE2E8F0), // Color of the line
            height: 1.0, // Thickness of the line
          ),
        ),
      ),
      body: const Center(
        child: Text('Welcome to FinLog!'), // Placeholder content
      ),
    );
  }
}
