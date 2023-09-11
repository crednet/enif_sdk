import 'package:enif/constants/image_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChatUsers extends StatelessWidget {
  const ChatUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      width: 110,
      child: Stack(
        children: [
          Positioned(
                  right: 60,
                  bottom: 0,
                  top: 0,
                  child: Image.asset(ImageAssets.chatUser1, package: 'enif'))
              .animate()
              .fadeIn(delay: 400.ms)
              .slideX(delay: 400.ms),
          Positioned(
                  right: 30,
                  bottom: 0,
                  top: 0,
                  child: Image.asset(ImageAssets.chatUser2, package: 'enif'))
              .animate()
              .fadeIn(delay: 200.ms)
              .slideX(delay: 200.ms),
          Positioned(
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Image.asset(ImageAssets.chatUser3, package: 'enif'))
              .animate()
              .fadeIn()
              .slideX()
        ],
      ),
    );
  }
}
