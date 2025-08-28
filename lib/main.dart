import "dart:developer";
import "dart:io";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/app.dart";
import "package:imzo/app_options.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/native_splash/flutter_native_splash.dart";
import "package:imzo/firebase_options.dart";
import "package:imzo/injector_container.dart" as di;
import "package:imzo/router/app_routes.dart";
import "package:imzo/services/notification_service.dart";


void main() async {
  /// flutter_native_splash
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Splash screen ni saqlab qolish
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  // 3. Firebase ni ishga tushirish (NotificationService dan OLDIN)
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 4. Notification service ni ishga tushirish
  await NotificationService.initialize();
  // Background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //
  // FlutterNativeSplash.preserve(widgetsBinding: binding);
  //
  // // FCM Token olish
  // String? token = await FirebaseMessaging.instance.getToken();
  // log("FCM TOKEN: $token");
  //
  //
  // await NotificationService.initialize();

  // await Future.wait(
  //   <Future<void>>[
  //     /// set orientation
  //     SystemChrome.setPreferredOrientations(
  //       <DeviceOrientation>[DeviceOrientation.portraitUp],
  //     ),
  //     // 3. Firebase ni ishga tushirish (NotificationService dan OLDIN)
  //     Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  //     /// notification initialize
  //     // NotificationService.initialize(),
  //
  //   ],
  // );





  WidgetsFlutterBinding.ensureInitialized();
  /// bloc logger
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  await di.init();

  /// global CERTIFICATE_VERIFY_FAILEd_KEY
  HttpOverrides.global = _HttpOverrides();
  runApp(
    ModelBinding(
      initialModel: AppOptions(
        themeMode: ThemeMode.light,
        locale: Locale(localSource.locale),
      ),
      child: const App(),
    ),
  );
  FlutterNativeSplash.remove();
}

class _HttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (_, __, ___) => true;
}

// Background message handler function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Background message: ${message.messageId}");
  // Backgroundda notification ko'rsatish
}
/// flutter pub run flutter_launcher_icons:main
/// flutter run -d windows
/// flutter build apk --release
/// flutter build apk --split-per-abi
/// flutter build appbundle --release
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// flutter pub ipa
/// dart fix --apply
