import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finlog/styles/text_styles.dart';
import 'package:finlog/screens/dashboard_screen.dart';
import 'package:finlog/screens/home_content_screen.dart';
import 'package:finlog/screens/scan_screen.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white, // White app bar background
        centerTitle: true, // Center the title
        title: Text(
          'FinLog',
          style: AppTextStyles.appBarTitle, // Use the defined text style
        ),
        elevation: 0, // Remove shadow for a flat look
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // Height of the line
          child: Container(
            color: const Color(0xFFE2E8F0), // Color of the line
            height: 1.0, // Thickness of the line
          ),
        ),
      ),
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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min, // New
        children: [ // New
          Container( // New
            color: const Color(0xFFE2E8F0), // Color of the line, matching app bar
            height: 1.0, // Thickness of the line
          ), // New
          BottomNavigationBar( // New
            backgroundColor: Colors.white, // White background
            elevation: 0, // Remove shadow
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svgs/pie-chart.svg', width: 24, height: 24),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svgs/home.svg', width: 24, height: 24),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svgs/scan.svg', width: 24, height: 24),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex, // New
            selectedItemColor: Colors.blue.shade700,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(fontSize: 0), // Hide label space
            unselectedLabelStyle: const TextStyle(fontSize: 0), // Hide label space
          ),
        ], // New
      ), // New
    );
  }
}
