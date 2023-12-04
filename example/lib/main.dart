import 'package:enif/enif.dart';
import 'package:enif/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  EnifController.setBusinessId(
     "2ff104de-d77f-4933-920f-790cb7a8ea28430948ca-f9f8-4fbb-9b1d-1aea97374a67",
      Env.dev);

  EnifController.setUser(EnifUserParams(
      firstName: "Sade",
      lastName: "Oluchi",
      phoneNo: "0803000000",
      email: "sade@enif.com"));
  
  await EnifController.setDeviceToken(
      "cft5xLfER0i4PeRZEupqqp:APA91bFmWW0LuTYF7dbAm7bxEMUGkUWE8hKilLA6HTdFHu-vCTQeYCRunXkPJBnzLk3Bh27VRGCIkM3M2U7SmQHsbkK7W3Kns4kQSoG6ZhSQHU2ihjcpFSASBxeoZ3Ff6cJSGu4FIsRC"
      );
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
