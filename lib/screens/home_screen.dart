import 'package:flutter/material.dart';
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
  int _previousIndex = 0; // New

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    HomeContentScreen(),
    ScanScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _previousIndex = _selectedIndex; // New
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      appBar: const CustomAppBar(title: 'FinLog'),
      body: AnimatedSwitcher( // New
        duration: const Duration(milliseconds: 300), // New
        transitionBuilder: (Widget child, Animation<double> animation) { // New
          final offsetAnimation = Tween<Offset>( // New
            begin: Offset((_selectedIndex > _previousIndex ? 1.0 : -1.0), 0.0), // New
            end: Offset.zero, // New
          ).animate(animation); // New
          return SlideTransition( // New
            position: offsetAnimation, // New
            child: child, // New
          ); // New
        },
        key: ValueKey<int>(_selectedIndex), // New
        child: _widgetOptions.elementAt(_selectedIndex), // New: Add a unique key for AnimatedSwitcher
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
