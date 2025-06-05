import 'package:flutter/material.dart';
import 'package:finlog/styles/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1.0); // kToolbarHeight + line height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // White app bar background
      centerTitle: false, // Center the title
      title: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.appBarTitle, // Use the defined text style
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
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.purpleAccent, // Garis ungu
                width: 0.5,
              ),
            ),
            child: const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/user_profile.png'),
            ),
          ),
        ),
      ], // Remove shadow for a flat look
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0), // Height of the line
        child: Container(
          color: const Color(0xFFE2E8F0), // Color of the line
          height: 1.0, // Thickness of the line
        )
      ),

    );
  }
}
