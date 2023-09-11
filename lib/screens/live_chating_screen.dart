// import 'package:enif/common/extensions.dart';
// import 'package:enif/common/text_style_common.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../common/colors.dart';
// import '../common/custom_appbar.dart';
// import '../common/custom_button.dart';
// import '../common/image_helper.dart';
// import '../common/sizes.dart';
// import '../common/stringHelper.dart';
// import '../custom/custom_textfiled1.dart';
// import 'live_chat_first_screen.dart';
//
// class LiveChatingScreen extends StatefulWidget {
//   const LiveChatingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LiveChatingScreen> createState() => _LiveChatingScreenState();
// }
//
// class _LiveChatingScreenState extends State<LiveChatingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.whiteColor,
//       appBar: CustomAppbar(
//         backgroundColor: ColorConstant.darkBlue,
//         leading: InkWell(
//             onTap: (){
//               Navigator.pop(context);
//             },
//             child: Image.asset(ImageHelper.arrowRightImg,scale: 4).addPadding(EdgeInsets.only(left:10.r))),
//         text: StringHelper.enif,
//         textColor: ColorConstant.whiteColor,
//
//       ),
//       body: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         addHeight(40),
//         Center(child: Image.asset("assets/images/user.png",height: 50  )),
//         addHeight(10),
//         Text("Olamide joins the chat..."
//           ,style: TextStyle(
//           color: ColorConstant.nameColor,
//           fontSize: 14 ,
//
//         ),
//         ),
//
//       ],
//     ),
//       bottomSheet: Container(
//           height: 100  
//           color: Colors.white,
//           width: double.infinity,
//           alignment: Alignment.center,
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
//             child: Row(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Olamide is typing...",style: AppTextStyle.heading12Style(),),
//                     addHeight(18),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment aceBetween,
//                       children: [
//                         Text("Aa" ),
//                         addWidth(10),
//                         Image.asset(ImageHelper.gifImg,height: 14  ),
//                         addWidth(10),
//                         Image.asset(ImageHelper.images,height: 14  ),
//                         addWidth(175),
//                         InkWell(
//                           child: CustomButton(onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => const LiveChatFirstScreen(),));
//
//                           },),
//                         ),
//
//                       ],
//                     ),
//                   ],
//                 ),
//
//               ],
//             ),
//           )
//
//       ),
//
//
//     );
//   }
// }
