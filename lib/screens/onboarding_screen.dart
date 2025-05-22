import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:finlog/styles/text_styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  double _indicatorPosition = 0.0; // For smooth animation

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _indicatorPosition = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _buildPages() {
    return [
      _buildOnboardingPage(
        title: "Catat Tanpa Ribet",
        description:
            "🗣️ Cukup ceritakan pengeluaranmu seperti ngobrol biasa.\n📓 FinLog akan menyimpan catatan keuanganmu secara otomatis dalam bentuk jurnal.",
        isLastPage: false,
      ),
      _buildOnboardingPage(
        title: "Catat Cepat",
        description:
            "🗣️ Langsung catat pengeluaran dari halaman landing — tanpa perlu klik banyak.",
        isLastPage: false,
      ),
      _buildOnboardingPage(
        title: "Pantau Dengan Mudah",
        description: "🗣️ Pantau melalui dashboard singkat.",
        isLastPage: false,
      ),
      _buildOnboardingPage(
        title: "Mulai Keuangan Sehat",
        description: "🗣 Bangun kebiasaan keuangan yang sehat tanpa takut dan santai.",
        isLastPage: true,
      ),
    ];
  }

  Widget _buildOnboardingPage({
    required String title,
    required String description,
    required bool isLastPage,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      color: Colors.transparent, // Ensure the page content itself is transparent
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Spacer(flex: 2),
          Text(
            title,
            textAlign: TextAlign.start,
            style: AppTextStyles.onboardingTitle,
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.start,
            style: AppTextStyles.onboardingDescription,
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fixed background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xFF60A5FA),
                  Color(0xFF0C68FF),
                  Color(0xFF1E3A8A),
                ],
              ),
            ),
          ),
          // PageView for scrolling content
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                // Update for logic, animation handled by listener
              });
            },
            children: _buildPages(),
          ),
          // Page indicator
          Positioned(
            top: 60, // Adjust as needed for status bar and aesthetics
            left: 80, // Increased padding to make it shorter
            right: 80, // Increased padding to make it shorter
            child: LayoutBuilder(
              builder: (context, constraints) {
                final totalWidth = constraints.maxWidth;
                final segmentWidth = totalWidth / _buildPages().length;

                return Stack(
                  children: [
                    // Background track
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    // Moving active segment
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 0), // Set duration to 0 for instant update with scroll
                      curve: Curves.linear, // Use linear curve for direct mapping to scroll
                      left: _indicatorPosition * segmentWidth,
                      child: Container(
                        height: 10,
                        width: segmentWidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // Fixed button at the bottom
          Positioned(
            bottom: 40.0,
            right: 40.0,
            child: SizedBox(
              width: 150, // Fixed width for the button
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  textStyle: AppTextStyles.onboardingButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {
                  final isLastPage = _pageController.page == _buildPages().length - 1;
                  if (isLastPage) {
                    if (kDebugMode) {
                      print("Onboarding completed!");
                    }
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      if (kDebugMode) {
                        print("Cannot pop, would navigate to home screen here.");
                      }
                    }
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  _pageController.hasClients && (_pageController.page ?? 0).round() == _buildPages().length - 1
                      ? 'Mulai'
                      : 'Lanjut',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
