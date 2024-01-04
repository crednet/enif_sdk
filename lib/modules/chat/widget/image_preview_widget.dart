import 'dart:io';

import 'package:enif/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ImagePreviewWidget extends StatelessWidget {
  const ImagePreviewWidget(
      {super.key, required this.file, required this.onCancelTap});
  final File file;
  final VoidCallback onCancelTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 70,
          margin: const EdgeInsets.only(top: 5, right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 0.5, color: context.textColor.withOpacity(.3))),
          child: Image.file(file),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: InkWell(
            onTap: onCancelTap,
            radius: 10,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(Icons.cancel,
                  size: 15, color: context.textColor.withOpacity(.7)),
            ),
          ),
        ),
      ],
    );
  }
}
