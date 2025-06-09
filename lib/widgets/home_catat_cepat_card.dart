import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCatatCepatCard extends StatelessWidget {
  const HomeCatatCepatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [finlogBluePrimaryDark, finlogBluePrimary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: finlogBluePrimary.withAlpha((0.3 * 255).round()),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Catat Cepat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(width: 8),
              Icon(Icons.flash_on, color: Colors.white, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text('Nominal', style: TextStyle(color: Colors.white.withAlpha((0.8 * 255).round()), fontSize: 13)),
          const SizedBox(height: 6),
          TextField(
            controller: TextEditingController(text: '1,000,000'), // Placeholder
            style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Catat dengan\ncepat dan mudah~\nketuk disini!',
            style: TextStyle(color: Colors.white.withAlpha((0.9 * 255).round()), fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }
}
