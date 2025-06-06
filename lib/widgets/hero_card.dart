import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; 
import 'package:finlog/screens/placeHolderPage/under_development.dart';
class SummaryCard extends StatefulWidget {
  final String amountFormatted = '1.3 Jt';
  final double amount;
  final String title;
  final VoidCallback? onTap;

  const SummaryCard({
    super.key,
    required this.amount,
    required this.title,
    this.onTap,
  });

  // Format amount to x.xx Jt format
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
  State<SummaryCard> createState() => _SummaryCardState();
}

// TODO : implement carousel from the material ui 3
class _SummaryCardState extends State<SummaryCard>{
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    const double circleSize = 140.0;
    const double strokeWidth = 12.0;
    const double progressValue = 0.65; // Example: 1.3Jt of 2Jt target

    return Card(
      elevation: 2.0,
      margin: EdgeInsets.zero, // Reset margin as parent Padding will handle it
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
                IconButton(
                  icon: Icon(Icons.visibility_off_outlined, color: Colors.grey[600]),
                  onPressed: () {
                    setState(() {
                      _isHidden = !_isHidden;
                    });
                    // TODO: Toggle visibility
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
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
                    SizedBox(
                      width: circleSize,
                      height: circleSize,
                      child: CircularProgressIndicator(
                        value: progressValue,
                        strokeWidth: strokeWidth,
                        valueColor: const AlwaysStoppedAnimation<Color>(finlogBluePrimary),
                        backgroundColor: Colors.transparent, // Make background track visible
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            _isHidden ? '****' : widget.formatAmount(widget.amount),
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: finlogBluePrimaryDark),
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
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Pengeluaran kamu naik 3% nih',
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.trending_up, color: Colors.red[400], size: 16),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tinjau keuangan kamu di dashboard rinci',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UnderDevelopmentPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: finlogButtonDark,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Lihat Selengkapnya', style: TextStyle(color: Colors.white, fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
