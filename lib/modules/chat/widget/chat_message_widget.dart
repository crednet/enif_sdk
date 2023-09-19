import 'package:enif/constants/enif_colors.dart';
import 'package:enif/extensions/date.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/models/send_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
                    ),
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
        constraints: const BoxConstraints(maxWidth: 400),
        child: Builder(builder: (context) {
          var view = Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: EnifColors.primary,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 50),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, right: 8.0, left: 8.0),
                    child: Text(
                      message.content ?? "",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 5,
                  right: 10,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      t,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ))
            ],
          );
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
