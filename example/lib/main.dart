import 'package:enif/enif.dart';
import 'package:enif/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// AppPreferences? appPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnifController.setBusinessId(
    // "a53dcdb3-fcf9-4beb-a0e9-25080b34eb67af946561-80a1-473f-950e-95025771b410",
      "4aec970a-ad32-433d-afc4-c664d6b7e3765d1a0f2c-5947-4510-82d6-5ce907e688f4",
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
