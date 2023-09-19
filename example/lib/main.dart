import 'package:enif/enif.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// AppPreferences? appPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnifController.setBusinessId(
      "183dcb2f-73f6-47c7-91c0-720b38bca297fb69b188-f1b4-47bc-abd4-bc5e47ea83fe"
      // "438b9f5c-cb40-4861-95d0-0fcdc24ccb624f518a56-964d-45f1-bc68-ba1191d62b78"
      );
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
