import 'dart:math';

import 'package:enif/common/text_style_common.dart';
import 'package:flutter/material.dart';

import '../../../common/stringHelper.dart';
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
    _faqViewModel.getFaqs(StringHelper.businessId);
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
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemCount: widget.mini
                ? min(value.faqs?.length ?? 0, 4)
                : value.faqs?.length ?? 0,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var item = value.faqs?[index];
              return ExpansionTile(
                title: Text(
                  item?.question ?? "",
                  style: AppTextStyle.appBarStyle12(),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      item?.response ?? "",
                      style: AppTextStyle.heading12Style(),
                    ),
                  )
                ],
              );
            },
          );
        });
  }
}
