import 'package:flutter/material.dart';
import 'package:finlog/screens/utility_page/under_development.dart';
import 'package:finlog/widgets/dataVisual/pie_chart_1.dart';
import 'package:finlog/widgets/buttons/button_primary.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:provider/provider.dart';
import 'package:finlog/l10n/app_localizations.dart';

class SummaryCard extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;

  const SummaryCard({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  State<SummaryCard> createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  bool _isHidden = false;
  BillStorageService? _billStorageService;
  double _amount = 0.0;
  double _progressValue = 0.0;
  String _monthName = '';
  bool _hasData = false;
  bool _isProviderInitialized = false; // Flag to ensure one-time setup

  @override
  void initState() {
    super.initState();
    // Initialization logic moved to didChangeDependencies
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isProviderInitialized) {
      _billStorageService = Provider.of<BillStorageService>(context, listen: false);
      _billStorageService?.addListener(_onBillStorageChanged);
      _updateSummaryData(); // Initial data load
      _isProviderInitialized = true;
    }
  }

  @override
  void dispose() {
    _billStorageService?.removeListener(_onBillStorageChanged);
    super.dispose();
  }

  void _onBillStorageChanged() {
    if (mounted) {
      _updateSummaryData();
    }
  }

  void _updateSummaryData() {
    if (!mounted) return;

    if (_billStorageService == null) {
      debugPrint("Error: BillStorageService is null in _updateSummaryData (SummaryCard). This should not happen if didChangeDependencies executed correctly.");
      // Attempt to re-initialize as a fallback
      _billStorageService = Provider.of<BillStorageService>(context, listen: false);
      _billStorageService?.addListener(_onBillStorageChanged);
      if (_billStorageService == null) {
          if (mounted) {
            setState(() {
              _hasData = false;
              _amount = 0.0;
              _progressValue = 0.0;
              _monthName = '';
            });
          }
          return; // Cannot proceed
      }
    }

    if (mounted) {
      setState(() {
        _amount = _billStorageService!.getTargetMonthTotalExpenses();
        _progressValue = _billStorageService!.getTargetMonthProgressValue();
        _monthName = _billStorageService!.getCurrentMonthName(context);
        _hasData = _billStorageService!.hasTargetMonthData();
      });
    }
  }

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
  }  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.zero,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
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
                      if (mounted) {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      }
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            PieChart1(
              progressValue: _progressValue, // USE STATE FIELD
              title: widget.title,
              hidden: _isHidden,
              amount: _amount, // USE STATE FIELD
              monthName: _monthName, // USE STATE FIELD
              hasData: _hasData, // USE STATE FIELD
            ),
            const SizedBox(height: 20),
            _buildStatusMessage(_hasData, _amount, _progressValue), // USE STATE FIELDS
            const SizedBox(height: 16),
            ButtonPrimary(
              text: AppLocalizations.of(context)!.viewDashboardButton,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UnderDevelopmentPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildStatusMessage(bool hasData, double amount, double progressValue) {
    if (!hasData) {
      return Center(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.noExpenseData,
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                Icon(Icons.info_outline, color: Colors.blue[400], size: 16),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.startScanningReceiptsForSummary,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // Show different messages based on spending level
    if (progressValue >= 0.8) {
      return Center(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.spendingNearLimit,
                  style: TextStyle(fontSize: 13, color: Colors.red[700]),
                ),
                const SizedBox(width: 4),
                Icon(Icons.warning, color: Colors.red[400], size: 16),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.considerReducingSpending,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    } else if (progressValue >= 0.5) {
      return Center(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.spendingWithinReasonableLimits,
                  style: TextStyle(fontSize: 13, color: Colors.orange[700]),
                ),
                const SizedBox(width: 4),
                Icon(Icons.trending_up, color: Colors.orange[400], size: 16),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.monitorYourSpending,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.spendingWellControlled,
                  style: TextStyle(fontSize: 13, color: Colors.green[700]),
                ),
                const SizedBox(width: 4),
                Icon(Icons.check_circle, color: Colors.green[400], size: 16),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.continueGoodSavingHabits,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
  }
}
