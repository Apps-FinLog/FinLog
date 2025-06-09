import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert'; // Import for Base64 encoding/decoding
import 'dart:typed_data'; // Import for Uint8List
import 'package:finlog/styles/text_styles.dart';
import 'package:finlog/styles/colors.dart';
import 'package:finlog/services/user_profile_service.dart'; // Import UserProfileService
import 'package:provider/provider.dart'; // Import Provider
import 'package:finlog/l10n/app_localizations.dart'; // Import generated localizations

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _imageBytes; // Change type to Uint8List
  String _userName = ""; // Initialize as empty, will be loaded from service
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _geminiApiKeyController = TextEditingController(); // New controller
  bool _isEditingName = false;
  bool _hasNameChanged = false; // New state variable
  bool _hasImageChanged = false; // New state variable
  late UserProfileService _userProfileService; // Declare UserProfileService

  @override
  void initState() {
    super.initState();
    // Initialize _userProfileService after context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _userProfileService = Provider.of<UserProfileService>(
        context,
        listen: false,
      );
      _loadUserProfile();
      _nameController.addListener(_onNameChanged); // Add listener for name changes
      _geminiApiKeyController.text = _userProfileService.getGeminiApiKey() ?? ''; // Load API key
    });
  }

  void _onNameChanged() {
    if (_nameController.text != _userName && !_hasNameChanged) {
      setState(() {
        _hasNameChanged = true;
      });
    } else if (_nameController.text == _userName && _hasNameChanged) {
      setState(() {
        _hasNameChanged = false;
      });
    }
  }

  Future<void> _loadUserProfile() async {
    setState(() { // Move setState to encompass all updates
      _userName = _userProfileService.getUserName();
      final imageBase64 = _userProfileService.getProfileImageBase64();
      if (imageBase64 != null) {
        try {
          _imageBytes = base64Decode(imageBase64); // Decode to Uint8List
        } catch (e) {
          debugPrint('Error decoding Base64 image: $e');
          _imageBytes = null; // Fallback to default if decoding fails
        }
      } else {
        _imageBytes = null; // Ensure it's null if no image is saved
      }
      _nameController.text = _userName;
    });
  }

  Future<void> _saveProfileChanges() async {
    debugPrint('ProfileScreen: _saveProfileChanges called.');
    try {
      if (_hasNameChanged) {
        await _userProfileService.saveUserName(_nameController.text);
      }
      if (_hasImageChanged && _imageBytes != null) { // Use _imageBytes
        final base64String = base64Encode(_imageBytes!); // Encode Uint8List to Base64
        await _userProfileService.saveProfileImageBase64(base64String);
      }
      setState(() {
        // Update _userName with the current text from controller
        _userName = _nameController.text; 
        _hasNameChanged = false;
        _hasImageChanged = false;
      });
      debugPrint('ProfileScreen: _saveProfileChanges completed successfully.');
    } catch (e) {
      debugPrint('ProfileScreen: Error saving profile changes: $e');
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.selectProfilePhoto,
              style: AppTextStyles.appBarTitle,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImagePickerOption(
                  icon: Icons.camera_alt,
                  label: AppLocalizations.of(context)!.camera,
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await picker.pickImage(
                      source: ImageSource.camera,
                      maxWidth: 512,
                      maxHeight: 512,
                      imageQuality: 75,
                    );
                    if (pickedFile != null) {
                      final bytes = await pickedFile.readAsBytes();
                      setState(() {
                        _imageBytes = bytes; // Assign bytes directly
                        _hasImageChanged = true; // Set flag
                      });
                    }
                  },
                ),
                _buildImagePickerOption(
                  icon: Icons.photo_library,
                  label: AppLocalizations.of(context)!.gallery,
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await picker.pickImage(
                      source: ImageSource.gallery,
                      maxWidth: 512,
                      maxHeight: 512,
                      imageQuality: 75,
                    );
                    if (pickedFile != null) {
                      final bytes = await pickedFile.readAsBytes();
                      setState(() {
                        _imageBytes = bytes; // Assign bytes directly
                        _hasImageChanged = true; // Set flag
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePickerOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: finlogBluePrimary.withAlpha((255 * 0.1).round()),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: finlogBluePrimary.withAlpha((255 * 0.3).round()),
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: finlogBluePrimary, size: 32),
            const SizedBox(height: 8),
            Text(label, style: TextStyle(color: finlogBluePrimary, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [finlogBluePrimaryDark, finlogBluePrimary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: finlogBluePrimary.withAlpha((255 * 0.3).round()),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha((255 * 0.2).round()),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white.withAlpha((255 * 0.2).round()),
                    backgroundImage: _imageBytes != null 
                        ? MemoryImage(_imageBytes!) // Use MemoryImage with Uint8List
                        : const AssetImage('assets/images/user_profile.png') as ImageProvider,
                    child: _imageBytes == null // Check _imageBytes for null
                        ? const Icon(Icons.person, color: Colors.white, size: 40)
                        : null,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: finlogBluePrimary,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _isEditingName
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha((255 * 0.2).round()),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _nameController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  onSubmitted: (newValue) {
                      setState(() {
                        _userName = newValue;
                        _isEditingName = false;
                      });
                    },
                  onTapOutside: (event) {
                      setState(() {
                        _userName = _nameController.text;
                        _isEditingName = false;
                      });
                    },
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isEditingName = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha((255 * 0.2).round()),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.memberSince(2024),
            style: TextStyle(
              color: Colors.white.withAlpha((255 * 0.9).round()),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: Colors.grey[200],
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _buildMenuSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((255 * 0.1).round()),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildMenuTile(
            icon: Icons.auto_awesome,
            title: AppLocalizations.of(context)!.geminiApiSettings,
            subtitle: AppLocalizations.of(context)!.configureAiHere,
            onTap: () {
              _showGeminiSetupDialog();
            },
          ),
          _buildDivider(),
          _buildMenuTile(
            icon: Icons.language,
            title: AppLocalizations.of(context)!.languageSettingsTitle,
            subtitle: _getLanguageSubtitle(context),
            onTap: () {
              _showLanguageDialog();
            },
          ),
          _buildDivider(),
          _buildMenuTile(
            icon: Icons.notifications_outlined,
            title: AppLocalizations.of(context)!.notificationSettings,
            subtitle: AppLocalizations.of(context)!.manageAppNotifications,
            onTap: () {
              _showNotificationSettings();
            },
          ),
          _buildDivider(),
          _buildMenuTile(
            icon: Icons.help_outline,
            title: AppLocalizations.of(context)!.help,
            subtitle: AppLocalizations.of(context)!.faqAndUsageGuide,
            onTap: () {
              _showHelpDialog();
            },
          ),
          _buildDivider(),
          _buildMenuTile(
            icon: Icons.logout,
            title: AppLocalizations.of(context)!.logout,
            subtitle: AppLocalizations.of(context)!.logoutFromApp, // Assuming a new key for this
            textColor: Colors.red,
            iconColor: Colors.red,
            onTap: () {
              _showLogoutDialog();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (iconColor ?? finlogBluePrimary).withAlpha((255 * 0.1).round()),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon, 
          color: iconColor ?? finlogBluePrimary, 
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null 
          ? Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            )
          : null,
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
      onTap: onTap,
    );
  }

void _showGeminiSetupDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                Icon(Icons.auto_awesome, color: finlogBluePrimary),
                const SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.geminiApiSetupTitle,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            contentPadding: EdgeInsets.zero, // Set content padding to zero
            content: Builder(
              // Use Builder to get a new context
              builder: (dialogContext) {
                return SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 24.0, // Add horizontal padding
                    right: 24.0, // Add horizontal padding
                    top: 20.0, // Add top padding
                    bottom:
                        MediaQuery.of(dialogContext).viewInsets.bottom +
                        20.0, // Adjust padding for keyboard + extra space
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.geminiApiSetupDescription,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildSetupStep(
                        '1',
                        AppLocalizations.of(context)!.step1,
                        AppLocalizations.of(context)!.step1Description,
                      ),
                      _buildSetupStep(
                        '2',
                        AppLocalizations.of(context)!.step2,
                        AppLocalizations.of(context)!.step2Description,
                      ),
                      _buildSetupStep(
                        '3',
                        AppLocalizations.of(context)!.step3,
                        AppLocalizations.of(context)!.step3Description,
                      ),
                      _buildSetupStep(
                        '4',
                        AppLocalizations.of(context)!.step4,
                        AppLocalizations.of(context)!.step4Description,
                      ),
                      _buildSetupStep(
                        '5',
                        AppLocalizations.of(context)!.step5,
                        AppLocalizations.of(context)!.step5Description,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller:
                            _geminiApiKeyController, // Use the controller
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.geminiApiKey,
                          hintText:
                              AppLocalizations.of(context)!.enterYourApiKey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: finlogBluePrimary),
                          ),
                          prefixIcon: Icon(Icons.key, color: finlogBluePrimary),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              ElevatedButton(
                // --- PERUBAHAN DI SINI ---
                onPressed: () async {
                  // Amankan Navigator SEBELUM async gap
                  final navigator = Navigator.of(context);
                  // Simpan API Key
                  await _userProfileService.saveGeminiApiKey(
                    _geminiApiKeyController.text,
                  );
                  // Gunakan navigator yang sudah diamankan untuk menutup dialog
                  navigator.pop();
                },
                // --- AKHIR PERUBAHAN ---
                style: ElevatedButton.styleFrom(
                  backgroundColor: finlogBluePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.saveChanges,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildSetupStep(String number, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: finlogBluePrimary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    final userProfileService = Provider.of<UserProfileService>(context, listen: false);
    String currentLanguageCode = userProfileService.currentLocale.languageCode;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(AppLocalizations.of(context)!.selectLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: Text(AppLocalizations.of(context)!.indonesianLanguage),
              value: 'id',
              groupValue: currentLanguageCode,
              activeColor: finlogBluePrimary,
              onChanged: (value) {
                if (value != null) {
                  userProfileService.saveLocale(Locale(value));
                  Navigator.pop(context);
                }
              },
            ),
            RadioListTile<String>(
              title: Text(AppLocalizations.of(context)!.englishLanguage),
              value: 'en',
              groupValue: currentLanguageCode,
              activeColor: finlogBluePrimary,
              onChanged: (value) {
                if (value != null) {
                  userProfileService.saveLocale(Locale(value));
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getLanguageSubtitle(BuildContext context) {
    final userProfileService = Provider.of<UserProfileService>(context);
    final currentLocale = userProfileService.currentLocale;
    if (currentLocale.languageCode == 'id') {
      return AppLocalizations.of(context)!.languageSettingsSubtitleId;
    } else {
      return AppLocalizations.of(context)!.languageSettingsSubtitleEn;
    }
  }

  void _showNotificationSettings() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(AppLocalizations.of(context)!.notificationSettings),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              title: Text(AppLocalizations.of(context)!.dailyNotifications),
              subtitle: Text(AppLocalizations.of(context)!.dailyNotificationsSubtitle),
              value: true,
              activeColor: finlogBluePrimary,
              onChanged: (value) {
                // Handle daily notification toggle
              },
            ),
            SwitchListTile(
              title: Text(AppLocalizations.of(context)!.weeklyNotifications),
              subtitle: Text(AppLocalizations.of(context)!.weeklyNotificationsSubtitle),
              value: true,
              activeColor: finlogBluePrimary,
              onChanged: (value) {
                // Handle weekly notification toggle
              },
            ),
            SwitchListTile(
              title: Text(AppLocalizations.of(context)!.budgetNotifications),
              subtitle: Text(AppLocalizations.of(context)!.budgetNotificationsSubtitle),
              value: false,
              activeColor: finlogBluePrimary,
              onChanged: (value) {
                // Handle budget notification toggle
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(AppLocalizations.of(context)!.help, style: const TextStyle(color: Colors.black)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHelpItem(AppLocalizations.of(context)!.howToUseJournalingAi, 
                AppLocalizations.of(context)!.howToUseJournalingAiAnswer),
              _buildHelpItem(AppLocalizations.of(context)!.howToSetupGeminiApi, 
                AppLocalizations.of(context)!.howToSetupGeminiApiAnswer),
              _buildHelpItem(AppLocalizations.of(context)!.howToViewFinancialReports, 
                AppLocalizations.of(context)!.howToViewFinancialReportsAnswer),
              _buildHelpItem(AppLocalizations.of(context)!.howToManageNotifications, 
                AppLocalizations.of(context)!.howToManageNotificationsAnswer),
              _buildHelpItem(AppLocalizations.of(context)!.appUsageTips, 
                AppLocalizations.of(context)!.appUsageTipsAnswer),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: finlogBluePrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(AppLocalizations.of(context)!.close, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            answer,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(AppLocalizations.of(context)!.logoutConfirmation),
        content: Text(AppLocalizations.of(context)!.logoutConfirmationMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle logout logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(AppLocalizations.of(context)!.logout, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileHeader(),
            _buildMenuSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: (_hasNameChanged || _hasImageChanged)
          ? FloatingActionButton.extended(
              onPressed: _saveProfileChanges,
              label: Text(AppLocalizations.of(context)!.saveChanges),
              icon: const Icon(Icons.save),
              backgroundColor: finlogBluePrimary,
              foregroundColor: Colors.white,
            )
          : null,
    );
  }

  @override
  void dispose() {
    _nameController.removeListener(_onNameChanged); // Remove listener
    _nameController.dispose();
    _geminiApiKeyController.dispose(); // Dispose new controller
    super.dispose();
  }
}

