import 'package:flutter/material.dart';
import 'package:finlog/styles/text_styles.dart';
import 'package:finlog/screens/home_screen.dart'; // Import the home screen
import 'package:finlog/services/user_profile_service.dart'; // Import UserProfileService
import 'package:provider/provider.dart'; // Import Provider
import 'dart:convert'; // Import for Base64 encoding/decoding
import 'dart:typed_data'; // Import for Uint8List

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  Uint8List? _imageBytes;

  late UserProfileService _userProfileService;

  @override
  void initState() {
    super.initState();
    // Initialize _userProfileService after context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _userProfileService = Provider.of<UserProfileService>(context, listen: false);
      _userProfileService.addListener(_updateImage);
      _updateImage(); // Initial load
    });
  }

  void _updateImage() {
    final imageBase64 = _userProfileService.getProfileImageBase64();
    if (imageBase64 != null) {
      try {
        setState(() {
          _imageBytes = base64Decode(imageBase64);
        });
      } catch (e) {
        print('Error decoding Base64 image in CustomAppBar: $e');
        setState(() {
          _imageBytes = null;
        });
      }
    } else {
      setState(() {
        _imageBytes = null;
      });
    }
  }

  @override
  void dispose() {
    _userProfileService.removeListener(_updateImage);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Row(
        children: [
          Text(
            widget.title,
            style: AppTextStyles.appBarTitle,
          ),
          Expanded(
            child: Text(
              '~yuk catat hari ini!',
              style: AppTextStyles.appBarSubtitle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen(initialIndex: 4)),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.purpleAccent,
                  width: 0.5,
                ),
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: _imageBytes != null
                    ? MemoryImage(_imageBytes!)
                    : const AssetImage('assets/images/user_profile.png') as ImageProvider,
              ),
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: const Color(0xFFE2E8F0),
          height: 1.0,
        ),
      ),
    );
  }
}
