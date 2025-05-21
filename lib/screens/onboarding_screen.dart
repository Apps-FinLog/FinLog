import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPages() {
    return [
      _buildOnboardingPage(
        title: "Catat Tanpa Ribet",
        description:
            "Cukup ceritakan pengeluaranmu seperti ngobrol biasa.\nFinLog akan menyimpan catatan keuanganmu secara otomatis dalam bentuk jurnal.",
        isLastPage: false,
      ),
      _buildOnboardingPage(
        title: "Catat Cepat",
        description:
            "Langsung catat pengeluaran dari halaman landing - tanpa perlu klik banyak.",
        isLastPage: false,
      ),
      _buildOnboardingPage(
        title: "Pantau Dengan Mudah",
        description: "Pantau melalui dashboard singkat.",
        isLastPage: false,
      ),
      _buildOnboardingPage(
        title: "Mulai Keuangan Sehat",
        description: "Bangun kebiasaan keuangan yang sehat tanpa takut dan santai.",
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
      padding: const EdgeInsets.all(24.0),
      color: Colors.blue.shade700, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(flex: 2),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const Spacer(flex: 3),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87, // Button color from image
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Adjusted padding
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Slightly rounded corners
                ),
              ),
              onPressed: () {
                if (isLastPage) {
                  print("Onboarding completed!");

                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    print("Cannot pop, would navigate to home screen here.");
                  }
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                isLastPage ? 'Mulai' : 'Lanjut',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: _buildPages(),
          ),
          Positioned(
            top: 60, // Adjust as needed for status bar and aesthetics
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _buildPages().length,
                (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 10,
                    width: (index == _currentPage) ? 30 : 10, // Active page indicator is wider
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == _currentPage) ? Colors.white : Colors.white54,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
