// import 'package:any_link_preview/any_link_preview.dart';
import 'package:enif/extensions/date.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/models/send_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_link_previewer/flutter_link_previewer.dart';
// import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatMessageWidget extends StatelessWidget {
  final Message message;
  const ChatMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // print('(message.role ${message.role}');
    var date = message.createdAt;
    String t = date?.time ?? "";

    var difference = DateTime.now().difference(date ?? DateTime.now());

    if (difference.inDays > 1) {
      t = '${date?.readableFormat ?? ''} ${date?.time ?? ''}';
    }

    if (message.role == 'assistance') {
      var time = Text(
        t,
        style: TextStyle(
            color: context.textColor.withOpacity(.8),
            fontSize: 11,
            fontWeight: FontWeight.w500),
      );
      return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: context.isDark
                            ? const Color(0xff2A2A2A)
                            : const Color(0xffF6F6FA)),
                    child: Html(
                        data: generateHtmlContent(message.content ?? ""),
                        onLinkTap: (url, attributes, element) =>
                            launchUrl(Uri.parse(url ?? ''))),
                  ),
                  Positioned(bottom: 5, right: 10, child: time)
                ],
              ),
            ),
            const SizedBox(width: 10),
            // time,
            const Expanded(child: SizedBox())
          ],
        ),
      );
    }
    // var time = Text(
    //   t,
    //   style: const TextStyle(
    //       color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
    // );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: Builder(builder: (context) {
          var contentHtml = generateHtmlContent(message.content ?? "");

          // Check if contentHtml contains an image
          bool containsImage =
              contentHtml.contains('<img') && contentHtml.contains('src=');
          var view = ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 50),
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: .0, right: 8.0, left: 8.0),
                      child: containsImage
                          ? Html(
                              data: generateHtmlContent(message.content ?? ""),
                              onLinkTap: (url, attributes, element) =>
                                  launchUrl(Uri.parse(url ?? '')),
                              style: {
                                'body': Style(
                                    // fontSize: FontSize.small,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              },
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // AnyLinkPreview(
                                //   link: generateHtmlContent(message.content ?? ""),
                                //   // displayDirection: UIDirection.uiDirectionHorizontal,
                                //   cache: const Duration(hours: 1),
                                //   // backgroundColor: Colors.grey[300],
                                //   // errorWidget: Container(
                                //   //   color: Colors.grey[300],
                                //   //   child: Text('Oops!'),
                                //   // ),
                                //   // errorImage: _errorImage,
                                // ),
                                //  LinkPreview(
                                //     enableAnimation: true,
                                //     onPreviewDataFetched: (data) {
                                //       // setState(() {
                                //       //   datas = {
                                //       //     ...datas,
                                //       //     urls[index]: data,
                                //       //   };
                                //       // });
                                //     },
                                //     previewData: generateHtmlContent(message.content ?? ""),
                                // datas[urls[index]],

                                // text: message.content ?? '',
                                // width: MediaQuery.of(context).size.width,),
                                //  LinkPreviewData(
                                //   link: message.content ?? "",
                                //   titleStyle: const TextStyle(
                                //     fontSize: 13,
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                //   escriptionStyle: const TextStyle(
                                //       height: .7,
                                //       color: Colors.transparent,
                                //       fontSize: 9,
                                //       fontWeight: FontWeight.w500,
                                //     ),
                                //   ),
                                // ),
                                Text(
                                  message.content ?? "",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),

                                Text(
                                  t,
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      height: .7,
                                      color: Colors.transparent,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 10,
                      // left: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          t,
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w500),
                        ),
                      ))
                ],
              ));
          if ((message.content?.length ?? 0) > 35) {
            return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              const Expanded(child: SizedBox()),
              // time,
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: view,
              )
            ]);
          }
          return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const Expanded(child: SizedBox()),
            const SizedBox(width: 10),
            view
          ]);
        }),
      ),
    );
  }

  String generateHtmlContent(String response) {
    List<String> lines = response.split('\n');
    String htmlContent = '';

    for (String line in lines) {
      line = line.replaceAll(RegExp(r'[!@#\$%^&*()]'), '');
      line = line.replaceAll("Image: ", "");

      const urlPattern =
          r'https?://(?:www\d?\.)?([a-zA-Z0-9.-]+)(?:\.[a-zA-Z]{2,6})(?:/[\w\d.-]*)*/?';

      final regex = RegExp(urlPattern);
      final matches = regex.allMatches(line);

      for (Match match in matches) {
        final url = match.group(0) ?? "";
        line = line.replaceAll(url, '<img src="$url" alt="$url" /><br>');
      }

      const urlPatternHttp =
          r'http?://(?:www\d?\.)?([a-zA-Z0-9.-]+)(?:\.[a-zA-Z]{2,6})(?:/[\w\d.-]*)*/?';

      final regexHttp = RegExp(urlPatternHttp);
      final matchesHttp = regexHttp.allMatches(line);

      for (Match match in matchesHttp) {
        final url = match.group(0) ?? "";
        line = line.replaceAll(url, '<img src="$url" alt="$url" /><br>');
      }
      htmlContent += '$line<br>';
    }

    return htmlContent;
  }
}
