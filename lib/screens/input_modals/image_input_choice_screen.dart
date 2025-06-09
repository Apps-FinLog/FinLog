import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:finlog/services/ocr_service.dart';
import 'package:finlog/screens/verifikasi_screens/bill_details_screen.dart';
import 'package:finlog/widgets/loading/loading_overlay.dart';
import 'package:finlog/models/bill_data.dart'; // Import BillData
import 'package:finlog/services/user_profile_service.dart'; // Import UserProfileService
import 'package:provider/provider.dart'; // Import Provider
import 'package:finlog/l10n/app_localizations.dart';

class ImageInputChoiceScreen extends StatefulWidget {
  const ImageInputChoiceScreen({super.key});

  @override
  State<ImageInputChoiceScreen> createState() => _ImageInputChoiceScreenState();
}

class _ImageInputChoiceScreenState extends State<ImageInputChoiceScreen> {
  final ImagePicker _picker = ImagePicker();
  late OcrService _ocrService; // Declare OcrService
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProfileService = Provider.of<UserProfileService>(context, listen: false);
      _ocrService = OcrService(userProfileService); // Initialize OcrService with UserProfileService
    });
  }

  @override
  void dispose() {
    _ocrService.dispose();
    super.dispose();
  }

  Future<void> _processImage(File imageFile) async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });

    final Map<String, dynamic> extractedData = await _ocrService.extractTextFromImage(
      imageFile,
    );

    if (!mounted) return;
    // Navigasi ke BillDetailsScreen dan set _isLoading jadi false saat kembali atau selesai
    final billData = BillData();
    billData.parseOcrResult(extractedData);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BillDetailsScreen(billData: billData),
      ),
    ).then((_) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    if (_isLoading) return;
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        await _processImage(imageFile);
      }
    } catch (error) { // Changed 'e' to 'error'
      debugPrint("Error picking or processing image: $error");
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.errorOccurred(error.toString()))),
        );
      }
    }
  }

  Widget _buildOptionItem(
    BuildContext context,
    String line1,
    String line2,
    IconData iconData,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(iconData, size: 24), // Use Icon widget with IconData
          SizedBox(height: 8), // Spacing between icon and text
          Text(
            line1,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            line2,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const LoadingOverlay();
    }

    // Tampilan Pilihan Input (sesuai Tampilan scanner.png)
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/blurred-background.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            
            // Pusatkan tombol pilihan
            child: Container(

              padding: EdgeInsets.only(top:20, bottom: 20),
              color: Colors.white60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildOptionItem(
                    context,
                    AppLocalizations.of(context)!.scanBill, // line1 for first item
                    AppLocalizations.of(context)!.camera,  // line2 for first item
                    Icons.camera_alt_outlined, // Icon for Camera
                    () {
                      _pickImage(ImageSource.camera);
                    },
                  ),
                  _buildOptionItem(
                    context,
                    AppLocalizations.of(context)!.scanBill, // line1 for second item
                    AppLocalizations.of(context)!.gallery,  // line2 for second item
                    Icons.photo_library_outlined, // Icon for Gallery
                    () => _pickImage(ImageSource.gallery),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: CustomBottomNavigationBar( ... ) // Jika ada
    );
  }
}
