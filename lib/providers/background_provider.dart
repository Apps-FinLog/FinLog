import 'package:flutter/material.dart';
import 'dart:ui';

class BackgroundProvider extends ChangeNotifier {
  // Store the home screen widget to be blurred
  Widget? _homeScreenWidget;

  // Getter for the home screen widget
  Widget? get homeScreenWidget => _homeScreenWidget;

  // Setter for the home screen widget
  void setHomeScreenWidget(Widget widget) {
    _homeScreenWidget = widget;
    notifyListeners();
  }

  // Method to get the blurred home screen widget
  Widget getBlurredBackground() {
    if (_homeScreenWidget == null) {
      // Fallback to the static image if no home screen widget is available
      return Image.asset(
        "assets/images/blurred-background.png",
        fit: BoxFit.cover,
      );
    }

    // Return the home screen widget with a blur effect
    return Stack(
      children: [
        // The home screen widget
        _homeScreenWidget!,

        // The blur effect
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(color: Colors.black.withOpacity(0.2)),
        ),
      ],
    );
  }
}
