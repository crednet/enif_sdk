// import 'package:enif/bloc/get_user_chats_bloc.dart';
// import 'package:enif/prefrences/app_prefreces.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'bloc/get_faq_bloc.dart';
// import 'bloc/new_chat_bloc.dart';
// import 'bloc/send_chat_bloc.dart';
// import 'screens/chatbot_screen.dart';
// import 'service/api_provider.dart';

// AppPreferences? appPreferences;
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//   appPreferences = await AppPreferences.getInstance();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<GetUserChatBloc>(
//           create: (context) => GetUserChatBloc(ApiProvider()),
//         ),
//         BlocProvider<SendChatBloc>(
//           create: (context) => SendChatBloc(ApiProvider()),
//         ),
//         BlocProvider<NewChatBloc>(
//           create: (context) => NewChatBloc(ApiProvider()),
//         ),
//         BlocProvider<GetFaqBloc>(
//           create: (context) => GetFaqBloc(ApiProvider()),
//         ),
//       ],
//       child: ScreenUtilInit(
//           designSize: const Size(360, 690),
//           minTextAdapt: true,
//           splitScreenMode: true,
//           builder: (context, child) {
//             return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: 'Enif Chat Bot',
//               home: const HomeScreen(),
//               builder: EasyLoading.init(), /*  builder: EasyLoading.init()*/
//             );
//           }),
//     );
//   }
// }
