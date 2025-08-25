// import "dart:developer";
// import "package:flutter/material.dart";
// import "package:go_router/go_router.dart";
// import "package:imzo/router/app_routes.dart";
// import "dart:convert";
// import "dart:io";
// // import "package:firebase_remote_config/firebase_remote_config.dart";
// import "package:imzo/core/extension/extension.dart";
//
// sealed class RemoteConfigService {
//   RemoteConfigService._();
//
//   static FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
//
//   static Future<(AppUpdate, String, String)> isCallCheckAppVersion(BuildContext context) async {
//     if (await networkInfo.isConnected) {
//       try {
//         // await remoteConfig.setConfigSettings(
//         //   RemoteConfigSettings(
//         //     fetchTimeout: const Duration(seconds: 10),
//         //     minimumFetchInterval: const Duration(hours: 1),
//         //   ),
//         // );
//         await remoteConfig.fetchAndActivate();
//
//         /// ca certificate
//         // await localSource.setCertificate(
//         //   remoteConfig.getString('certificate${Constants.environment.name}'),
//         // );
//         // RemoteConfigValue? version;
//         if (Platform.isAndroid) {
//           version = remoteConfig.getAll()[TargetPlatform.android.name];
//         } else {
//           version = remoteConfig.getAll()[TargetPlatform.iOS.name];
//         }
//         print("VERSION: ${version?.source.index}");
//         final isNotLast = isNotLastVersion(packageInfo.version, version);
//         return isNotLast;
//       } on Exception catch (e, s) {
//         log('Firebase initialize error: $e $s');
//         return (AppUpdate.none, '', '');
//       }
//     } else {
//       // ignore: use_build_context_synchronously
//       return context.pushNamed(Routes.noInternet).then((value) => isCallCheckAppVersion(context),
//       );
//     }
//   }
//
//   static (AppUpdate, String, String) isNotLastVersion(String appVersion, RemoteConfigValue? employeeVersion) {
//     if (employeeVersion == null) return (AppUpdate.none, '', '');
//     final Map<String, dynamic> employeeVersionMap = jsonDecode(employeeVersion.asString());
//     final String version = employeeVersionMap['version'];
//     final bool isForce = employeeVersionMap['is_force'];
//     final int employee = version.replaceAll('.', '').toVersion;
//     final int package = appVersion.replaceAll('.', '').toVersion;
//     print("V: $version");
//     print("V: $package");
//     if (package < employee && isForce) {
//       return (AppUpdate.forceUpdate, appVersion, version);
//     }
//     if (package < employee && !isForce) {
//       return (AppUpdate.softUpdate, appVersion, version);
//     }
//     print("VERSION 1: $appVersion");
//     return (AppUpdate.none, '', '');
//   }
// }
//
// enum AppUpdate { forceUpdate, softUpdate, none }