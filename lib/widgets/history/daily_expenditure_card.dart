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

import 'package:finlog/services/user_profile_service.dart'; // Import UserProfileService
import 'package:provider/provider.dart'; // Import Provider


class DailyExpenditureCard extends StatefulWidget {
  final DailyExpenditure dailyExpenditure;

  const DailyExpenditureCard({super.key, required this.dailyExpenditure});

  @override
  State<DailyExpenditureCard> createState() => _DailyExpenditureCardState();
}

class _DailyExpenditureCardState extends State<DailyExpenditureCard> {
  bool _isLoading = false;

  void _setLoading(bool loading) {
    if (mounted) {
      setState(() {
        _isLoading = loading;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    // Add safety check for empty bills list
    final bills = widget.dailyExpenditure.bills;    if (bills.isEmpty) {
      return ReusablePageCard(
        title: DateFormat(
          'EEEE, dd MMMM yyyy',
        ).format(widget.dailyExpenditure.date),
        subtitle: 'No bills for this date',
        child: const Center(child: Text('No expenditure data available')),
      );
    }
    
    final totalAmount = bills.fold(0.0, (sum, bill) => sum + bill.jumlahTotal);
    final userProfileService = Provider.of<UserProfileService>(context);
    final currentLocale = userProfileService.currentLocale;
    
    return ReusablePageCard(
      title: DateFormat(
        'EEEE, dd MMMM yyyy',
        currentLocale.languageCode,
      ).format(widget.dailyExpenditure.date),
      subtitle: 'Total: ${NumberFormat.currency(
        locale: currentLocale.languageCode,
        symbol: currentLocale.languageCode == 'id' ? 'Rp ' : '\$',
        decimalDigits: 0,
      ).format(totalAmount)}',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,        children: [
          const Divider(color: Colors.grey, thickness: 0.5),
          ...bills
              .where((bill) => bill.billItems.isNotEmpty)
              .map((bill) => BillSummaryItem(billData: bill)),
          const SizedBox(height: 24),
          Divider(color: Colors.grey[300], thickness: 1),
          // Show loading indicator when processing
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Processing...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (!_isLoading)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SHARE BUTTON
                _buildActionButton(
                  icon: Icons.share,
                  tooltip: 'Share PDF',
                  onPressed: () => _handleSharePdf(),
                ),
                const SizedBox(width: 8),
                
                // EDIT BUTTON  
                _buildActionButton(
                  icon: Icons.edit_note_rounded,
                  tooltip: 'Edit Bills',
                  onPressed: () => _handleEditBills(),
                ),
                const SizedBox(width: 8),
                
                // DOWNLOAD BUTTON
                _buildActionButton(
                  icon: Icons.file_download_outlined,
                  tooltip: 'Download PDF',
                  onPressed: () => _handleDownloadPdf(),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: IconButton(
        icon: Icon(icon, size: 20, color: Colors.blue.shade700),
        onPressed: onPressed,
        tooltip: tooltip,
        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      ),
    );
  }

  Future<void> _handleSharePdf() async {
    final bills = widget.dailyExpenditure.bills;
    if (!mounted || bills.isEmpty) return;

    _setLoading(true);
    try {
      debugPrint('Share button pressed for ${widget.dailyExpenditure.date}');
      
      final doc = await generatePdfDoc(bills, widget.dailyExpenditure.date);
      debugPrint('PDF generated for ${widget.dailyExpenditure.date}');
      
      await sharePdf(doc, widget.dailyExpenditure.date);
      
      
    } catch (e) {
      debugPrint('Share error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to share PDF: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _handleDownloadPdf() async {
    final bills = widget.dailyExpenditure.bills;
    if (!mounted || bills.isEmpty) return;

    _setLoading(true);
    try {
      debugPrint('Download started for ${widget.dailyExpenditure.date}');
      
      final doc = await generatePdfDoc(bills, widget.dailyExpenditure.date);
      await savePdfToDevice(doc, widget.dailyExpenditure.date);
      // TODO: receive the event from the preview page that the user has download the pdf and then add to the if
      // if (mounted && context.mounted) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const SuccessPage(
      //         title: 'PDF Berhasil Diunduh',
      //         subtitle: 'File telah tersimpan di perangkat',
      //       ),
      //     ),
      //   );
      // }
    } catch (e) {
      debugPrint('Download error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download PDF: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      _setLoading(false);
    }
  }

  void _handleEditBills() {
    debugPrint('Edit button pressed for ${widget.dailyExpenditure.date}');
    // TODO: Navigate to edit bills screen
    // This will be implemented when the edit bills functionality is added
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Edit functionality coming soon!'),
          backgroundColor: Colors.orange,
        ),
      );
    }
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