import 'package:flutter/material.dart';
// GANTI 'finlog' dengan nama proyek Anda yang sebenarnya jika berbeda
import 'package:finlog/screens/input_choice_screen.dart';
import 'package:finlog/screens/dashboard_screen.dart';
import 'package:finlog/screens/home_content_screen.dart';
import 'package:finlog/screens/scan_screen.dart';
import 'package:finlog/widgets/custom_bottom_navigation_bar.dart';
import 'package:finlog/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Ganti Widget Text placeholder ini dengan layar Anda yang sebenarnya
  // Pastikan InputChoiceScreen ada di indeks yang sesuai dengan item "Scan" Anda
  static final List<Widget> _widgetOptions = <Widget>[
    const Center(child: Text('Beranda (Index 0)')), // Placeholder
    const InputChoiceScreen(), // Untuk fitur Scan/OCR
    const Center(child: Text('Riwayat (Index 2)')), // Placeholder
    const Center(child: Text('Profil (Index 3)')), // Placeholder
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FinLog'),
        // actions: [ ... avatar profil ... ],
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_outlined),
            activeIcon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColorDark, // Sesuaikan
        unselectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}
