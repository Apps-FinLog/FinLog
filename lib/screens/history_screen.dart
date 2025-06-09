import 'package:flutter/material.dart';
import 'package:finlog/models/daily_expenditure.dart';
import 'package:finlog/widgets/history/daily_expenditure_card.dart';
import 'package:provider/provider.dart';
import 'package:finlog/services/bill_storage_service.dart';
import 'package:finlog/models/bill_data.dart';
import 'package:intl/intl.dart';
import 'package:finlog/widgets/loading_screen.dart';
import 'package:finlog/l10n/app_localizations.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with AutomaticKeepAliveClientMixin {
  List<DailyExpenditure> _dailyExpenditures = [];
  bool _isLoading = true;
  BillStorageService? _billStorageService;
  bool _isProviderInitialized = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isProviderInitialized) {
      _billStorageService = Provider.of<BillStorageService>(context, listen: false);
      _billStorageService?.addListener(_onBillStorageChanged);
      _loadBillData(); // Initial data load
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
      _loadBillData();
    }
  }

  Future<void> _loadBillData() async {
    if (!mounted) return;

    // Ensure setState is called safely
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    // Guard against _billStorageService being null, though it should be set in didChangeDependencies
    if (_billStorageService == null) {
      debugPrint("Error: BillStorageService is null in _loadBillData (HistoryScreen). This should not happen if didChangeDependencies executed correctly.");
      // Attempt to re-initialize as a fallback, though this indicates a deeper issue.
      _billStorageService = Provider.of<BillStorageService>(context, listen: false);
      _billStorageService?.addListener(_onBillStorageChanged);
      if (_billStorageService == null) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
        return; // Cannot proceed without the service
      }
    }
    
    final List<BillData> allBills = _billStorageService!.getAllBills();

    final Map<DateTime, List<BillData>> groupedBills = {};
    for (var bill in allBills) {
      try {
        final date = DateFormat('dd/MM/yyyy').parseStrict(bill.displayDate);
        final normalizedDate = DateTime(date.year, date.month, date.day);
        if (!groupedBills.containsKey(normalizedDate)) {
          groupedBills[normalizedDate] = [];
        }
        groupedBills[normalizedDate]!.add(bill);
      } catch (e) {
        debugPrint('Error parsing date for bill: ${bill.displayDate}. Error: $e');
      }
    }

    final List<DailyExpenditure> dailyExpenditures = groupedBills.entries.map((entry) {
      return DailyExpenditure(date: entry.key, bills: entry.value);
    }).toList();

    dailyExpenditures.sort((a, b) => b.date.compareTo(a.date));

    if (mounted) {
      setState(() {
        _dailyExpenditures = dailyExpenditures;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox.expand(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF1E3A8A),
                          Color(0xFF3B82F6),
                        ],
                        stops: [0.0, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF3B82F6).withValues(alpha:0.3),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: Offset(0, 8),
                        ),
                        BoxShadow(
                          color: Color(0xFF1E40AF).withValues(alpha:0.2),
                          blurRadius: 12,
                          spreadRadius: 1,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.transactionsToPdfTitle,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      AppLocalizations.of(context)!.downloadTransactionsPdfSubtitle,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withValues(alpha:0.8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.picture_as_pdf_outlined,
                                color: Colors.white.withValues(alpha:0.9),
                                size: 28,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 1,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withValues(alpha:0.0),
                                  Colors.white.withValues(alpha:0.3),
                                  Colors.white.withValues(alpha:0.0),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (_dailyExpenditures.isEmpty && !_isLoading)
                            Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.description_outlined,
                                    size: 48,
                                    color: Colors.white.withValues(alpha:0.6),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    AppLocalizations.of(context)!.noBillDataAvailable,
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha:0.8),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else if (_dailyExpenditures.isNotEmpty)
                            Center(
                              child: Column(
                                children: [
                                  const SizedBox(height: 12),
                                  Text(
                                    '${_dailyExpenditures.length} days of transaction data available',
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha:0.9),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      // TODO: Implement PDF export functionality
                                    },
                                    icon: Icon(Icons.download, size: 20),
                                    label: Text('Export All to PDF'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Color(0xFF1E3A8A),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (_dailyExpenditures.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  const SizedBox(height: 16),
                  ..._dailyExpenditures.map(
                    (dailyExpenditure) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: DailyExpenditureCard(dailyExpenditure: dailyExpenditure),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (_isLoading)
            Positioned.fill(
              child: LoadingScreen(
                message: AppLocalizations.of(context)!.loadingTransactionsData,
                subMessage: AppLocalizations.of(context)!.pleaseWait,
              ),
            ),
        ],
      ),
    );
  }
}

// TODO: refactor the card into accordion to show details like the item entry
