import 'dart:io';
import 'dart:math' as math; // Untuk animasi rotasi
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// GANTI 'finlog' dengan nama proyek Anda yang sebenarnya jika berbeda
import 'package:finlog/services/ocr_service.dart';
import 'package:finlog/screens/bill_details_screen.dart';
import 'package:finlog/screens/image_confirm_screen.dart';

// Warna dari desain
const Color finlogLoadingBlue = Color(
  0xFF0C6BFF,
); // Contoh biru dari desain Rincian Tagihan, sesuaikan jika beda untuk loading
const Color finlogProfileBgPlaceholder = Color(
  0xFFD8D8D8,
); // Warna placeholder avatar

class InputChoiceScreen extends StatefulWidget {
  const InputChoiceScreen({super.key});

  @override
  State<InputChoiceScreen> createState() => _InputChoiceScreenState();
}

class _InputChoiceScreenState extends State<InputChoiceScreen>
    with SingleTickerProviderStateMixin {
  final ImagePicker _picker = ImagePicker();
  final OcrService _ocrService = OcrService();
  bool _isLoading = false;

  AnimationController? _animationController;
  Animation<double>? _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(_animationController!);
  }

  @override
  void dispose() {
    _ocrService.dispose();
    _animationController?.dispose();
    super.dispose();
  }

  Future<void> _processImage(File imageFile) async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });

    final String extractedText = await _ocrService.extractTextFromImage(
      imageFile,
    );

    if (!mounted) return;
    // Navigasi ke BillDetailsScreen dan set _isLoading jadi false saat kembali atau selesai
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BillDetailsScreen(ocrResult: extractedText),
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
        bool? useThisImage = true;

        if (source == ImageSource.camera) {
          if (!mounted) return;
          useThisImage = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (context) => ImageConfirmScreen(imageFile: imageFile),
            ),
          );
        }

        if (useThisImage == true) {
          await _processImage(imageFile);
        } else {
          // User membatalkan di ImageConfirmScreen
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
          }
        }
      }
    } catch (e) {
      print("Error picking or processing image: $e");
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Terjadi kesalahan: ${e.toString()}")),
        );
      }
    }
  }

  Widget _buildOptionItem(
    BuildContext context,
    String label,
    VoidCallback onTap, {
    IconData? materialIcon,
    String? assetPath,
  }) {
    Widget iconWidget;
    Color iconColor = Colors.grey[700]!; // Warna ikon untuk Tampilan Scanner

    if (assetPath != null) {
      // Jika Anda punya file ikon valid:
      // iconWidget = Image.asset(assetPath, width: 48, height: 48, color: iconColor);
      // Karena file Anda hitam, saya fallback ke Material Icon
      iconWidget = Icon(
        materialIcon ?? Icons.error,
        size: 48,
        color: iconColor,
      );
    } else if (materialIcon != null) {
      iconWidget = Icon(materialIcon, size: 48, color: iconColor);
    } else {
      iconWidget = Icon(Icons.error, size: 48, color: iconColor);
    }

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          const SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 16, color: Colors.grey[800])),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Tampilan Loading (sesuai Galeri4.png)
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'FinLog',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundColor: finlogProfileBgPlaceholder,
                // child: Image.asset('assets/images/profile_avatar.png'), // Ganti dengan avatar Anda
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gunakan ikon kopi Material Design dengan animasi
              RotationTransition(
                turns: _rotationAnimation!,
                child: Icon(
                  Icons.coffee_outlined,
                  size: 64,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: LinearProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    finlogLoadingBlue,
                  ),
                  backgroundColor: Colors.grey[300],
                  minHeight: 5, // Ketebalan progress bar
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Membaca Item..',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Tunggu beberapa saat',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      );
    }

    // Tampilan Pilihan Input (sesuai Tampilan scanner.png)
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FinLog',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(backgroundColor: finlogProfileBgPlaceholder),
          ),
        ],
        backgroundColor: Colors.white, // Latar AppBar Tampilan Scanner
        elevation: 0, // Atau 1 jika ada shadow tipis
      ),
      // Latar belakang utama bisa putih atau abu-abu sangat muda
      // Desain Tampilan Scanner tidak terlalu jelas latarnya karena ada blur
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          // Anda bisa menambahkan gambar latar buram statis di sini jika mau
          // Contoh:
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/images/blurred_background.png', // Ganti dengan path gambar Anda
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Center(
            // Pusatkan tombol pilihan
            child: Container(
              // Untuk memberi sedikit jarak dari bottom jika tidak ada BottomNavBar
              // padding: const EdgeInsets.only(bottom: 80.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildOptionItem(
                    context,
                    'Kamera',
                    () => _pickImage(ImageSource.camera),
                    materialIcon: Icons.camera_alt_outlined, // Placeholder
                    // assetPath: 'assets/images/Group1.png', // Jika punya ikon kamera valid
                  ),
                  _buildOptionItem(
                    context,
                    'Galeri',
                    () => _pickImage(ImageSource.gallery),
                    materialIcon: Icons.photo_library_outlined, // Placeholder
                    // assetPath: 'assets/images/Group.png', // Jika punya ikon galeri valid
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
