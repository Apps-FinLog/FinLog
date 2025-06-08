import 'package:flutter/material.dart';

class ReusablePlaceholder extends StatelessWidget {
  final String imagePath;
  final String titleText;
  final String subtitleText;

  const ReusablePlaceholder({
    super.key,
    required this.imagePath,
    required this.titleText,
    required this.subtitleText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(imagePath),
              width: 80,
              height: 80,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Text(
              titleText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subtitleText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}