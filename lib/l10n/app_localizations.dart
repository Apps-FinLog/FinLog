import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @profileScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileScreenTitle;

  /// No description provided for @languageSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get languageSettingsTitle;

  /// No description provided for @languageSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Change application language'**
  String get languageSettingsSubtitle;

  /// No description provided for @languageSettingsSubtitleId.
  ///
  /// In en, this message translates to:
  /// **'Currently: Bahasa Indonesia'**
  String get languageSettingsSubtitleId;

  /// No description provided for @languageSettingsSubtitleEn.
  ///
  /// In en, this message translates to:
  /// **'Currently: English'**
  String get languageSettingsSubtitleEn;

  /// No description provided for @indonesianLanguage.
  ///
  /// In en, this message translates to:
  /// **'Indonesian'**
  String get indonesianLanguage;

  /// No description provided for @englishLanguage.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get englishLanguage;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirm Logout'**
  String get logoutConfirmation;

  /// No description provided for @logoutConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out of the application?'**
  String get logoutConfirmationMessage;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @memberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since {year}'**
  String memberSince(Object year);

  /// No description provided for @geminiApiSettings.
  ///
  /// In en, this message translates to:
  /// **'Gemini API Settings'**
  String get geminiApiSettings;

  /// No description provided for @configureAiHere.
  ///
  /// In en, this message translates to:
  /// **'Configure AI here'**
  String get configureAiHere;

  /// No description provided for @notificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notificationSettings;

  /// No description provided for @manageAppNotifications.
  ///
  /// In en, this message translates to:
  /// **'Manage app notifications'**
  String get manageAppNotifications;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @faqAndUsageGuide.
  ///
  /// In en, this message translates to:
  /// **'FAQ and usage guide'**
  String get faqAndUsageGuide;

  /// No description provided for @dailyNotifications.
  ///
  /// In en, this message translates to:
  /// **'Daily Notifications'**
  String get dailyNotifications;

  /// No description provided for @dailyNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reminders to record expenses'**
  String get dailyNotificationsSubtitle;

  /// No description provided for @weeklyNotifications.
  ///
  /// In en, this message translates to:
  /// **'Weekly Notifications'**
  String get weeklyNotifications;

  /// No description provided for @weeklyNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly expense summary'**
  String get weeklyNotificationsSubtitle;

  /// No description provided for @budgetNotifications.
  ///
  /// In en, this message translates to:
  /// **'Budget Notifications'**
  String get budgetNotifications;

  /// No description provided for @budgetNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Alerts when approaching budget limit'**
  String get budgetNotificationsSubtitle;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @geminiApiSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Gemini API Settings'**
  String get geminiApiSetupTitle;

  /// No description provided for @geminiApiSetupDescription.
  ///
  /// In en, this message translates to:
  /// **'To use our features, you need to set up Gemini API:'**
  String get geminiApiSetupDescription;

  /// No description provided for @step1.
  ///
  /// In en, this message translates to:
  /// **'Visit Google AI Studio'**
  String get step1;

  /// No description provided for @step1Description.
  ///
  /// In en, this message translates to:
  /// **'https://aistudio.google.com'**
  String get step1Description;

  /// No description provided for @step2.
  ///
  /// In en, this message translates to:
  /// **'Create an account or log in'**
  String get step2;

  /// No description provided for @step2Description.
  ///
  /// In en, this message translates to:
  /// **'Use your Google account'**
  String get step2Description;

  /// No description provided for @step3.
  ///
  /// In en, this message translates to:
  /// **'Create a new API Key'**
  String get step3;

  /// No description provided for @step3Description.
  ///
  /// In en, this message translates to:
  /// **'Click \"Create API Key\"'**
  String get step3Description;

  /// No description provided for @step4.
  ///
  /// In en, this message translates to:
  /// **'Copy API Key'**
  String get step4;

  /// No description provided for @step4Description.
  ///
  /// In en, this message translates to:
  /// **'Save securely'**
  String get step4Description;

  /// No description provided for @step5.
  ///
  /// In en, this message translates to:
  /// **'Enter into the app'**
  String get step5;

  /// No description provided for @step5Description.
  ///
  /// In en, this message translates to:
  /// **'Paste in the API Key field'**
  String get step5Description;

  /// No description provided for @geminiApiKey.
  ///
  /// In en, this message translates to:
  /// **'Gemini API Key'**
  String get geminiApiKey;

  /// No description provided for @enterYourApiKey.
  ///
  /// In en, this message translates to:
  /// **'Enter your API Key...'**
  String get enterYourApiKey;

  /// No description provided for @howToUseJournalingAi.
  ///
  /// In en, this message translates to:
  /// **'❓ How to use AI journaling?'**
  String get howToUseJournalingAi;

  /// No description provided for @howToUseJournalingAiAnswer.
  ///
  /// In en, this message translates to:
  /// **'Write your expenses in natural language, AI will automatically process and categorize them'**
  String get howToUseJournalingAiAnswer;

  /// No description provided for @howToSetupGeminiApi.
  ///
  /// In en, this message translates to:
  /// **'🔑 How to set up Gemini API?'**
  String get howToSetupGeminiApi;

  /// No description provided for @howToSetupGeminiApiAnswer.
  ///
  /// In en, this message translates to:
  /// **'Visit Google AI Studio, create an API Key, then enter it into the app settings'**
  String get howToSetupGeminiApiAnswer;

  /// No description provided for @howToViewFinancialReports.
  ///
  /// In en, this message translates to:
  /// **'📊 How to view financial reports?'**
  String get howToViewFinancialReports;

  /// No description provided for @howToViewFinancialReportsAnswer.
  ///
  /// In en, this message translates to:
  /// **'Open the Reports menu to view monthly expense and category analysis'**
  String get howToViewFinancialReportsAnswer;

  /// No description provided for @howToManageNotifications.
  ///
  /// In en, this message translates to:
  /// **'🔔 How to manage notifications?'**
  String get howToManageNotifications;

  /// No description provided for @howToManageNotificationsAnswer.
  ///
  /// In en, this message translates to:
  /// **'Go to Notification Settings to set daily and weekly reminders'**
  String get howToManageNotificationsAnswer;

  /// No description provided for @appUsageTips.
  ///
  /// In en, this message translates to:
  /// **'💡 App usage tips?'**
  String get appUsageTips;

  /// No description provided for @appUsageTipsAnswer.
  ///
  /// In en, this message translates to:
  /// **'Record expenses regularly, use AI features for automatic categorization'**
  String get appUsageTipsAnswer;

  /// No description provided for @selectProfilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Select Profile Photo'**
  String get selectProfilePhoto;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @logoutFromApp.
  ///
  /// In en, this message translates to:
  /// **'Logout from application'**
  String get logoutFromApp;

  /// No description provided for @dashboardContent.
  ///
  /// In en, this message translates to:
  /// **'Dashboard Content'**
  String get dashboardContent;

  /// No description provided for @categoryFoodBeverage.
  ///
  /// In en, this message translates to:
  /// **'Food & Beverage'**
  String get categoryFoodBeverage;

  /// No description provided for @categoryTransportation.
  ///
  /// In en, this message translates to:
  /// **'Transportation'**
  String get categoryTransportation;

  /// No description provided for @categoryShopping.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get categoryShopping;

  /// No description provided for @categoryBills.
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get categoryBills;

  /// No description provided for @categoryEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get categoryEntertainment;

  /// No description provided for @categoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get categoryHealth;

  /// No description provided for @categoryEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get categoryEducation;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @categoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryTitle;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategory;

  /// No description provided for @recordFinanceNow.
  ///
  /// In en, this message translates to:
  /// **'Record Finance\nNow!'**
  String get recordFinanceNow;

  /// No description provided for @nominalLabel.
  ///
  /// In en, this message translates to:
  /// **'Nominal'**
  String get nominalLabel;

  /// No description provided for @nominalHint.
  ///
  /// In en, this message translates to:
  /// **'Example: Rp 1,000,000'**
  String get nominalHint;

  /// No description provided for @nominalEmptyValidation.
  ///
  /// In en, this message translates to:
  /// **'Nominal cannot be empty'**
  String get nominalEmptyValidation;

  /// No description provided for @nominalInvalidValidation.
  ///
  /// In en, this message translates to:
  /// **'Invalid nominal'**
  String get nominalInvalidValidation;

  /// No description provided for @nominalEstimationHint.
  ///
  /// In en, this message translates to:
  /// **'Estimated nominal is more important than detailed nominal'**
  String get nominalEstimationHint;

  /// No description provided for @dateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateLabel;

  /// No description provided for @dateEmptyValidation.
  ///
  /// In en, this message translates to:
  /// **'Date cannot be empty'**
  String get dateEmptyValidation;

  /// No description provided for @descriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get descriptionLabel;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Example: Buy lunch'**
  String get descriptionHint;

  /// No description provided for @manualInputTitle.
  ///
  /// In en, this message translates to:
  /// **'Manual Input'**
  String get manualInputTitle;

  /// No description provided for @backButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @selectCategorySnackbar.
  ///
  /// In en, this message translates to:
  /// **'Please select a category first.'**
  String get selectCategorySnackbar;

  /// No description provided for @journalInputTitle.
  ///
  /// In en, this message translates to:
  /// **'Journal Input'**
  String get journalInputTitle;

  /// No description provided for @journalInputHint.
  ///
  /// In en, this message translates to:
  /// **'Write your expenses or income today, example: \"Lunch at canteen Rp 25,000, bought a book Rp 50,000\"'**
  String get journalInputHint;

  /// No description provided for @journalInputCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Write Your Financial Journal\nHere!'**
  String get journalInputCardTitle;

  /// No description provided for @confirmButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmButton;

  /// No description provided for @failedToParseExpense.
  ///
  /// In en, this message translates to:
  /// **'Failed to parse expense: {error}'**
  String failedToParseExpense(Object error);

  /// No description provided for @enterJournalEntryBeforeConfirming.
  ///
  /// In en, this message translates to:
  /// **'Please enter a journal entry before confirming.'**
  String get enterJournalEntryBeforeConfirming;

  /// No description provided for @recordFinanceToday.
  ///
  /// In en, this message translates to:
  /// **'Let\'s ~ take note!'**
  String get recordFinanceToday;

  /// No description provided for @rememberIt.
  ///
  /// In en, this message translates to:
  /// **'Remember it!'**
  String get rememberIt;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailable;

  /// No description provided for @invalidDateFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid Date Format'**
  String get invalidDateFormat;

  /// No description provided for @invalidDate.
  ///
  /// In en, this message translates to:
  /// **'Invalid Date'**
  String get invalidDate;

  /// No description provided for @inputDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Input Details'**
  String get inputDetailsTitle;

  /// No description provided for @dateLabelColon.
  ///
  /// In en, this message translates to:
  /// **'Date:'**
  String get dateLabelColon;

  /// No description provided for @amountLabelColon.
  ///
  /// In en, this message translates to:
  /// **'Amount:'**
  String get amountLabelColon;

  /// No description provided for @currencyIDR.
  ///
  /// In en, this message translates to:
  /// **'IDR'**
  String get currencyIDR;

  /// No description provided for @categoryLabelColon.
  ///
  /// In en, this message translates to:
  /// **'Category:'**
  String get categoryLabelColon;

  /// No description provided for @descriptionLabelColon.
  ///
  /// In en, this message translates to:
  /// **'Description:'**
  String get descriptionLabelColon;

  /// No description provided for @paymentMethodLabelColon.
  ///
  /// In en, this message translates to:
  /// **'Payment Method:'**
  String get paymentMethodLabelColon;

  /// No description provided for @addMoreButton.
  ///
  /// In en, this message translates to:
  /// **'Add More'**
  String get addMoreButton;

  /// No description provided for @originalInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Original Input:'**
  String get originalInputLabel;

  /// No description provided for @finlogAppTitle.
  ///
  /// In en, this message translates to:
  /// **'FinLog'**
  String get finlogAppTitle;

  /// No description provided for @transactionsToPdfTitle.
  ///
  /// In en, this message translates to:
  /// **'Transactions to PDF'**
  String get transactionsToPdfTitle;

  /// No description provided for @downloadTransactionsPdfSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Download Transactions as PDF'**
  String get downloadTransactionsPdfSubtitle;

  /// No description provided for @noBillDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No bill data available.'**
  String get noBillDataAvailable;

  /// No description provided for @loadingTransactionsData.
  ///
  /// In en, this message translates to:
  /// **'Loading transaction data...'**
  String get loadingTransactionsData;

  /// No description provided for @readingItem.
  ///
  /// In en, this message translates to:
  /// **'Reading Item..'**
  String get readingItem;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait.'**
  String get pleaseWait;

  /// No description provided for @offlineModeTitle.
  ///
  /// In en, this message translates to:
  /// **'You are in \noffline mode'**
  String get offlineModeTitle;

  /// No description provided for @redirectingToManualInput.
  ///
  /// In en, this message translates to:
  /// **'redirecting to \n manual recording'**
  String get redirectingToManualInput;

  /// No description provided for @operationSuccessfulTitle.
  ///
  /// In en, this message translates to:
  /// **'Operation Successful'**
  String get operationSuccessfulTitle;

  /// No description provided for @redirectingToHomePage.
  ///
  /// In en, this message translates to:
  /// **'redirecting to \n home page'**
  String get redirectingToHomePage;

  /// No description provided for @underDevelopmentTitle.
  ///
  /// In en, this message translates to:
  /// **'This page is under\nDevelopment'**
  String get underDevelopmentTitle;

  /// No description provided for @expenditureMonthYear.
  ///
  /// In en, this message translates to:
  /// **'Expenditure {month} {year}'**
  String expenditureMonthYear(Object month, Object year);

  /// No description provided for @monthJanuary.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get monthJanuary;

  /// No description provided for @monthFebruary.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get monthFebruary;

  /// No description provided for @monthMarch.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get monthMarch;

  /// No description provided for @monthApril.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get monthApril;

  /// No description provided for @monthMay.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthMay;

  /// No description provided for @monthJune.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get monthJune;

  /// No description provided for @monthJuly.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get monthJuly;

  /// No description provided for @monthAugust.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get monthAugust;

  /// No description provided for @monthSeptember.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get monthSeptember;

  /// No description provided for @monthOctober.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get monthOctober;

  /// No description provided for @monthNovember.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get monthNovember;

  /// No description provided for @monthDecember.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get monthDecember;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred: {error}'**
  String errorOccurred(Object error);

  /// No description provided for @scanBill.
  ///
  /// In en, this message translates to:
  /// **'Scan Bill'**
  String get scanBill;

  /// No description provided for @expenditureTitle.
  ///
  /// In en, this message translates to:
  /// **'Expenditure'**
  String get expenditureTitle;

  /// No description provided for @expenditureIncreaseMessage.
  ///
  /// In en, this message translates to:
  /// **'Your expenses have increased by 3%'**
  String get expenditureIncreaseMessage;

  /// No description provided for @reviewFinancialDashboard.
  ///
  /// In en, this message translates to:
  /// **'Review your finances on a detailed dashboard'**
  String get reviewFinancialDashboard;

  /// No description provided for @viewDashboardButton.
  ///
  /// In en, this message translates to:
  /// **'View Dashboard'**
  String get viewDashboardButton;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @inputExpense.
  ///
  /// In en, this message translates to:
  /// **'Input Expense'**
  String get inputExpense;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scan;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @letsTakeNoteToday.
  ///
  /// In en, this message translates to:
  /// **'Let\'s take note today!'**
  String get letsTakeNoteToday;

  /// No description provided for @billVerificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Bill Verification'**
  String get billVerificationTitle;

  /// No description provided for @scannedItemsTitle.
  ///
  /// In en, this message translates to:
  /// **'Scanned Items'**
  String get scannedItemsTitle;

  /// No description provided for @ensureAllItemsCorrect.
  ///
  /// In en, this message translates to:
  /// **'Ensure all items are read correctly'**
  String get ensureAllItemsCorrect;

  /// No description provided for @subtotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotalLabel;

  /// No description provided for @taxLabel.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get taxLabel;

  /// No description provided for @discountLabel.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discountLabel;

  /// No description provided for @otherLabel.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get otherLabel;

  /// No description provided for @totalAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmountLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
