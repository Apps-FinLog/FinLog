# FinLog

[![Latest Release](https://img.shields.io/github/v/release/Apps-FinLog/FinLog?label=Latest%20Release&style=for-the-badge)](https://github.com/Apps-FinLog/FinLog/releases/tag/v1.2.11%2B28)
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

FinLog is a Flutter-based mobile application for personal finance management and expense tracking. It features AI-powered journaling using Gemini API, manual transaction logging, receipt scanning capabilities, and comprehensive data visualization.

## Features

- **Manual Transaction Logging** - Add income and expenses with custom categories
- **AI-Powered Journaling** - Natural language transaction entry via Gemini API
- **Receipt Scanning** - Extract transaction data from receipt images (Gemini API)
- **Transaction History** - View and manage all your financial records
- **Smart Categorization** - Automatic expense categorization
- **AI Insights** - Get intelligent financial insights and recommendations **Coming soon**
- **Data Visualization** - Charts and graphs for spending analysis
- **User Profile Management** - Customizable profiles with API key configuration
- **Local Storage** - Secure offline data storage with Hive

## Technology Stack

- **Framework:** Flutter
- **State Management:** Provider
- **Local Database:** Hive
- **AI Integration:** Gemini API
- **Environment Config:** flutter_dotenv

## Downloads

[📱 Download Latest Version (v1.2.11+28)](https://github.com/Apps-FinLog/FinLog/releases/tag/v1.2.11%2B28)

## Quick Start

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and configured
- [Gemini API Key](https://makersuite.google.com/app/apikey) from Google AI Studio
- Android Studio, VS Code, or preferred IDE
- Physical device or emulator for testing

### Installation

1. **Clone and Setup**
   ```bash
   git clone https://github.com/Apps-FinLog/FinLog.git
   cd FinLog
   flutter pub get
   ```

2. **Environment Configuration**
   
   Create a `.env` file in the project root:
   ```env
   GEMINI_API_KEY=your_actual_api_key_here
   ```
   
   > ⚠️ **Security:** Never commit your `.env` file. Ensure it's in `.gitignore`.

3. **Verify Setup**
   ```bash
   flutter doctor
   ```

4. **Run the App**
   ```bash
   flutter run
   ```

### Building for Production

**Android APK:**
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

**App Bundle (Play Store):**
```bash
flutter build appbundle
```

## Configuration

### API Key Setup
Configure your Gemini API key in one of two ways:
1. **Environment file** (recommended for development) - Add to `.env` file
2. **In-app setup** - Configure in the app's profile section after first launch

### Development Commands
```bash
# Hot reload development
flutter run

# Clean build
flutter clean && flutter pub get

# Run tests
flutter test

# Code analysis
flutter analyze
```

## Known Issues & Limitations

### Current Issues
- **Release Build API Calls:** Gemini API may not function in release builds due to configuration or Proguard/R8 settings
- **Development Hot Restart:** Fresh installs may require hot restart (`R`) for Gemini API features to initialize properly

### Under Investigation
- API key configuration for release builds
- Service initialization timing issues
- API key restrictions in production environments

*These issues are actively being addressed. Features relying on Gemini API may be affected.*

## Troubleshooting

**Flutter not recognized:**
```bash
flutter doctor
```

**API Key errors:**
- Verify API key in `.env` file
- Check permissions in Google AI Studio
- Ensure key hasn't expired

**Build failures:**
```bash
flutter clean
flutter pub get
flutter build apk --release
```

## Project Structure

```
FinLog/
├── .env                 # Environment variables (not tracked)
├── lib/                 # Main application code
├── android/             # Android configuration
├── ios/                 # iOS configuration
├── build/               # Build outputs
└── pubspec.yaml         # Dependencies
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](https://choosealicense.com/licenses/mit/) for details.

