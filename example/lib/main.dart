import 'package:enif/bloc/get_user_chats_bloc.dart';
import 'package:enif/bloc/send_chat_bloc.dart';
import 'package:enif/enif.dart';
import 'package:enif/models/enif_user_params.dart';
import 'package:enif/modules/home/views/enif_home.dart';
import 'package:enif/service/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// AppPreferences? appPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnifController.setBusinessId(
      "438b9f5c-cb40-4861-95d0-0fcdc24ccb624f518a56-964d-45f1-bc68-ba1191d62b78");
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
    return MultiBlocProvider(
        providers: [
          BlocProvider<GetUserChatBloc>(
            create: (context) => GetUserChatBloc(ApiProvider()),
          ),
          BlocProvider<SendChatBloc>(
            create: (context) => SendChatBloc(ApiProvider()),
          ),
          // BlocProvider<NewChatBloc>(
          //   create: (context) => NewChatBloc(ApiProvider()),
          // ),
          // BlocProvider<GetFaqBloc>(
          //   create: (context) => GetFaqBloc(ApiProvider()),
          // ),
        ],
        // child: ScreenUtilInit(
        //     designSize: const Size(360, 690),
        //     minTextAdapt: true,
        //     splitScreenMode: true,
        //     builder: (context, child) {
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Enif Chat Bot',
          themeMode: ThemeMode.system,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const EnifHome(showBackButton: false),
        ));
    // }),
    // );
  }
}
