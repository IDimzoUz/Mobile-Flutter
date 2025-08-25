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
// // // O'zgaruvchilarni to'g'ridan-to'g'ri ishga tushirish
// // AndroidNotificationChannel channel = const AndroidNotificationChannel(
// //   'high_importance_channel',
// //   'High Importance Notifications',
// //   description: 'This channel is used for important notifications.',
// //   importance: Importance.high,
// // );
// // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// // InitializationSettings initializationSettings = const InitializationSettings(
// //   android: AndroidInitializationSettings("@mipmap/ic_launcher"),
// //   iOS: DarwinInitializationSettings(),
// // );
//
// sealed class NotificationService {
//   const NotificationService._();
//
//   static Future<void> initialize() async {
//     try {
//       // Firebase'ni ishga tushirish
//       if (Firebase.apps.isEmpty) {
//         await Firebase.initializeApp(
//           name: "Puller",
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
//           FirebaseMessaging.instance.getAPNSToken().then((String? token) => log('FCM TOKEN: $token'),
//           );
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
//   // await NotificationService.setupFlutterNotifications();
//   NotificationService.showFlutterNotification(message);
// }
