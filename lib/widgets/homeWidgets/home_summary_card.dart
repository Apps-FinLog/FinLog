import 'package:flutter/material.dart';
import 'package:finlog/screens/utility_page/under_development.dart';
import 'package:finlog/widgets/dataVisual/pie_chart_1.dart';
import 'package:finlog/widgets/buttons/button_primary.dart';
import 'package:finlog/l10n/app_localizations.dart';

class SummaryCard extends StatefulWidget {
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
class _SummaryCardState extends State<SummaryCard> {
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    final double progressValue = 0.1;
    //the progress value here would be used for the pie chart
    // TODO: replace the progressvalue with the category aggregated

    return Card(
      elevation: 2.0,
      margin: EdgeInsets.zero, // Reset margin as parent Padding will handle it
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey[300]!, width: 0.5),
      ),
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      !_isHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      color: Colors.grey[600],
                    ),
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
            ),
            const SizedBox(height: 20),
            PieChart1(
              progressValue: progressValue,
              title: widget.title,
              hidden: _isHidden,
              amount: widget.amount,
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.expenditureIncreaseMessage, // Assuming a new key for this
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.trending_up, color: Colors.red[400], size: 16),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(
                      context,
                    )!.reviewFinancialDashboard, // Assuming a new key for this
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ButtonPrimary(
              text:
                  AppLocalizations.of(
                    context,
                  )!.viewDashboardButton, // Assuming a new key for this
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnderDevelopmentPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
