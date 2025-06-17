import 'package:flutter/material.dart';
import 'package:finlog/styles/text_styles.dart';
import 'package:finlog/screens/home_screen.dart';
import 'package:finlog/services/user_profile_service.dart';
import 'package:provider/provider.dart';
// import 'dart:convert'; // Tidak perlu lagi
import 'package:finlog/l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1.0);

  @override
  Widget build(BuildContext context) {
    final userProfileService = context.watch<UserProfileService>();
    final imageBytes = userProfileService.cachedImageBytes;

    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: false,
      titleSpacing: 0.0,
      title: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(title, style: AppTextStyles.appBarTitle),
            ),
            Expanded(
              child: Transform.translate(
                offset: const Offset(-20.0, 0.0), // Geser ke kiri
                child: Text(
                  AppLocalizations.of(context)!.letsTakeNoteToday,
                  style: AppTextStyles.appBarSubtitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
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
                  color: Colors.grey[300]!,
                  width: 0.5,
                ),
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundImage:
                    imageBytes != null
                        ? MemoryImage(imageBytes)
                        : const AssetImage('assets/images/user_profile.png')
                            as ImageProvider,
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
