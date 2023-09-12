import 'package:enif/constants/enif_colors.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/models/send_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';

class ChatMessageWidget extends StatelessWidget {
  final Message message;
  const ChatMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // print('(message.role ${message.role}');
    if (message.role == 'assistance') {
      return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Container(
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
            ),
            const SizedBox(width: 10),
            Text(DateFormat("h:mma")
                .format(DateTime.parse(message.createdDate ?? ""))
                .toLowerCase()),
            const Expanded(child: SizedBox())
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Expanded(child: SizedBox()),
          Text(DateFormat("h:mma")
              .format(DateTime.parse(message.createdDate ?? ""))
              .toLowerCase()),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Builder(builder: (context) {
              var view = Container(
                padding: const EdgeInsets.all(14),
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: EnifColors.primary,
                ),
                child: Text(
                  message.content ?? "",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              );
              if ((message.content?.length ?? 0) > 25) {
                return view;
              }
              return Align(alignment: Alignment.centerRight, child: view);
            }),
          ),
        ],
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
