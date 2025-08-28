// import "dart:async";
// import "dart:developer";
// import "dart:io";
// import "package:firebase_core/firebase_core.dart";
// import "package:firebase_messaging/firebase_messaging.dart";
// import "package:flutter/cupertino.dart";
// import "package:flutter_local_notifications/flutter_local_notifications.dart";
// import "package:get_it/get_it.dart";
// import "package:imzo/core/local_source/local_source.dart";
// import "package:imzo/firebase_options.dart";
// import "package:imzo/router/app_routes.dart";
//
// // O'zgaruvchilarni to'g'ridan-to'g'ri ishga tushirish
// AndroidNotificationChannel channel = const AndroidNotificationChannel(
//   'high_importance_channel',
//   'High Importance Notifications',
//   description: 'This channel is used for important notifications.',
//   importance: Importance.high,
// );
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// InitializationSettings initializationSettings = const InitializationSettings(
//   android: AndroidInitializationSettings("@mipmap/ic_launcher"),
//   iOS: DarwinInitializationSettings(),
// );
//
// sealed class NotificationService {
//   const NotificationService._();
//
//   static Future<void> initialize() async {
//     try {
//       // Firebase'ni ishga tushirish
//       if (Firebase.apps.isEmpty) {
//         await Firebase.initializeApp(
//           name: "IDIMZO",
//           options: DefaultFirebaseOptions.currentPlatform,
//         );
//       } else {
//         Firebase.app(); // Mavjud app'ni olish
//       }
//
//       if (Platform.isIOS || Platform.isMacOS) {
//         final String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//         if (apnsToken != null) {
//           // ignore: unawaited_futures
//           FirebaseMessaging.instance.getAPNSToken().then((String? token) => log('FCM TOKEN: $token'));
//         }
//       } else {
//         print("Android device detected");
//         // ignore: unawaited_futures
//         FirebaseMessaging.instance.getToken().then((String? token) {
//           log('FCM TOKEN: $token');
//         });
//       }
//
//       // Notification sozlamalarini ishga tushirish
//       await _setupNotifications();
//     } on Exception catch (e, s) {
//       log('Firebase initialize error: $e $s');
//     }
//   }
//
//   // Barcha notification sozlamalarini bir joyda ishga tushirish
//   static Future<void> _setupNotifications() async {
//     try {
//       // Foreground notification sozlamalari
//       if (Platform.isIOS || Platform.isAndroid) {
//         await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//       }
//
//       // Notification channel'ni ro'yxatdan o'tkazish
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//
//       // Notification plugin'ni ishga tushirish
//       await flutterLocalNotificationsPlugin.initialize(
//         initializationSettings,
//         onDidReceiveNotificationResponse: (NotificationResponse response) async {
//           debugPrint('Notification tapped: $response');
//         },
//       );
//
//       // Notification handlers
//       FirebaseMessaging.onMessage.listen(showFlutterNotification);
//       backgroundNotification();
//       await terminateNotification();
//
//       // Android uchun ruxsatlarni so'rash
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//           ?.requestNotificationsPermission();
//     } catch (e) {
//       log('Error setting up notifications: $e');
//     }
//   }
//
//   static void showFlutterNotification(RemoteMessage message) {
//     if (message.data.isNotEmpty) {
//       unawaited(
//         flutterLocalNotificationsPlugin.show(
//           message.hashCode,
//           message.data['title'],
//           message.data['body'],
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               channelDescription: channel.description,
//               styleInformation: BigTextStyleInformation(
//                 message.data['body'] ?? '',
//                 contentTitle: message.data['title'],
//               ),
//               icon: '@mipmap/ic_launcher',
//               priority: Priority.high,
//               importance: Importance.high,
//               visibility: NotificationVisibility.public,
//             ),
//             iOS: const DarwinNotificationDetails(
//               presentAlert: true,
//               presentBadge: true,
//               presentSound: true,
//               sound: 'default',
//             ),
//           ),
//           payload: message.data['route'],
//         ),
//       );
//     }
//   }
//
//   static Future<void> foregroundNotification() async {
//     FirebaseMessaging.onMessage.listen(showFlutterNotification);
//
//     /// when tapped
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) async {
//         debugPrint('foreground notification tapped');
//         debugPrint('$response');
//         // chuck.showInspector();
//       },
//     );
//   }
//
//   static void backgroundNotification() {
//     FirebaseMessaging.onMessageOpenedApp.listen(
//           (RemoteMessage message) {
//         debugPrint('A new onMessageOpenedApp event was published!');
//         showFlutterNotification(message);
//       },
//     );
//   }
//
//   static Future<void> terminateNotification() async {
//     final RemoteMessage? remoteMessage =
//     await FirebaseMessaging.instance.getInitialMessage();
//     if (remoteMessage == null) {
//       FirebaseMessaging.onBackgroundMessage(
//         _firebaseMessagingBackgroundHandler,
//       );
//     } else {
//       showFlutterNotification(remoteMessage);
//     }
//   }
// }
//
// @pragma("vm:entry-point")
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await NotificationService._setupNotifications();
//   NotificationService.showFlutterNotification(message);
// }









import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:imzo/firebase_options.dart';
import 'package:imzo/router/app_routes.dart';

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
InitializationSettings initializationSettings = const InitializationSettings(
  android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  iOS: DarwinInitializationSettings(),
  macOS: DarwinInitializationSettings(),
);

sealed class NotificationService {
  const NotificationService._();


  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      if (Platform.isIOS || Platform.isMacOS) {
        final String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        if (apnsToken != null) {
          // ignore: unawaited_futures
          FirebaseMessaging.instance.getAPNSToken().then((String? token) => log('FCM TOKEN: $token'));
        }
      } else {
        // ignore: unawaited_futures
        FirebaseMessaging.instance.getToken().then((String? token) => log('FCM TOKEN: $token'));
      }
    } on Exception catch (e, s) {
      log('Firebase initialize error: $e $s');
    }
    await setupFlutterNotifications();
    await foregroundNotification();
    backgroundNotification();
    await terminateNotification();
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  static Future<void> setupFlutterNotifications() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );
    if (Platform.isIOS || Platform.isAndroid) {
      await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static void showFlutterNotification(RemoteMessage message) {
    print("MESSAGE => ${message.data}");
    print("MESSAGE DATA: ${message.data}");
    print("NOTIFICATION TITLE: ${message.notification?.title}");
    print("NOTIFICATION BODY: ${message.notification?.body}");
    if (message.data.isNotEmpty && localSource.accessToken.isNotEmpty) {
      flutterLocalNotificationsPlugin.show(
        message.hashCode,
        message.data['title'],
        message.data['body'],
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            styleInformation: BigTextStyleInformation(
              message.data['body'] ?? '',
              contentTitle: message.data['title'],
            ),
            icon: '@mipmap/ic_launcher',
            priority: Priority.max,
            importance: Importance.max,
            visibility: NotificationVisibility.secret,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            sound: 'default',

          ),
        ),
        payload: message.data['route'],
      );
    }



  }

  static Future<void> foregroundNotification() async {
    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    /// when tapped
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        debugPrint('foreground notification tapped');
        debugPrint('$response');
        // chuck.showInspector();
      },
    );
  }

  static void backgroundNotification() {
    FirebaseMessaging.onMessageOpenedApp.listen(
          (RemoteMessage message) {
        debugPrint('A new onMessageOpenedApp event was published!');
        showFlutterNotification(message);
      },
    );
  }

  static Future<void> terminateNotification() async {
    final RemoteMessage? remoteMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (remoteMessage == null) {
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );
    } else {
      showFlutterNotification(remoteMessage);
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.setupFlutterNotifications();
  NotificationService.showFlutterNotification(message);
}







// import 'dart:async';
// import 'dart:io';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:imzo/firebase_options.dart';
//
// // Firebase options faylini import qilish kerak (o'zingizning faylingizga moslashtiring)
// // import 'firebase_options.dart';
//
// late AndroidNotificationChannel channel;
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
// const InitializationSettings initializationSettings = InitializationSettings(
//   android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
//   iOS: DarwinInitializationSettings(
//     requestAlertPermission: true,
//     requestBadgePermission: true,
//     requestSoundPermission: true,
//   ),
//   macOS: DarwinInitializationSettings(
//     requestAlertPermission: true,
//     requestBadgePermission: true,
//     requestSoundPermission: true,
//   ),
// );
//
// class NotificationService {
//   const NotificationService._();
//
//   static Future<void> initialize() async {
//     try {
//       await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//
//       // Tokenlarni olish va log qilish
//       if (Platform.isIOS || Platform.isMacOS) {
//         final String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//         debugPrint('FCM Token: $apnsToken');
//       } else {
//         final String? token = await FirebaseMessaging.instance.getToken();
//         debugPrint('FCM Token: $token');
//       }
//     } on Exception catch (e, s) {
//       debugPrint('Firebase initialize error: $e $s');
//     }
//
//     await setupFlutterNotifications();
//     await foregroundNotification();
//     backgroundNotification();
//     await terminateNotification();
//
//     // Android uchun notification permission so'rash
//     if (Platform.isAndroid) {
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//           ?.requestNotificationsPermission();
//     }
//   }
//
//   static Future<void> setupFlutterNotifications() async {
//     // iOS va macOS uchun notification sozlamalari
//     if (Platform.isIOS || Platform.isMacOS) {
//       await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//
//       // iOS uchun permission so'rash
//       final settings = await FirebaseMessaging.instance.requestPermission(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//
//       debugPrint('Notification permission granted: ${settings.authorizationStatus}');
//     }
//
//     // Android notification channel yaratish
//     channel = const AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       description: 'This channel is used for important notifications.',
//       importance: Importance.high,
//       playSound: true,
//       enableVibration: true,
//       showBadge: true,
//     );
//
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//     // Flutter local notifications ni ishga tushirish
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) {
//         debugPrint('Notification tapped: ${response.payload}');
//         // Notification bosilganda bajariladigan kod
//       },
//     );
//
//     // Android uchun notification channel yaratish
//     if (Platform.isAndroid) {
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//     }
//   }
//
//   static void showFlutterNotification(RemoteMessage message) {
//     debugPrint("MESSAGE DATA => ${message.data}");
//     debugPrint("MESSAGE NOTIFICATION => ${message.notification}");
//
//     final String title = message.notification?.title ?? message.data['title'] ?? 'No Title';
//     final String body = message.notification?.body ?? message.data['body'] ?? 'No Body';
//     final String? route = message.data['route'];
//
//     flutterLocalNotificationsPlugin.show(
//       message.hashCode,
//       title,
//       body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           channelDescription: channel.description,
//           styleInformation: BigTextStyleInformation(
//             body,
//             contentTitle: title,
//           ),
//           icon: '@mipmap/ic_launcher',
//           priority: Priority.high,
//           importance: Importance.high,
//           visibility: NotificationVisibility.public,
//           playSound: true,
//           enableVibration: true,
//         ),
//         iOS: const DarwinNotificationDetails(
//           presentAlert: true,
//           presentBadge: true,
//           presentSound: true,
//           sound: 'default',
//         ),
//       ),
//       payload: route,
//     );
//   }
//
//   static Future<void> foregroundNotification() async {
//     FirebaseMessaging.onMessage.listen(showFlutterNotification);
//   }
//
//   static void backgroundNotification() {
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       debugPrint('App opened from background notification');
//       showFlutterNotification(message);
//       // Qo'shimcha: notification bosilganda specific screen ga o'tish
//     });
//   }
//
//   static Future<void> terminateNotification() async {
//     final RemoteMessage? remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (remoteMessage != null) {
//       showFlutterNotification(remoteMessage);
//       // Qo'shimcha: app ishga tushganda notification bosilgan bo'lsa, specific screen ga o'tish
//     }
//
//     // Background message handler ni o'rnatish
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }
// }
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//
//   // Local notifications plugin ni backgroundda ishga tushirish
//   WidgetsFlutterBinding.ensureInitialized();
//
//   final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
//   final AndroidNotificationChannel androidChannel = const AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     description: 'This channel is used for important notifications.',
//     importance: Importance.high,
//   );
//
//   await notificationsPlugin.initialize(
//     const InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//       macOS: DarwinInitializationSettings(),
//     ),
//   );
//
//   if (Platform.isAndroid) {
//     await notificationsPlugin
//         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(androidChannel);
//   }
//
//   // Backgroundda notification ko'rsatish
//   final String title = message.notification?.title ?? message.data['title'] ?? 'No Title';
//   final String body = message.notification?.body ?? message.data['body'] ?? 'No Body';
//   final String? route = message.data['route'];
//
//   await notificationsPlugin.show(
//     message.hashCode,
//     title,
//     body,
//     NotificationDetails(
//       android: AndroidNotificationDetails(
//         androidChannel.id,
//         androidChannel.name,
//         channelDescription: androidChannel.description,
//         icon: '@mipmap/ic_launcher',
//         priority: Priority.high,
//         importance: Importance.high,
//       ),
//       iOS: const DarwinNotificationDetails(
//         presentAlert: true,
//         presentBadge: true,
//         presentSound: true,
//       ),
//     ),
//     payload: route,
//   );
// }