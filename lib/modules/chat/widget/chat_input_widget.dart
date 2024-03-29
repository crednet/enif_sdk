import 'dart:io';

import 'package:enif/constants/svg_assets.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/modules/chat/view_model/chat_controller.dart';
import 'package:enif/modules/chat/widget/image_preview_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ChatInputWidget extends StatefulWidget {
  final ChatController controller;
  const ChatInputWidget({super.key, required this.controller});

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
            valueListenable: widget.controller,
            builder: (context, value, child) => Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                    widget.controller.value.isLoading ||
                            //|| widget.controller.value.newMessage == null
                            widget.controller.value.isBusinessTyping
                        ? '${widget.controller.session.agentName ?? 'Agent'} is typing...'
                        : '',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: context.textColor.withOpacity(.8))))),
        5.0.h,
        Divider(
            height: 1,
            thickness: .5,
            color: context.isDark
                ? const Color.fromARGB(255, 138, 138, 139)
                : const Color(0xffA4A4A6)),
        TextField(
            onChanged: widget.controller.textChanged,
            controller: widget.controller.textEditingController,
            textInputAction: TextInputAction.newline,
            maxLines: 2,
            minLines: 1,
            decoration: InputDecoration(
                hintText: 'Type a message',
                border: border,
                enabledBorder: border,
                errorBorder: border,
                focusedBorder: border,
                focusedErrorBorder: border)),
        Padding(
          padding:
              // EdgeInsets.all(0),
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Row(
            children: [
              10.0.w,
              CupertinoButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                  // color: context.isDark ? Colors.white : Colors.black,
                  onPressed: () {
                    onCameraSelected(ImageSource.camera);
                  },
                  child: SizedBox.square(
                      dimension: 20,
                      child: Icon(Icons.camera_alt,
                          // Image.asset(ImageAssets.gif,
                          //     package: 'enif',
                          color: context.textColor.withOpacity(.7)))),
              CupertinoButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                  // color: context.isDark ? Colors.white : Colors.black,
                  onPressed: () {
                    pickImage(ImageSource.gallery);
                  },
                  child: SizedBox.square(
                    dimension: 20,
                    child: SvgPicture.asset(SvgAssets.imagePaceholder,
                        package: 'enif',
                        colorFilter: ColorFilter.mode(
                            context.textColor.withOpacity(.8),
                            BlendMode.srcIn)),
                  )),
              .0.s,
              ValueListenableBuilder(
                  valueListenable: widget.controller,
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        value.isImageLoading
                            ?   Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        for (var image in widget.controller.selectedImages)
                          ImagePreviewWidget(
                            file: image!,
                            onCancelTap: () {
                              setState(() {
                                widget.controller.selectedImages.remove(image);
                              });
                            },
                          ),
                        20.0.w,
                        CupertinoButton(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            color: context.isDark ? Colors.white : Colors.black,
                            onPressed: ((value.text ?? '').isEmpty &&
                                        (value.imageUrls ?? []).isEmpty) ||
                                    value.isLoading
                                ? null
                                : widget.controller.send
                            // )
                            ,
                            child:
                                // value.isLoading
                                //     ? const Center(
                                //         child: SizedBox.square(
                                //             dimension: 18,
                                //             child: CircularProgressIndicator(
                                //                 strokeWidth: 2)))
                                //     :
                                Text('Send',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: context.isDark
                                            ? Colors.black
                                            : Colors.white))),
                      ],
                    );
                  }),
              20.0.w,
            ],
          ),
        ),
      ],
    );
  }

  Future pickImage(ImageSource source) async {
    if (widget.controller.selectedImages.length >= 2) {
      return;
    }

    final returnImages = await ImagePicker().pickMultiImage(
        imageQuality: 50 // Set the maximum number of images you want to allow
        );

    if (returnImages.isEmpty) return;
    setState(() {
      for (var returnImage in returnImages) {
        widget.controller.returnImage = returnImage;
        widget.controller.selectedImages.add(File(returnImage.path));
      }
    });

    if (widget.controller.selectedImages.isNotEmpty) {
      Future.delayed(const Duration(seconds: 2), () {
        widget.controller.handleImageUpload();
      });
    }
  }

  Future onCameraSelected(ImageSource source) async {
    if (widget.controller.selectedImages.length >= 2) {
      return;
    }

    final returnImage =
        await ImagePicker().pickImage(source: source, imageQuality: 50);

    if (returnImage == null) return;
    setState(() {
      widget.controller.returnImage = returnImage;
      widget.controller.selectedImages.add(File(returnImage.path));
    });

    if (widget.controller.selectedImages.isNotEmpty) {
      Future.delayed(const Duration(seconds: 5), () {
        widget.controller.handleImageUpload();
      });
    }
  }
}
