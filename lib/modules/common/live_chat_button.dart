import 'package:enif/common/extensions.dart';
import 'package:enif/common/text_style_common.dart';
import 'package:enif/constants/enif_colors.dart';
import 'package:enif/constants/svg_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../chat/views/live_chat_screen.dart';

class LiveChatButton extends StatelessWidget {
  const LiveChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LivechatScreen()));
      },
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.5),
      borderRadius: BorderRadius.circular(14),
      color: EnifColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Live Chat",
                style: AppTextStyle.homeStyle(),
              ),
              const SizedBox(height: 4),
              Text(
                "We typically reply in few minutes...",
                style: AppTextStyle.homeStyle1(),
              ),
            ],
          ).addPadding(const EdgeInsets.symmetric(vertical: 5, horizontal: 8)),
          // Icon(Icons.add),
          SvgPicture.asset(
            SvgAssets.share,
            package: 'enif',
            height: 20,
          ).addPadding(const EdgeInsets.symmetric(vertical: 5, horizontal: 8))
        ],
      ),
    );
  }
}
