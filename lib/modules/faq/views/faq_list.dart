import 'dart:math';

import 'package:enif/constants/enif_colors.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../view_model/faq_view_model.dart';

class FaqList extends StatefulWidget {
  final bool mini;
  final FaqViewModel? faqViewModel;
  const FaqList({super.key, required this.mini, this.faqViewModel});

  @override
  State<FaqList> createState() => _FaqListState();
}

class _FaqListState extends State<FaqList> {
  late FaqViewModel _faqViewModel;

  @override
  void initState() {
    _faqViewModel = widget.faqViewModel ?? FaqViewModel();
    super.initState();
    _faqViewModel.getFaqs();
  }

  @override
  void dispose() {
    if (widget.faqViewModel == null) _faqViewModel.dispose();
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
          var items = value.faqs;
          if (_faqViewModel.searchText.isNotEmpty) {
            items = items
                    ?.where((element) =>
                        element.question
                                ?.toLowerCase()
                                .contains(_faqViewModel.searchText) ==
                            true ||
                        element.response
                                ?.toLowerCase()
                                .contains(_faqViewModel.searchText) ==
                            true)
                    .toList() ??
                [];
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
              itemCount:
                  widget.mini ? min(items?.length ?? 0, 4) : items?.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item = items?[index];
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
