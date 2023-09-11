import 'package:enif/constants/svg_assets.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class Back extends StatelessWidget {
  final Color? color;
  const Back({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 7),
        onPressed: Navigator.of(context).pop,
        child: SizedBox.square(
            dimension: 26,
            child: SvgPicture.asset(
              SvgAssets.back,
              package: 'enif',
              colorFilter:
                  ColorFilter.mode(color ?? context.textColor, BlendMode.srcIn),
            )));
  }
}
