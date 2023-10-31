import 'package:enif/enif.dart';
import 'package:enif/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// AppPreferences? appPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnifController.setBusinessId(
      "8a64243b-e0b5-49eb-ac76-792fb28d82555b3f023b-11e0-489e-8a4a-b0c6d3fd28ef",
      Env.dev);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  EnifController.setUser(EnifUserParams(
      firstName: "Sade",
      lastName: "Oluchi",
      phoneNo: "0803000000",
      email: "sade@enif.com"));
  // appPreferences = await AppPreferences.getInstance();
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
