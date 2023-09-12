// import 'package:enif/bloc/send_chat_bloc.dart';
// import 'package:enif/common/extensions.dart';
// import 'package:enif/common/text_style_common.dart';
// import 'package:enif/extensions/extensions.dart';
// import 'package:enif/models/chat_session.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';

// import '../common/colors.dart';
// import '../common/custom_appbar.dart';
// import '../common/custom_button.dart';
// import '../common/image_helper.dart';
// import '../common/stringHelper.dart';
// import '../custom/custom_textfiled1.dart';
// import '../models/get_user_chat_model.dart';

// class LiveChatSecondScreen extends StatefulWidget {
//   // String? customer;
//   // String? chatId;
//   // String? channel;
//   // List<GetMessages>? messages;
//   final ChatSession session;
//   const LiveChatSecondScreen({Key? key, required this.session})
//       : super(key: key);

//   @override
//   State<LiveChatSecondScreen> createState() => _LiveChatSecondScreenState();
// }

// class _LiveChatSecondScreenState extends State<LiveChatSecondScreen> {
//   TextEditingController textController = TextEditingController();
//   ScrollController scrollController = ScrollController();
//   bool? showTyping = false;

//   getImage() async {
//     bool? isCamera = await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop(true);
//               },
//               child: const Text("Camera"),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//               child: const Text("gallery "),
//             ),
//           ],
//         ),
//       ),
//     );

//     if (isCamera == null) return;

//     XFile? file = await ImagePicker()
//         .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
//     // selectedImage = File(file!.path);
//     setState(() {});
//   }

//   void _scrollDown() {
//     scrollController.animateTo(
//       scrollController.position.maxScrollExtent,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 500), () {
//       _scrollDown();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.whiteColor,
//       appBar: CustomAppbar(
//         backgroundColor: Colors.blueAccent,
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Image.asset(ImageHelper.arrowRightImg,
//                     package: 'enif', scale: 4)
//                 .addPadding(const EdgeInsets.only(left: 10))),
//         text: StringHelper.enif,
//         textColor: ColorConstant.whiteColor,
//       ),
//       body: SingleChildScrollView(
//         controller: scrollController,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             36.h,
//             Center(
//                 child: Image.asset("assets/images/user.png",
//                     package: 'enif', height: 50)),
//             18.h,
//             Text("How may we be of help today ?",
//                 style: AppTextStyle.appBar13Style()),
//             70.h,
//             // widget.session.messages?.length == 0
//             //     ? const SizedBox()
//             //     : Padding(
//             //         padding: const EdgeInsets.all(10),
//             //         child: ListView.builder(
//             //             physics: const NeverScrollableScrollPhysics(),
//             //             shrinkWrap: true,
//             //             padding: EdgeInsets.zero,
//             //             itemCount: widget.session.messages?.length,
//             //             itemBuilder: (context, index) {
//             //               return widget.session.messages?[index].role ==
//             //                       "assistance"
//             //                   ? flexibleReceiver(
//             //                       index: index, list: widget.session.messages)
//             //                   : flexibleSender(
//             //                       index: index,
//             //                       list: [...?widget.session.messages]);
//             //             }),
//             //       ),
//             140.h
//           ],
//         ),
//       ),
//       bottomSheet: Container(
//           height: 250,
//           color: Colors.white,
//           width: double.infinity,
//           alignment: Alignment.center,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 showTyping == true
//                     ? const Text("Jarvis is typing...")
//                     : const SizedBox(),
//                 CustomTextFields(
//                   contentPadding: 0,
//                   fillColor: ColorConstant.transparent,
//                   controller: textController,
//                   labelText: StringHelper.typeMessage,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Aa"),
//                     10.h,
//                     InkWell(
//                         onTap: () {
//                           getImage();
//                         },
//                         child: Image.asset(ImageHelper.gifImg,
//                             package: 'enif', height: 14)),
//                     10.h,
//                     InkWell(
//                         onTap: () {
//                           getImage();
//                         },
//                         child: Image.asset(ImageHelper.images,
//                             package: 'enif', height: 14)),
//                     175.h,
//                     BlocListener<SendChatBloc, SendChatState>(
//                       listener: (context, state) {
//                         if (state is SendChatLoadingState) {
//                           functionCall(
//                             {
//                               "status": "sent",
//                               "role": "user",
//                               "content": textController.text,
//                               "created_date":
//                                   DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'")
//                                       .format(DateTime.now()),
//                               "_id": "64e22eff6adb64f6d0da011e"
//                             },
//                           );
//                           textController.clear();
//                           showTyping = true;
//                           setState(() {});
//                         } else if (state is SendChatSuccessState) {
//                           /* functionCall(
//                             {
//                               "status": state.data.message?.status ?? "",
//                               "role": state.data.message?.role ?? "",
//                               "content": state.data.message?.content??"",
//                               "created_date": DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(DateTime.now()),
//                               "_id": state.data.message?.sId??""
//                             },
//                           );*/
//                           functionCall(
//                             {
//                               "status": state.data.reply?.status ?? "",
//                               "role": state.data.reply?.role ?? "",
//                               "content": state.data.reply?.content ?? "",
//                               "created_date":
//                                   DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'")
//                                       .format(DateTime.now()),
//                               "_id": state.data.reply?.sId ?? ""
//                             },
//                           );
//                           showTyping = false;
//                           setState(() {});
//                         } else if (state is SendChatErrorState) {
//                           showTyping = false;
//                           Fluttertoast.showToast(msg: state.errorMessage);
//                         }
//                       },
//                       child: CustomButton(
//                         onTap: () {
//                           if (textController.text.isEmpty) {
//                             Fluttertoast.showToast(msg: "type something");
//                           } else {
//                             BlocProvider.of<SendChatBloc>(context)
//                                 .add(SendChatRefreshEvent(
//                               channel: widget.session.channel,
//                               chatId: widget.session.chatId,
//                               customer: widget.session.customer,
//                               promptMsg: textController.text,
//                             ));
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )),
//     );
//   }

//   Widget flexibleSender({required int index, List<GetMessages>? list}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 25),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           const Expanded(child: SizedBox()),
//           Text(DateFormat("h:mma")
//               .format(DateTime.parse(list?[index].createdDate ?? ""))
//               .toLowerCase()),
//           const SizedBox(width: 10),
//           Expanded(
//             flex: 1,
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.blueAccent,
//               ),
//               child: Text(
//                 list?[index].content ?? "",
//                 style: AppTextStyle.Text13Styles(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget flexibleReceiver({required int index, List<GetMessages>? list}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 25),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Expanded(
//             flex: 3,
//             child: Container(
//               padding: const EdgeInsets.all(6),
//               alignment: Alignment.centerLeft,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: ColorConstant.lightPurpalColor),
//               child: Html(
//                 data: generateHtmlContent(list?[index].content ?? ""),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           Text(DateFormat("h:mma")
//               .format(DateTime.parse(list?[index].createdDate ?? ""))
//               .toLowerCase()),
//           const Expanded(child: SizedBox())
//         ],
//       ),
//     );
//   }

//   String generateHtmlContent(String response) {
//     List<String> lines = response.split('\n');
//     String htmlContent = '';

//     for (String line in lines) {
//       line = line.replaceAll(RegExp(r'[!@#\$%^&*()]'), '');
//       line = line.replaceAll("Image: ", "");

//       const urlPattern =
//           r'https?://(?:www\d?\.)?([a-zA-Z0-9.-]+)(?:\.[a-zA-Z]{2,6})(?:/[\w\d.-]*)*/?';

//       final regex = RegExp(urlPattern);
//       final matches = regex.allMatches(line);

//       for (Match match in matches) {
//         final url = match.group(0) ?? "";
//         line = line.replaceAll(url, '<img src="$url" alt="$url" /><br>');
//       }

//       const urlPatternHttp =
//           r'http?://(?:www\d?\.)?([a-zA-Z0-9.-]+)(?:\.[a-zA-Z]{2,6})(?:/[\w\d.-]*)*/?';

//       final regexHttp = RegExp(urlPatternHttp);
//       final matchesHttp = regexHttp.allMatches(line);

//       for (Match match in matchesHttp) {
//         final url = match.group(0) ?? "";
//         line = line.replaceAll(url, '<img src="$url" alt="$url" /><br>');
//       }
//       htmlContent += '$line<br>';
//     }

//     return htmlContent;
//   }

//   Future? functionCall(Map<String, String> map) {
//     // widget.messages?.add(GetMessages.fromJson(map));
//     Future.delayed(const Duration(milliseconds: 500), () {
//       _scrollDown();
//     });
//     setState(() {});
//     return null;
//   }
// }
