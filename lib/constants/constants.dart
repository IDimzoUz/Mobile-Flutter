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
  static const String verify = "verify";
  static const String fcmToken = "fcmToken";


}

sealed class Urls {
  Urls._();

  static const String login = "/api/auth/send-code";
  static const String verify = "/api/auth/verify";
  static const String categories = "/api/categories";
  static const String contractTemplatesCategory = "/api/contract-templates/category";
  static const String contractTemplates = "/api/contracts/templates";
  static const String profile = "/api/users/profile";
  static const String editPhone = "/api/users/phone";
  static const String usersMe = "/api/users/me";
  static const String usersContracts = "/api/user/contracts";
  static const String usersContractsMyCreated = "/api/user/contracts/my-created";
  static const String usersContractsForMe = "/api/user/contracts/for-me";
  static const String usersContractsPaymentStatus = "/api/user/contracts";
  static const String usersSearch = "/api/users/search";
  static const String notificationsUnreadCount = "/api/notifications/unread-count";
  static const String notificationsUnread = "/api/notifications/unread";
  static const String notifications = "/api/notifications";
  static const String news = "/api/news";
  static const String premiumFcmToken = "/api/premium/fcm-token";
  static const String spendingByProduct = "/api/user/spending/by-product";





  // MARK: MyID EndPoints
  static const String myIDAccessToken = "/api/v1/oauth2/access-token";
  static const String myIDUsersMe = "/api/v1/users/me";

}

sealed class Slugs {
  Slugs._();

  static const String patients = "/patients";
}

sealed class DatabaseKeys {
  DatabaseKeys._();

  static const String myIDClientId = "idimzo_sdk-e2PanrcJgk74CaAL3xIjBbsMkPJFKERlNDQvP8AV";
  static const String myIDClientSecret = "3Cjke3uRHOsR8AL4nWfksSKSorSUQH9ZuuQfINMzYwDDaB4v1MnWILlXhcF7468trCxqken6rntQmn7YxGu2KMp2Cj0tdvw1Lw1W";
  static const String myIDClientHashId = "2a67a6e0-19d9-4f8f-80fc-cd482a820723";
  static const String myIDClientHash = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxWTEjiwm/++Jeo7paGwhXtpgV+k770aW1dyzUoWTZJoWNOpQuFVdN29wk0i+POtJScQXrgi3h83g8ljWhjsPDhWFhmdf17i1dEHMo/iExATwNBNL4nxGXD2W0PpsJyf9PBR502IOCXDjsBmIOG6npI7JVCxXb7H3IajcN4+c44u2fQ0S8GY1UMavmMjVQE0LSvmOnhZQ6zgSCPPgSL22sX+Fq5KPpfKco2brfgyibRt4SzVZHUWlzSqGXs9pIpjHkS7MXNVMpSe3RndAPIec8+diL2yIV3LrNuXrtM4L+6RB5ciR7rWKj29HFFfydBR/MjvE0pXJ5OdBJrcz/Y+8XQIDAQAB";

}

