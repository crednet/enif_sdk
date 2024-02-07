import 'package:enif/constants/svg_assets.dart';
import 'package:enif/enif.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LiveChatButton extends StatelessWidget {
  const LiveChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        // EnifController.reset();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LivechatScreen()));
      },
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.5),
      borderRadius: BorderRadius.circular(14),
      color: Theme.of(context).primaryColor, // EnifColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Live Chat",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              SizedBox(height: 4),
              Text("We typically reply in few minutes...",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ],
          ),
          SvgPicture.asset(
            SvgAssets.share,
            package: 'enif',
            height: 20,
          )
        ],
      ),
    );
  }
}
