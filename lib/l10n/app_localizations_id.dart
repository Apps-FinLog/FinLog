// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get profileScreenTitle => 'Profil';

  @override
  String get languageSettingsTitle => 'Pengaturan Bahasa';

  @override
  String get languageSettingsSubtitle => 'Ubah bahasa aplikasi';

  @override
  String get languageSettingsSubtitleId => 'Saat ini: Bahasa Indonesia';

  @override
  String get languageSettingsSubtitleEn => 'Saat ini: English';

  @override
  String get indonesianLanguage => 'Bahasa Indonesia';

  @override
  String get englishLanguage => 'English';

  @override
  String get selectLanguage => 'Pilih Bahasa';

  @override
  String get saveChanges => 'Simpan Perubahan';

  @override
  String get cancel => 'Batal';

  @override
  String get logoutConfirmation => 'Konfirmasi Keluar';

  @override
  String get logoutConfirmationMessage =>
      'Apakah Anda yakin ingin keluar dari aplikasi?';

  @override
  String get logout => 'Keluar';

  @override
  String get personalInformation => 'Informasi Personal';

  @override
  String memberSince(Object year) {
    return 'Member sejak $year';
  }

  @override
  String get geminiApiSettings => 'Pengaturan API Gemini';

  @override
  String get configureAiHere => 'Konfigurasi AI di sini';

  @override
  String get notificationSettings => 'Pengaturan Notifikasi';

  @override
  String get manageAppNotifications => 'Kelola notifikasi aplikasi';

  @override
  String get help => 'Bantuan';

  @override
  String get faqAndUsageGuide => 'FAQ dan panduan penggunaan';

  @override
  String get dailyNotifications => 'Notifikasi Harian';

  @override
  String get dailyNotificationsSubtitle =>
      'Pengingat untuk mencatat pengeluaran';

  @override
  String get weeklyNotifications => 'Notifikasi Mingguan';

  @override
  String get weeklyNotificationsSubtitle => 'Ringkasan pengeluaran mingguan';

  @override
  String get budgetNotifications => 'Notifikasi Budget';

  @override
  String get budgetNotificationsSubtitle =>
      'Peringatan ketika mendekati batas budget';

  @override
  String get close => 'Tutup';

  @override
  String get geminiApiSetupTitle => 'Pengaturan API Gemini';

  @override
  String get geminiApiSetupDescription =>
      'Untuk menggunakan fitur fitur kami, Anda perlu mengatur API Gemini:';

  @override
  String get step1 => 'Kunjungi Google AI Studio';

  @override
  String get step1Description => 'https://aistudio.google.com';

  @override
  String get step2 => 'Buat akun atau login';

  @override
  String get step2Description => 'Gunakan akun Google Anda';

  @override
  String get step3 => 'Buat API Key baru';

  @override
  String get step3Description => 'Klik \"Create API Key\"';

  @override
  String get step4 => 'Salin API Key';

  @override
  String get step4Description => 'Simpan dengan aman';

  @override
  String get step5 => 'Masukkan ke aplikasi';

  @override
  String get step5Description => 'Paste di field API Key';

  @override
  String get geminiApiKey => 'API Key Gemini';

  @override
  String get enterYourApiKey => 'Masukkan API Key Anda...';

  @override
  String get howToUseJournalingAi => '❓ Cara menggunakan journaling AI?';

  @override
  String get howToUseJournalingAiAnswer =>
      'Tulis pengeluaran Anda dalam bahasa natural, AI akan memproses dan mengkategorikan secara otomatis';

  @override
  String get howToSetupGeminiApi => '🔑 Bagaimana cara mengatur API Gemini?';

  @override
  String get howToSetupGeminiApiAnswer =>
      'Kunjungi Google AI Studio, buat API Key, lalu masukkan ke pengaturan aplikasi';

  @override
  String get howToViewFinancialReports => '📊 Cara melihat laporan keuangan?';

  @override
  String get howToViewFinancialReportsAnswer =>
      'Buka menu Laporan untuk melihat analisis pengeluaran bulanan dan kategori';

  @override
  String get howToManageNotifications => '🔔 Mengatur notifikasi?';

  @override
  String get howToManageNotificationsAnswer =>
      'Masuk ke Pengaturan Notifikasi untuk mengatur pengingat harian dan mingguan';

  @override
  String get appUsageTips => '💡 Tips menggunakan aplikasi?';

  @override
  String get appUsageTipsAnswer =>
      'Catat pengeluaran secara rutin, gunakan fitur AI untuk kategorisasi otomatis';

  @override
  String get selectProfilePhoto => 'Pilih Foto Profil';

  @override
  String get camera => 'Kamera';

  @override
  String get gallery => 'Galeri';

  @override
  String get logoutFromApp => 'Keluar dari aplikasi';

  @override
  String get dashboardContent => 'Konten Dashboard';

  @override
  String get categoryFoodBeverage => 'Makanan & Minuman';

  @override
  String get categoryTransportation => 'Transportasi';

  @override
  String get categoryShopping => 'Belanja';

  @override
  String get categoryBills => 'Tagihan';

  @override
  String get categoryEntertainment => 'Hiburan';

  @override
  String get categoryHealth => 'Kesehatan';

  @override
  String get categoryEducation => 'Pendidikan';

  @override
  String get categoryOther => 'Lainnya';

  @override
  String get categoryTitle => 'Kategori';

  @override
  String get selectCategory => 'Pilih Kategori';

  @override
  String get recordFinanceNow => 'Catat Keuangan\nSekarang Yuk!';

  @override
  String get nominalLabel => 'Nominal';

  @override
  String get nominalHint => 'Contoh: Rp 1.000.000';

  @override
  String get nominalEmptyValidation => 'Nominal tidak boleh kosong';

  @override
  String get nominalInvalidValidation => 'Nominal tidak valid';

  @override
  String get nominalEstimationHint =>
      'Estimasi nominal lebih penting dibanding detail rinci nominal';

  @override
  String get dateLabel => 'Tanggal';

  @override
  String get dateEmptyValidation => 'Tanggal tidak boleh kosong';

  @override
  String get descriptionLabel => 'Deskripsi (Opsional)';

  @override
  String get descriptionHint => 'Contoh: Beli makan siang';

  @override
  String get manualInputTitle => 'Input Manual';

  @override
  String get backButton => 'Kembali';

  @override
  String get continueButton => 'Lanjutkan';

  @override
  String get selectCategorySnackbar => 'Pilih kategori terlebih dahulu.';

  @override
  String get journalInputTitle => 'Input Jurnal';

  @override
  String get journalInputHint =>
      'Tuliskan pengeluaran atau pemasukanmu hari ini, contoh: \"Makan siang di kantin Rp 25.000, beli buku Rp 50.000\"';

  @override
  String get journalInputCardTitle => 'Tulis Jurnal Keuanganmu\ndi sini!';

  @override
  String get confirmButton => 'Konfirmasi';

  @override
  String failedToParseExpense(Object error) {
    return 'Gagal memproses pengeluaran: $error';
  }

  @override
  String get enterJournalEntryBeforeConfirming =>
      'Mohon masukkan entri jurnal sebelum mengkonfirmasi.';

  @override
  String get recordFinanceToday => 'Yuk ~ catat!';

  @override
  String get rememberIt => 'Seingat kamu ya!';

  @override
  String get notAvailable => 'N/A';

  @override
  String get invalidDateFormat => 'Format Tanggal Tidak Valid';

  @override
  String get invalidDate => 'Tanggal Tidak Valid';

  @override
  String get inputDetailsTitle => 'Rincian Input';

  @override
  String get dateLabelColon => 'Tanggal:';

  @override
  String get amountLabelColon => 'Jumlah:';

  @override
  String get currencyIDR => 'IDR';

  @override
  String get categoryLabelColon => 'Kategori:';

  @override
  String get descriptionLabelColon => 'Deskripsi:';

  @override
  String get paymentMethodLabelColon => 'Metode Pembayaran:';

  @override
  String get addMoreButton => 'Tambah Lagi';

  @override
  String get originalInputLabel => 'Input Asli:';

  @override
  String get finlogAppTitle => 'FinLog';

  @override
  String get transactionsToPdfTitle => 'Transaksi ke PDF';

  @override
  String get downloadTransactionsPdfSubtitle => 'Unduh Transaksi menjadi PDF';

  @override
  String get noBillDataAvailable => 'Tidak ada data tagihan tersedia.';

  @override
  String get loadingTransactionsData => 'Memuat data transaksi...';

  @override
  String get readingItem => 'Membaca Item..';

  @override
  String get pleaseWait => 'Mohon tunggu sebentar.';

  @override
  String get offlineModeTitle => 'Anda sedang \nmode offline';

  @override
  String get redirectingToManualInput => 'mengalihkan ke \n pencatatan manual';

  @override
  String get operationSuccessfulTitle => 'Operasi Berhasil\nDilakukan';

  @override
  String get redirectingToHomePage => 'mengalihkan ke \n halaman utama';

  @override
  String get underDevelopmentTitle => 'Halaman ini\nsedang dalam\nPengembangan';

  @override
  String expenditureMonthYear(Object month, Object year) {
    return 'Pengeluaran $month $year';
  }

  @override
  String get monthJanuary => 'Januari';

  @override
  String get monthFebruary => 'Februari';

  @override
  String get monthMarch => 'Maret';

  @override
  String get monthApril => 'April';

  @override
  String get monthMay => 'Mei';

  @override
  String get monthJune => 'Juni';

  @override
  String get monthJuly => 'Juli';

  @override
  String get monthAugust => 'Agustus';

  @override
  String get monthSeptember => 'September';

  @override
  String get monthOctober => 'Oktober';

  @override
  String get monthNovember => 'November';

  @override
  String get monthDecember => 'Desember';

  @override
  String errorOccurred(Object error) {
    return 'Terjadi kesalahan: $error';
  }

  @override
  String get scanBill => 'Pindai Tagihan';

  @override
  String get expenditureTitle => 'Pengeluaran';

  @override
  String get expenditureIncreaseMessage => 'Pengeluaran kamu naik 3% nih';

  @override
  String get reviewFinancialDashboard =>
      'Tinjau keuangan kamu di dashboard rinci';

  @override
  String get viewDashboardButton => 'Lihat Dashboard';

  @override
  String get home => 'Beranda';

  @override
  String get inputExpense => 'Input Pengeluaran';

  @override
  String get scan => 'Pindai';

  @override
  String get history => 'Riwayat';

  @override
  String get profile => 'Profil';

  @override
  String get letsTakeNoteToday => '~yuk catat hari ini!';

  @override
  String get billVerificationTitle => 'Verifikasi Tagihan';

  @override
  String get scannedItemsTitle => 'Item yang Terpindai';

  @override
  String get ensureAllItemsCorrect =>
      'Pastikan semua item sudah terbaca dengan benar';

  @override
  String get subtotalLabel => 'Subtotal';

  @override
  String get taxLabel => 'Pajak';

  @override
  String get discountLabel => 'Diskon';

  @override
  String get otherLabel => 'Lainnya';

  @override
  String get totalAmountLabel => 'Jumlah Total';

  @override
  String transactionDaysAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari data transaksi tersedia',
      one: '1 hari data transaksi tersedia',
    );
    return '$_temp0';
  }

  @override
  String get exportAllToPdf => 'Ekspor Semua ke PDF';
}
