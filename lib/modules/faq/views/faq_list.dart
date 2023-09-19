import 'dart:math';

import 'package:enif/constants/enif_colors.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../view_model/faq_view_model.dart';

class FaqList extends StatefulWidget {
  final bool mini;
  const FaqList({super.key, required this.mini});

  @override
  State<FaqList> createState() => _FaqListState();
}

class _FaqListState extends State<FaqList> {
  late FaqViewModel _faqViewModel;

  @override
  void initState() {
    _faqViewModel = FaqViewModel();
    super.initState();
    _faqViewModel.getFaqs();
  }

  @override
  void dispose() {
    _faqViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _faqViewModel,
        builder: (c, value, i) {
          if (value.isLoading && (value.faqs ?? []).isEmpty) {
            return const Center(
                child: SizedBox.square(
                    dimension: 25,
                    child: CircularProgressIndicator(
                        color: EnifColors.primary, strokeWidth: 3)));
          }
          return RefreshIndicator(
            onRefresh: () {
              return _faqViewModel.getFaqs();
            },
            child: ListView.separated(
              physics: widget.mini
                  ? const NeverScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: widget.mini ? 0 : 80),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                    height: 1,
                    thickness: 1,
                    color: context.textColor.withOpacity(.2));
              },
              itemCount: widget.mini
                  ? min(value.faqs?.length ?? 0, 4)
                  : value.faqs?.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item = value.faqs?[index];
                return ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(item?.question ?? "",
                      style: TextStyle(
                        color: context.textColor,
                        fontSize: 14,
                      )),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20.0, left: 8.0, right: 8.0),
                      child: Text(item?.response ?? "",
                          style: TextStyle(
                            height: 1.4,
                            fontWeight: FontWeight.w400,
                            color: context.textColor.withOpacity(.8),
                            fontSize: 12,
                          )),
                    )
                  ],
                );
              },
            ),
          );
        });
  }
}
