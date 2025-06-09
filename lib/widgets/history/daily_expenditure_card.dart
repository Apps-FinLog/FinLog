import 'package:finlog/models/bill_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:finlog/widgets/components/card.dart';
import 'package:finlog/models/daily_expenditure.dart';
import 'package:finlog/widgets/history/bill_summary_item.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:finlog/widgets/pdf/generate_pdf.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:finlog/screens/utility_page/success_page.dart';

class DailyExpenditureCard extends StatefulWidget {
  final DailyExpenditure dailyExpenditure;

  const DailyExpenditureCard({super.key, required this.dailyExpenditure});

  @override
  State<DailyExpenditureCard> createState() => _DailyExpenditureCardState();
}

class _DailyExpenditureCardState extends State<DailyExpenditureCard> {
  @override
  Widget build(BuildContext context) {
    // Add safety check for empty bills list
    final bills = widget.dailyExpenditure.bills;
    if (bills.isEmpty) {
      return ReusablePageCard(
        title: DateFormat(
          'EEEE, dd MMMM yyyy',
        ).format(widget.dailyExpenditure.date),
        subtitle: 'No bills for this date',
        child: const Center(child: Text('No expenditure data available')),
      );
    }
    
    final totalAmount = bills.fold(0.0, (sum, bill) => sum + bill.jumlahTotal);
    
    return ReusablePageCard(
      title: DateFormat(
        'EEEE, dd MMMM yyyy',
      ).format(widget.dailyExpenditure.date),
      subtitle:
          'Total: ${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(totalAmount)}',
      child: Column(
        children: [
          Divider(color: Colors.grey[300], thickness: 1),
          ...bills
              .where((bill) => bill.billItems.isNotEmpty)
              .map((bill) => BillSummaryItem(billData: bill)),
          const SizedBox(height: 24),
          Divider(color: Colors.grey[300], thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [              // SHARE BUTTON
              IconButton(
                icon: Icon(Icons.share, size: 24, color: Colors.blue),
                onPressed: () async {
                  if (!mounted || bills.isEmpty) return;

                  try {
                    debugPrint(
                      'share button pressed for ${widget.dailyExpenditure.date}',
                    );
                    final doc = await generatePdfDoc(
                      bills,
                      widget.dailyExpenditure.date,
                    );

                    debugPrint('PDF generated for ${widget.dailyExpenditure.date}');

                    if (mounted) {
                      await sharePdf(doc, widget.dailyExpenditure.date);
                      
                      // Navigate to success page after successful share
                      if (mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuccessPage(
                              title: 'PDF Berhasil Dibagikan',
                              subtitle: 'File telah berhasil dibagikan',
                            ),
                          ),
                        );
                      }
                    }
                  } catch (e) {
                    debugPrint('Share error: $e');
                  }
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
                  if (!mounted || bills.isEmpty) return;

                  try {
                    debugPrint(
                      'Download started for ${widget.dailyExpenditure.date}',
                    );

                    final doc = await generatePdfDoc(
                      bills,
                      widget.dailyExpenditure.date,
                    );

                    if (!mounted) return;

                    await savePdfToDevice(doc, widget.dailyExpenditure.date);
                    
                    // Navigate to success page after successful download
                    if (mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessPage(
                            title: 'PDF Berhasil Diunduh',
                            subtitle: 'File telah tersimpan di perangkat',
                          ),
                        ),
                      );
                    }
                  } catch (e) {
                    debugPrint('Download error: $e');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> savePdfToDevice(pw.Document doc, DateTime date) async {
  final String filename = 'daily_expenditure_${DateFormat('yyyyMMdd').format(date)}.pdf';

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => doc.save(),
    name: filename,
  );
}
Future<void> sharePdf(pw.Document doc, DateTime date) async {
  await Printing.sharePdf(
    bytes: await doc.save(),
    filename: 'daily_expenditure_${DateFormat('yyyyMMdd').format(date)}.pdf',
  );
}

// TODO : add some control flow to make sure user can abort the preview page and also success page

Future<pw.Document> generatePdfDoc(List<BillData> bills, DateTime date) async {
  return await generatePdfDocument(bills, date);
}

// TODO: implement the logic to handle the icon beside each item to show each bill detail in a modal that has the same table as the ones in the generated pdf 

// TODO: implement edit each bill item in the card modal user can choose which bill to discard or even edit 

// TODO: implement edit bill screen that is reusable in every flow