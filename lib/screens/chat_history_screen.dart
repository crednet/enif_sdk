// import 'package:enif/bloc/get_user_chats_bloc.dart';
// import 'package:enif/common/extensions.dart';
// import 'package:enif/extensions/extensions.dart';
// import 'package:enif/modules/chat/views/live_chat_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

// import '../common/colors.dart';
// import '../common/image_helper.dart';
// import '../common/stringHelper.dart';
// import '../enif.dart';

// class ChatHistoryScreen extends StatefulWidget {
//   const ChatHistoryScreen({Key? key}) : super(key: key);

//   @override
//   State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
// }

// class _ChatHistoryScreenState extends State<ChatHistoryScreen> {
//   @override
//   void initState() {
//     super.initState();
//     if ((appPreferences?.getString(appPreferences?.chatId ?? "")?.isEmpty ==
//                 true &&
//             appPreferences?.getString(appPreferences?.email ?? "")?.isEmpty ==
//                 true) ||
//         (appPreferences?.getString(appPreferences?.chatId ?? "") == null &&
//             appPreferences?.getString(appPreferences?.email ?? "") == null)) {
//       print("nothing");
//     } else {
//       BlocProvider.of<GetUserChatBloc>(context).add(GetUserChatRefreshEvent(
//           email: appPreferences?.getString(appPreferences?.email ?? "")));
//       // BlocProvider.of<GetUserChatBloc>(context).add(GetUserChatRefreshEvent(email: "jlrabdulazeez@gmail.com"));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.blueAccent,
//           leadingWidth: 45,
//           centerTitle: true,
//           leading: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 12.0),
//                 child: Image.asset(
//                   ImageHelper.arrowRightImg,
//                   scale: 4,
//                   package: 'enif',
//                 ),
//               )),

//           // Icon(Icons.arrow_back,
//           //     color: ColorConstant.blackColor,size: 17 )).addPadding(EdgeInsets.only(left: 10.w)),
//           title: Text(
//             StringHelper.messages,
//             style: const TextStyle(color: ColorConstant.whiteColor),
//           ),

//           actions: [
//             appPreferences?.getString(appPreferences?.email ?? "")?.isEmpty ==
//                         true ||
//                     appPreferences?.getString(appPreferences?.email ?? "") ==
//                         null
//                 ? Container()
//                 : InkWell(
//                     onTap: () {
//                       // if ((appPreferences
//                       //                 ?.getString(appPreferences?.chatId ?? "")
//                       //                 ?.isEmpty ==
//                       //             true &&
//                       //         appPreferences
//                       //                 ?.getString(appPreferences?.email ?? "")
//                       //                 ?.isEmpty ==
//                       //             true) ||
//                       //     (appPreferences?.getString(
//                       //                 appPreferences?.chatId ?? "") ==
//                       //             null &&
//                       //         appPreferences?.getString(
//                       //                 appPreferences?.email ?? "") ==
//                       //             null)) {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const LivechatScreen(),
//                           ));
//                       // } else {
//                       //   Navigator.push(
//                       //       context,
//                       //       MaterialPageRoute(
//                       //         builder: (context) => LiveChatFirstScreen(
//                       //           chatId: appPreferences
//                       //               ?.getString(appPreferences?.chatId ?? ""),
//                       //           customer: appPreferences
//                       //               ?.getString(appPreferences?.name ?? ""),
//                       //           channel: appPreferences
//                       //               ?.getString(appPreferences?.channel ?? ""),
//                       //         ),
//                       //       ));
//                       // }
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 12.0),
//                       child: Container(
//                           // height: 35
//                           // width: 45.w,
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 8, horizontal: 10),
//                           decoration: BoxDecoration(
//                             // borderRadius: BorderRadius.circular(30.r),
//                             color: Colors.blue.shade300,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Image.asset(
//                             ImageHelper.editImg,
//                             package: 'enif',
//                             scale: 3,
//                           )).addPadding(const EdgeInsets.only(left: 10)),
//                     ),
//                   ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12.0),
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.shade300,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.close,
//                   color: ColorConstant.whiteColor,
//                   size: 20,
//                 ),
//               ).addPadding(const EdgeInsets.only(left: 10)),
//             ),
//             10.h
//           ],
//         ),
//         backgroundColor: Colors.white,
//         body: ((appPreferences?.getString(appPreferences?.email ?? "") ==
//                     null) ||
//                 appPreferences
//                         ?.getString(appPreferences?.email ?? "")
//                         ?.isEmpty ==
//                     true)
//             ? const Center(child: Text("No data found!"))
//             : BlocBuilder<GetUserChatBloc, GetUserChatState>(
//                 builder: (context, state) {
//                   if (state is GetUserChatLoadingState) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else if (state is GetUserChatSuccessState) {
//                     return state.data?.isEmpty == true
//                         ? const Center(child: Text("No data found!"))
//                         : ListView.separated(
//                             shrinkWrap: true,
//                             itemCount: state.data?.length ?? 0,
//                             physics: const AlwaysScrollableScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               return ListTile(
//                                   onTap: () {
//                                     // Navigator.push(
//                                     //     context,
//                                     //     MaterialPageRoute(
//                                     //       builder: (context) =>
//                                     //           LiveChatSecondScreen(
//                                     //         chatId: state.data?[index].chatId,
//                                     //         customer:
//                                     //             state.data?[index].customer,
//                                     //         channel: state.data?[index].channel,
//                                     //         messages:
//                                     //             state.data?[index].messages,
//                                     //       ),
//                                     //     ));
//                                   },
//                                   leading: CircleAvatar(
//                                     backgroundColor: const Color(0xff764abc),
//                                     child:
//                                         Image.asset("assets/images/damy.png"),
//                                   ),
//                                   title:
//                                       Text(state.data?[index].category ?? ""),
//                                   subtitle: Text(
//                                       "${state.data?[index].type ?? ""} - ${getTime(DateTime.parse(state.data?[index].updateDate ?? ""))}"),
//                                   trailing: Image.asset(ImageHelper.arrowImg,
//                                       package: 'enif', scale: 3));
//                             },
//                             separatorBuilder: (context, index) {
//                               return const Divider();
//                             },
//                           );
//                   } else if (state is GetUserChatErrorState) {
//                     return Text(state.errorMessage);
//                   } else {
//                     return const SizedBox();
//                   }
//                 },
//               ));
//   }

//   String getTime(DateTime? date) {
//     if (date != null) {
//       DateTime dateTime = date.toLocal();
//       DateFormat dateFormat = DateFormat('HH:mm');
//       return daysBetween(dateTime) < 1
//           ? dateFormat.format(dateTime)
//           : daysBetween((dateTime)) == 1
//               ? "a day ago"
//               : daysBetween((dateTime)) > 1 && daysBetween((dateTime)) < 7
//                   ? "${daysBetween((dateTime)).toString()} days ago"
//                   : DateFormat('MMM dd, yyyy').format((dateTime.toLocal()));
//     } else {
//       return '';
//     }
//   }

//   int daysBetween(DateTime from) {
//     DateTime to = DateTime.now().toUtc();

//     from = DateTime(from.year, from.month, from.day);
//     to = DateTime(to.year, to.month, to.day);
//     return (to.difference(from).inHours / 24).round();
//   }
// }
