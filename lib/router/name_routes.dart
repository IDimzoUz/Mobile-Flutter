part of "app_routes.dart";

sealed class Routes { Routes._();

  static const String initial = "/";

  /// Auth
  static const String auth = "/auth";
  static const String explore = "/explore";
  static const String languagePage = "/languagePage";
  static const String otpPage = "/otpPage";
  static const String publicOfferPage = "/publicOfferPage";


  /// Profile
  static const String history = "/history";
  static const String selectLangDocs = "/selectLangDocs";
  static const String formalizationPage = "/formalizationPage";
  static const String historyBalansPage = "/historyBalansPage";
  static const String editProfilePage = "/editProfilePage";
  static const String identificationPage = "/identificationPage";
  static const String notificationPage = "/notificationPage";
  static const String historyDetailPage = "/historyDetailPage";
  static const String docsPage = "/docsPage";


  /// internet connection
  static const String noInternet = "/no-internet";

}
