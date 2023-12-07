import 'package:enif/constants/enif_colors.dart';
import 'package:enif/constants/svg_assets.dart';
import 'package:enif/extensions/date.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/models/ticket_status.dart';
import 'package:enif/modules/chat/view_model/chat_history_controller.dart';
import 'package:enif/modules/chat/view_model/enif_controller.dart';
import 'package:enif/modules/chat/views/live_chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatHistoryView extends StatelessWidget {
  const ChatHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.backgroundColor,
        resizeToAvoidBottomInset: true,
        body: Scaffold(
          backgroundColor:
              context.isDark ? const Color(0xff1a1a1a) : Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: EnifColors.primary,
            actions: [
              Material(
                color: const Color(0xff5124B2),
                shape: const CircleBorder(),
                child: CupertinoButton(
                  onPressed: () {
                    EnifController.reset();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LivechatScreen()));
                  },
                  minSize: 4,
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(SvgAssets.edit,
                      package: 'enif',
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      width: 18,
                      height: 18),
                ),
              ),
              20.0.w,
            ],
            title: const Text('Messages',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
          body: const ChatHistoryList(),
        ));
  }
}

class ChatHistoryList extends StatefulWidget {
  const ChatHistoryList({super.key, this.newMessage = false});
  final bool newMessage;

  @override
  State<ChatHistoryList> createState() => _ChatHistoryListState();
}

class _ChatHistoryListState extends State<ChatHistoryList> {
  late ChatHistoryController _chatHistoryViewModel;

  @override
  void initState() {
    _chatHistoryViewModel = ChatHistoryController();
    super.initState();
    _chatHistoryViewModel.load();
  }

  @override
  void dispose() {
    _chatHistoryViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _chatHistoryViewModel.load,
      child: ValueListenableBuilder(
          valueListenable: _chatHistoryViewModel,
          builder: (context, value, child) {
            if (value.isLoading && value.length == 0) {
              return const Center(child: CupertinoActivityIndicator());
            }
            return ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              itemCount: value.length,
              itemBuilder: (context, index) {
                var item = value.messages![index];
                var ticketStatus = value.ticketStatus?.firstWhere(
                  (status) => status.ticketid == item.id,
                  orElse: () => TicketStatus(ticketid: item.id, isRead: true),
                );
                return Stack(
                  children: [
                    if (ticketStatus != null && !ticketStatus.isRead)
                      const Positioned(
                        left: 0,
                        // right: 0,
                        top: 20,
                        child: Icon(Icons.circle,
                            size: 11, color: EnifColors.primary),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          EnifController.setChatSession(item);
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LivechatScreen()));

                            _chatHistoryViewModel
                                .updateUnreadMessages(item.id ?? '');
                          });

                          // _chatHistoryViewModel
                          //     .updateUnreadMessages(item.id ?? '');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                          item.title ?? 'No messages yet',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: context.textColor,
                                              fontWeight: FontWeight.w500))),
                                  40.0.w,
                                  SvgPicture.asset(SvgAssets.arrowRight,
                                      package: 'enif')
                                ],
                              ),
                              4.0.h,
                              Text(
                                item.updatedAt?.readableFormat ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: context.textColor.withOpacity(.7)),
                              ),
                              15.0.h,
                              Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: context.isDark
                                      ? Colors.grey.withOpacity(.4)
                                      : const Color(0xffE6E5E8)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
