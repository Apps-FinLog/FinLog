import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: const Color(0xFFE2E8F0), // Color of the line, matching app bar
          height: 1.0, // Thickness of the line
        ),
        Theme( // New
          data: Theme.of(context).copyWith( // New
            splashFactory: NoSplash.splashFactory, // New: Remove splash effect
            highlightColor: Colors.transparent, // New: Remove highlight effect
          ), // New
          child: BottomNavigationBar( // New
            backgroundColor: Colors.white, // White background
            elevation: 0, // Remove shadow
            items: <BottomNavigationBarItem>[
              _buildNavItem(0, 'assets/svgs/pie-chart.svg', 'Dashboard'),
              _buildNavItem(1, 'assets/svgs/home.svg', 'Home'),
              _buildNavItem(2, 'assets/svgs/scan.svg', 'Scan'),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.blue.shade700,
            unselectedItemColor: Colors.grey,
            onTap: onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(fontSize: 0), // Hide label space
            unselectedLabelStyle: const TextStyle(fontSize: 0), // Hide label space
            enableFeedback: false, // Disable press animation/feedback
          ), // New
        ), // New
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(int index, String iconPath, String label) {
    final bool isSelected = selectedIndex == index;
    final Color selectedColor = Color(0x800876FF); // #0876FF80

    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8), // Circular rectangle
        ),
        child: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            isSelected ? Colors.black : Colors.grey, // Icon color when selected/unselected
            BlendMode.srcIn,
          ),
        ),
      ),
      label: '', // Keep label as empty string to hide it
    );
  }
}
