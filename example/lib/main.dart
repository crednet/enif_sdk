import 'package:enif/enif.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  EnifController.logout();
  EnifController.setBusinessId(
      "3421a016-ef8b-4c1d-9ced-34147e11e158bfc90848-721c-40d4-b535-b1ef7054f145",
      Env.dev);
  // EnifController.setUser(EnifUserParams(
  //   firstName: "Sade9",
  //   lastName: "Oluchi0",
  //   phoneNo: "080300000208",
  //   // email:
  //   // "sade@enif.com"
  // ));

  EnifController.setDeviceToken(
      "3421a016-ef8b-4c1d-9ced-34147e11e158bfc90848-721c-40d4-b535-b1ef7054f145");
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
            theme: ThemeData.light(useMaterial3: true).copyWith(
                primaryColor: const Color(0xff6D2EFC),
                scaffoldBackgroundColor: const Color(0xffF4F2F8)),
            darkTheme: ThemeData.dark(useMaterial3: true)
                .copyWith(primaryColor: const Color(0xff6D2EFC)),
            home: const EnifHome(
                showBackButton: false,
                inputDecorationTheme: InputDecorationTheme())));
  }
}
