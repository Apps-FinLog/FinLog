import 'package:finlog/screens/image_input_choice_screen.dart';
import 'package:finlog/screens/placeHolderPage/under_development.dart';
import 'package:flutter/material.dart';
import 'package:finlog/screens/text_input_choice_screen.dart'; // Import TextInputChoiceScreen
import 'package:finlog/widgets/custom_app_bar.dart'; // Import CustomAppBar
import 'package:finlog/widgets/custom_bottom_navigation_bar.dart';
import 'package:finlog/screens/home_content_screen.dart'; // Import HomeContentScreen
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
    const HomeContentScreen(), // Index 0: Beranda
    const TextInputChoiceScreen(), // Index 1: Input Expense
    const ImageInputChoiceScreen(), // Index 2: Scan
    const UnderDevelopmentPage(), // Index 3: Riwayat
    const UnderDevelopmentPage(), // Index 4: Profil
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
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
