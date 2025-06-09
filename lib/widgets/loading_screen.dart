import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const Color finlogLoadingBlue = Color(0xFF0C6BFF);

class LoadingScreen extends StatelessWidget {
  final String message;
  final String subMessage;

  const LoadingScreen({
    super.key,
    this.message = 'Membaca Item..',
    this.subMessage = 'Tunggu beberapa saat',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.coffee_outlined,
              size: 64,
              color: Colors.grey[800],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: LinearProgressIndicator(
                valueColor: const AlwaysStoppedAnimation<Color>(
                  finlogLoadingBlue,
                ),
                backgroundColor: Colors.grey[300],
                minHeight: 5,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subMessage,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
