import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finlog/l10n/app_localizations.dart';

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
        Theme(
          // New
          data: Theme.of(context).copyWith(
            // New
            splashFactory: NoSplash.splashFactory, // New: Remove splash effect
            highlightColor: Colors.transparent, // New: Remove highlight effect
          ), // New
          child: BottomNavigationBar(
            // New
            backgroundColor: Colors.white, // White background
            elevation: 0, // Remove shadow
            items: <BottomNavigationBarItem>[
              _buildNavItem(0, 'assets/svgs/home.svg', AppLocalizations.of(context)!.home),
              _buildNavItem(1, 'assets/svgs/calculator.svg', AppLocalizations.of(context)!.inputExpense),
              _buildNavItem(2, 'assets/svgs/scan.svg', AppLocalizations.of(context)!.scan),
              _buildNavItem(3, 'assets/svgs/pie-chart.svg', AppLocalizations.of(context)!.history),
              _buildNavItem(4, null, AppLocalizations.of(context)!.profile, materialIcon: Icons.person, materialIconInactive: Icons.person_outline), // Use filled/unfilled Material Icon for Profile
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.blue.shade700,
            unselectedItemColor: Colors.grey,
            onTap: onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              fontSize: 0,
            ), // Hide label space
            unselectedLabelStyle: const TextStyle(
              fontSize: 0,
            ), // Hide label space
            enableFeedback: false, // Disable press animation/feedback
          ), // New
        ), // New
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(
    int index,
    String? iconPath, // Make iconPath nullable
    String label,
    {IconData? materialIcon, IconData? materialIconInactive} // Add optional materialIcon parameters
  ) {
    final bool isSelected = selectedIndex == index;
    final Color selectedColor = Color(0x800876FF); // #0876FF80

    Widget iconWidget;
    if (materialIcon != null && materialIconInactive != null) {
      iconWidget = Icon(
        isSelected ? materialIcon : materialIconInactive,
        size: 24,
        color: isSelected ? Colors.black : Colors.grey,
      );
    } else if (iconPath != null) {
      iconWidget = SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          isSelected
              ? Colors.black
              : Colors.grey, // Icon color when selected/unselected
          BlendMode.srcIn,
        ),
      );
    } else {
      iconWidget = const SizedBox(width: 24, height: 24); // Placeholder if no icon
    }

    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8), // Circular rectangle
        ),
        child: iconWidget,
      ),
      label: '', // Keep label as empty string to hide it
    );
  }
}
