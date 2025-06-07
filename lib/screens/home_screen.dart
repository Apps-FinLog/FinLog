import 'package:finlog/screens/input_modals/image_input_choice_screen.dart';
import 'package:finlog/screens/utility_page/under_development.dart';
import 'package:flutter/material.dart';
import 'package:finlog/screens/input_modals/text_input_choice_screen.dart'; // Import TextInputChoiceScreen
import 'package:finlog/widgets/headers/custom_app_bar.dart'; // Import CustomAppBar
import 'package:finlog/widgets/navs/custom_bottom_navigation_bar.dart';
import 'package:finlog/screens/history_screen.dart'; // Import HistoryScreen
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
    const HistoryScreen(), // Index 3: Riwayat
    const UnderDevelopmentPage(), // Index 4: Profil
  ];
  //refactor these code to change the body value 
  // this will route to the correct page that contain widget defintions
  // the route is hardcoded into the enum here
  
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
