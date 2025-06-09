// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get profileScreenTitle => 'Profile';

  @override
  String get languageSettingsTitle => 'Language Settings';

  @override
  String get languageSettingsSubtitle => 'Change application language';

  @override
  String get languageSettingsSubtitleId => 'Currently: Bahasa Indonesia';

  @override
  String get languageSettingsSubtitleEn => 'Currently: English';

  @override
  String get indonesianLanguage => 'Indonesian';

  @override
  String get englishLanguage => 'English';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get cancel => 'Cancel';

  @override
  String get logoutConfirmation => 'Confirm Logout';

  @override
  String get logoutConfirmationMessage =>
      'Are you sure you want to log out of the application?';

  @override
  String get logout => 'Logout';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String memberSince(Object year) {
    return 'Member since $year';
  }

  @override
  String get geminiApiSettings => 'Gemini API Settings';

  @override
  String get configureAiHere => 'Configure AI here';

  @override
  String get notificationSettings => 'Notification Settings';

  @override
  String get manageAppNotifications => 'Manage app notifications';

  @override
  String get help => 'Help';

  @override
  String get faqAndUsageGuide => 'FAQ and usage guide';

  @override
  String get dailyNotifications => 'Daily Notifications';

  @override
  String get dailyNotificationsSubtitle => 'Reminders to record expenses';

  @override
  String get weeklyNotifications => 'Weekly Notifications';

  @override
  String get weeklyNotificationsSubtitle => 'Weekly expense summary';

  @override
  String get budgetNotifications => 'Budget Notifications';

  @override
  String get budgetNotificationsSubtitle =>
      'Alerts when approaching budget limit';

  @override
  String get close => 'Close';

  @override
  String get geminiApiSetupTitle => 'Gemini API Settings';

  @override
  String get geminiApiSetupDescription =>
      'To use our features, you need to set up Gemini API:';

  @override
  String get step1 => 'Visit Google AI Studio';

  @override
  String get step1Description => 'https://aistudio.google.com';

  @override
  String get step2 => 'Create an account or log in';

  @override
  String get step2Description => 'Use your Google account';

  @override
  String get step3 => 'Create a new API Key';

  @override
  String get step3Description => 'Click \"Create API Key\"';

  @override
  String get step4 => 'Copy API Key';

  @override
  String get step4Description => 'Save securely';

  @override
  String get step5 => 'Enter into the app';

  @override
  String get step5Description => 'Paste in the API Key field';

  @override
  String get geminiApiKey => 'Gemini API Key';

  @override
  String get enterYourApiKey => 'Enter your API Key...';

  @override
  String get howToUseJournalingAi => '❓ How to use AI journaling?';

  @override
  String get howToUseJournalingAiAnswer =>
      'Write your expenses in natural language, AI will automatically process and categorize them';

  @override
  String get howToSetupGeminiApi => '🔑 How to set up Gemini API?';

  @override
  String get howToSetupGeminiApiAnswer =>
      'Visit Google AI Studio, create an API Key, then enter it into the app settings';

  @override
  String get howToViewFinancialReports => '📊 How to view financial reports?';

  @override
  String get howToViewFinancialReportsAnswer =>
      'Open the Reports menu to view monthly expense and category analysis';

  @override
  String get howToManageNotifications => '🔔 How to manage notifications?';

  @override
  String get howToManageNotificationsAnswer =>
      'Go to Notification Settings to set daily and weekly reminders';

  @override
  String get appUsageTips => '💡 App usage tips?';

  @override
  String get appUsageTipsAnswer =>
      'Record expenses regularly, use AI features for automatic categorization';

  @override
  String get selectProfilePhoto => 'Select Profile Photo';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get logoutFromApp => 'Logout from application';

  @override
  String get dashboardContent => 'Dashboard Content';

  @override
  String get categoryFoodBeverage => 'Food & Beverage';

  @override
  String get categoryTransportation => 'Transportation';

  @override
  String get categoryShopping => 'Shopping';

  @override
  String get categoryBills => 'Bills';

  @override
  String get categoryEntertainment => 'Entertainment';

  @override
  String get categoryHealth => 'Health';

  @override
  String get categoryEducation => 'Education';

  @override
  String get categoryOther => 'Other';

  @override
  String get categoryTitle => 'Category';

  @override
  String get selectCategory => 'Select Category';

  @override
  String get recordFinanceNow => 'Record Finance\nNow!';

  @override
  String get nominalLabel => 'Nominal';

  @override
  String get nominalHint => 'Example: Rp 1,000,000';

  @override
  String get nominalEmptyValidation => 'Nominal cannot be empty';

  @override
  String get nominalInvalidValidation => 'Invalid nominal';

  @override
  String get nominalEstimationHint =>
      'Estimated nominal is more important than detailed nominal';

  @override
  String get dateLabel => 'Date';

  @override
  String get dateEmptyValidation => 'Date cannot be empty';

  @override
  String get descriptionLabel => 'Description (Optional)';

  @override
  String get descriptionHint => 'Example: Buy lunch';

  @override
  String get manualInputTitle => 'Manual Input';

  @override
  String get backButton => 'Back';

  @override
  String get continueButton => 'Continue';

  @override
  String get selectCategorySnackbar => 'Please select a category first.';

  @override
  String get journalInputTitle => 'Journal Input';

  @override
  String get journalInputHint =>
      'Write your expenses or income today, example: \"Lunch at canteen Rp 25,000, bought a book Rp 50,000\"';

  @override
  String get journalInputCardTitle => 'Write Your Financial Journal\nHere!';

  @override
  String get confirmButton => 'Confirm';

  @override
  String failedToParseExpense(Object error) {
    return 'Failed to parse expense: $error';
  }

  @override
  String get enterJournalEntryBeforeConfirming =>
      'Please enter a journal entry before confirming.';

  @override
  String get recordFinanceToday => 'Let\'s ~ take note!';

  @override
  String get rememberIt => 'Remember it!';

  @override
  String get notAvailable => 'N/A';

  @override
  String get invalidDateFormat => 'Invalid Date Format';

  @override
  String get invalidDate => 'Invalid Date';

  @override
  String get inputDetailsTitle => 'Input Details';

  @override
  String get dateLabelColon => 'Date:';

  @override
  String get amountLabelColon => 'Amount:';

  @override
  String get currencyIDR => 'IDR';

  @override
  String get categoryLabelColon => 'Category:';

  @override
  String get descriptionLabelColon => 'Description:';

  @override
  String get paymentMethodLabelColon => 'Payment Method:';

  @override
  String get addMoreButton => 'Add More';

  @override
  String get originalInputLabel => 'Original Input:';

  @override
  String get finlogAppTitle => 'FinLog';

  @override
  String get transactionsToPdfTitle => 'Transactions to PDF';

  @override
  String get downloadTransactionsPdfSubtitle => 'Download Transactions as PDF';

  @override
  String get noBillDataAvailable => 'No bill data available.';

  @override
  String get loadingTransactionsData => 'Loading transaction data...';

  @override
  String get readingItem => 'Reading Item..';

  @override
  String get pleaseWait => 'Please wait.';

  @override
  String get offlineModeTitle => 'You are in \noffline mode';

  @override
  String get redirectingToManualInput => 'redirecting to \n manual recording';

  @override
  String get operationSuccessfulTitle => 'Operation Successful';

  @override
  String get redirectingToHomePage => 'redirecting to \n home page';

  @override
  String get underDevelopmentTitle => 'This page is under\nDevelopment';

  @override
  String expenditureMonthYear(Object month, Object year) {
    return 'Expenditure $month $year';
  }

  @override
  String get monthJanuary => 'January';

  @override
  String get monthFebruary => 'February';

  @override
  String get monthMarch => 'March';

  @override
  String get monthApril => 'April';

  @override
  String get monthMay => 'May';

  @override
  String get monthJune => 'June';

  @override
  String get monthJuly => 'July';

  @override
  String get monthAugust => 'August';

  @override
  String get monthSeptember => 'September';

  @override
  String get monthOctober => 'October';

  @override
  String get monthNovember => 'November';

  @override
  String get monthDecember => 'December';

  @override
  String errorOccurred(Object error) {
    return 'An error occurred: $error';
  }

  @override
  String get scanBill => 'Scan Bill';

  @override
  String get expenditureTitle => 'Expenditure';

  @override
  String get expenditureIncreaseMessage => 'Your expenses have increased by 3%';

  @override
  String get reviewFinancialDashboard =>
      'Review your finances on a detailed dashboard';

  @override
  String get viewDashboardButton => 'View Dashboard';

  @override
  String get home => 'Home';

  @override
  String get inputExpense => 'Input Expense';

  @override
  String get scan => 'Scan';

  @override
  String get history => 'History';

  @override
  String get profile => 'Profile';

  @override
  String get letsTakeNoteToday => 'Let\'s take note today!';

  @override
  String get billVerificationTitle => 'Bill Verification';

  @override
  String get scannedItemsTitle => 'Scanned Items';

  @override
  String get ensureAllItemsCorrect => 'Ensure all items are read correctly';

  @override
  String get subtotalLabel => 'Subtotal';

  @override
  String get taxLabel => 'Tax';

  @override
  String get discountLabel => 'Discount';

  @override
  String get otherLabel => 'Other';

  @override
  String get totalAmountLabel => 'Total Amount';
}
