import 'package:enif/enif.dart';
import 'package:enif/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:mobile/utils/preference_manager/preference_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnifController.setBusinessId(
      "3421a016-ef8b-4c1d-9ced-34147e11e158bfc90848-721c-40d4-b535-b1ef7054f145",
      Env.dev);

  EnifController.setUser(EnifUserParams(
      firstName: "Sade",
      lastName: "Oluchi",
      phoneNo: "0803000000",
      email: "sade@enif.com"));
  
  await EnifController.setDeviceToken(
      "cft5xLfER0i4PeRZEupqqp:APA91bFmWW0LuTYF7dbAm7bxEMUGkUWE8hKilLA6HTdFHu-vCTQeYCRunXkPJBnzLk3Bh27VRGCIkM3M2U7SmQHsbkK7W3Kns4kQSoG6ZhSQHU2ihjcpFSASBxeoZ3Ff6cJSGu4FIsRC");
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
  

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Enif Chat Bot',
          themeMode: ThemeMode.system,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const EnifHome(showBackButton: false),
        ));
  }
}

// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   if (kDebugMode) {
//     print("Handling a background message: ${message.messageId}");
//   }
// }

// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   void handleMessage(RemoteMessage message) {
//     // navigatorkey.currentState?.pushNamed(routeName);
//   }

//   Future initPushNotification() async {
//     await _firebaseMessaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     _firebaseMessaging.getInitialMessage();
//     // .then(handleMessage)
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }

//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final fCMToken = await _firebaseMessaging.getToken();
//     if (fCMToken != null) {
//       PreferenceManager.setDeviceToken(fCMToken);
//     }
//     if (kDebugMode) {
//       print('FCM Token:: $fCMToken');
//       FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//       initPushNotification();
//     }
//   }
// }

