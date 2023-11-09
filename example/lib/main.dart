import 'package:enif/enif.dart';
import 'package:enif/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnifController.setBusinessId(
    "68121276-18e1-431a-908d-eee9b31e4cd6fd2da249-49d5-40ce-a83b-610a639eca80",
      Env.dev);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  EnifController.setUser(EnifUserParams(
      firstName: "Sade",
      lastName: "Oluchi",
      phoneNo: "0803000000",
      email: "sade@enif.com"));
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
