import 'package:enif/constants/svg_assets.dart';
import 'package:enif/enif.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LiveChatButton extends StatelessWidget {
  final InputDecorationTheme? inputDecorationTheme;

  const LiveChatButton({super.key, this.inputDecorationTheme});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        // EnifController.reset();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Theme(
                    data: Theme.of(context)
                        .copyWith(inputDecorationTheme: inputDecorationTheme),
                    child: const LivechatScreen())));
      },
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.5),
      borderRadius: BorderRadius.circular(14),
      color: Theme.of(context).primaryColor,
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
