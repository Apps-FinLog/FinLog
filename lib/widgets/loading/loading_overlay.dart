import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const Color finlogLoadingBlue = Color(0xFF0C6BFF);

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

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
              AppLocalizations.of(context)!.readingItem,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              AppLocalizations.of(context)!.pleaseWait,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
