import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';

class PieChart1 extends StatefulWidget {
  final double progressValue;
  final String title;
  final bool hidden;
  final double amount;

  const PieChart1({super.key, required this.progressValue, this.title = '', required this.hidden, required this.amount});

  String formatAmount(double amount) {
    if (amount >= 1000000) {
      double inMillions = amount / 1000000;
      return '${inMillions.toStringAsFixed(1)} Jt';
    } else if (amount >= 1000) {
      double inThousands = amount / 1000;
      return '${inThousands.toStringAsFixed(1)} Rb';
    } else {
      return amount.toStringAsFixed(0);
    }
  }

  @override
  State<PieChart1> createState() => _PieChart1State();
}

class _PieChart1State extends State<PieChart1> {


  @override
  Widget build(BuildContext context) {
    const double circleSize = 140.0;
    const double strokeWidth = 12.0;

    return Center(
      child: SizedBox(
        width: circleSize,
        height: circleSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background track
            SizedBox(
              width: circleSize,
              height: circleSize,
              child: CircularProgressIndicator(
                value: 1.0, // Full circle for track
                strokeWidth: strokeWidth,
                backgroundColor: Colors.grey[200],
                color: Colors.grey[200], // Effectively the track color
              ),
            ),
            // Actual progress
            // TODO : implement this into custom so that it can be used again for the category tab filter
            SizedBox(
              width: circleSize,
              height: circleSize,
              child: CircularProgressIndicator(
                value: widget.progressValue,
                strokeWidth: strokeWidth,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  finlogBluePrimary,
                ),
                backgroundColor:
                    Colors.transparent, // Make background track visible
                strokeCap: StrokeCap.round,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.hidden ? '***Jt' : widget.formatAmount(widget.amount),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: finlogBluePrimaryDark,
                  ),
                ),
                Text(
                  'Mei',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
