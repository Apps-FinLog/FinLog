import 'package:finlog/models/bill_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:finlog/widgets/components/card.dart';
import 'package:finlog/models/daily_expenditure.dart';
import 'package:finlog/widgets/history/bill_summary_item.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:finlog/screens/utility_page/sukses_page.dart';
import 'dart:async';
import 'package:finlog/widgets/pdf/generate_pdf.dart';

class DailyExpenditureCard extends StatefulWidget {
  final DailyExpenditure dailyExpenditure;

  const DailyExpenditureCard({super.key, required this.dailyExpenditure});

  @override
  State<DailyExpenditureCard> createState() => _DailyExpenditureCardState();
}

class _DailyExpenditureCardState extends State<DailyExpenditureCard> {
  bool _isDownloading = false;
  bool _isCancelled = false;
  Completer<void>? _downloadCompleter;

  @override
  void dispose() {
    // Cancel any ongoing download operation
    _abortDownload();
    super.dispose();
  }

  void _abortDownload() {
    _isCancelled = true;
    if (_downloadCompleter != null && !_downloadCompleter!.isCompleted) {
      _downloadCompleter!.complete();
    }
    if (mounted) {
      setState(() {
        _isDownloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = widget.dailyExpenditure.bills.fold(
      0.0,
      (sum, bill) => sum + bill.jumlahTotal,
    );

    return WillPopScope(
      onWillPop: () async {
        _abortDownload();
        return true;
      },
      child: ReusablePageCard(
        title: DateFormat(
          'EEEE, dd MMMM yyyy',
        ).format(widget.dailyExpenditure.date),
        subtitle:
            'Total: ${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(totalAmount)}',
        child: Column(
          children: [
            Divider(color: Colors.grey[300], thickness: 1),
            ...widget.dailyExpenditure.bills.map(
              (bill) => BillSummaryItem(billData: bill),
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.grey[300], thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SHARE BUTTON
                IconButton(
                  icon: Icon(Icons.share, size: 24, color: Colors.blue),
                  onPressed: () async {
                    debugPrint(
                      'share button pressed for ${widget.dailyExpenditure.date}',
                    );
                    final doc = await generatePdfDoc(
                      widget.dailyExpenditure.bills,
                      widget.dailyExpenditure.date,
                    );
                    await sharePdf(doc, widget.dailyExpenditure.date);
                  },
                ),

                // EDIT/EXPORT BUTTON
                IconButton(
                  icon: Icon(
                    Icons.edit_note_rounded,
                    size: 28,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    debugPrint(
                      'edit button pressed for ${widget.dailyExpenditure.date}',
                    );
                    // Add edit logic here
                  },
                ),

                IconButton(
                  icon: const Icon(
                    Icons.file_download_outlined,
                    size: 28,
                    color: Colors.blue,
                  ),
                  onPressed: () async {
                    if (!mounted) return;

                    setState(() {
                      _isDownloading = true;
                    });

                    try {
                      debugPrint(
                        'Download started for ${widget.dailyExpenditure.date}',
                      );

                      final doc = await generatePdfDocument(
                        widget.dailyExpenditure.bills,
                        widget.dailyExpenditure.date,
                      );

                      await savePdfToDevice(doc);

                      if (!mounted) return;

                      setState(() {
                        _isDownloading = false;
                      });

                      // Navigate to success page and return automatically after 2 seconds
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuksesPage(),
                        ),
                      );

                      if (mounted && Navigator.canPop(context)) {
                        await Future.delayed(const Duration(seconds: 2));
                        Navigator.pop(context);
                      }
                    } catch (e) {
                      debugPrint('Download error: $e');
                      if (mounted) {
                        setState(() {
                          _isDownloading = false;
                        });
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> savePdfToDevice(pw.Document doc) async {
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => doc.save(),
  );
}

Future<void> sharePdf(pw.Document doc, DateTime date) async {
  await Printing.sharePdf(
    bytes: await doc.save(),
    filename: 'daily_expenditure_${DateFormat('yyyyMMdd').format(date)}.pdf',
  );
}

Future<pw.Document> generatePdfDoc(List<BillData> bills, DateTime date) async {
  return await generatePdfDocument(bills, date);
}
