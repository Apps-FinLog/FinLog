import 'dart:io';
import 'package:flutter/material.dart';

class ImageConfirmScreen extends StatelessWidget {
  final File imageFile;
  const ImageConfirmScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(child: Image.file(imageFile, fit: BoxFit.contain)),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              // Beri padding agar tombol tidak terlalu mepet ke tepi
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 40.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha((0.25) * 255 ~/ 1),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      elevation: 0,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 28,
                      
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(Icons.check, size: 28),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
