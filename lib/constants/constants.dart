import "dart:io";

sealed class Constants {
  Constants._();

  static const String baseUrl = "https://api.idimzo.uz";

  static final String appLink = Platform.isIOS
      ? ""
      : "";
}


class Validations {
  Validations._();

  static const String emailEmpty = "Email cannot be empty";
  static const String notEmail = "This is not email";
  static const String passwordEmpty = "Password cannot be empty";
  static const String passwordShort = "Password too short";
  static const String passwordLong = "Password too long";
  static const String firstnameEmpty = "Firstname cannot be empty";
  static const String firstnameShort = "Firstname too short";
  static const String firstnameLong = "Firstname too long";
  static const String lastnameEmpty = "Last name cannot be empty";
  static const String lastnameShort = "Lastname too short";
  static const String lastnameLong = "Lastname too long";
  static const String passwordNotMatch = "Passwords do not match";
  static const String internetFailure = "No Internet";
  static const String somethingWentWrong = "Something went wrong!";
}





sealed class AppKeys {
  AppKeys._();

  static const String locale = "locale";
  static const String hasProfile = "has_profile";
  static const String accessToken = "access_token";
  static const String refreshToken = "refresh_token";
  static const String firstname = "firstname";
  static const String lastname = "lastname";
  static const String email = "email";
  static const String password = "password";
  static const String themeMode = "theme_mode";
  static const String hasOnboarding = "has_onboarding";
  static const String language = "language";
  static const String phoneNumber = "phoneNumber";

}

sealed class Urls {
  Urls._();

  static const String login = "/api/auth/send-code";
  static const String verify = "/api/auth/verify";
  static const String categories = "/api/categories";

}

sealed class Slugs {
  Slugs._();

  static const String patients = "/patients";
}

sealed class DatabaseKeys {
  DatabaseKeys._();

  static const String categoryList = "category_list/";
  static const String guidList = "guid_list/";
  static const String article = "article/";
}

