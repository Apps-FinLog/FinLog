import 'package:finlog/screens/placeHolderPage/under_development.dart';
import 'package:flutter/material.dart';
import 'package:finlog/screens/input_choice_screen.dart';
import 'package:finlog/widgets/custom_app_bar.dart'; // Import CustomAppBar
import 'package:finlog/screens/input_choice_expense.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({super.key, this.initialIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // Corrected order and number of widgets to align with BottomNavigationBar items
  static final List<Widget> _widgetOptions = <Widget>[
    const InputChoiceScreen(), // Index 0: Corresponds to 'Scan'
    const InputChoiceScreenExpense(), // Index 1: Corresponds to 'Input Expense'
    const UnderDevelopmentPage(), // Index 2: Corresponds to 'Beranda'
    const UnderDevelopmentPage(), // Index 3: Corresponds to 'Riwayat'
    const UnderDevelopmentPage(), // Index 4: Corresponds to 'Profil'
    // If ReusablePlaceholder doesn't take pageName, you can use:
    // const Center(child: Text('Profil - Under Development')),
    // or another instance of UnderDevelopmentPage if it's generic enough.
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'FinLog'), // Use CustomAppBar here
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_outlined),
            activeIcon: Icon(Icons.qr_code_scanner),
            label: 'Scan', // Index 0
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined), // Changed icon for better distinction
            activeIcon: Icon(Icons.receipt_long),   // Changed icon for better distinction
            label: 'Input Expense', // Index 1
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Beranda', // Index 2
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history),
            label: 'Riwayat', // Index 3
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil', // Index 4
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
