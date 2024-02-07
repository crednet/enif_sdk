import 'package:enif/constants/svg_assets.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/modules/common/back.dart';
import 'package:enif/modules/common/custom_textfield.dart';
import 'package:enif/modules/faq/views/faq_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../home/views/enif_home.dart';
import '../view_model/faq_view_model.dart';

class EnifHelpScreen extends StatefulWidget {
  const EnifHelpScreen({Key? key}) : super(key: key);

  @override
  State<EnifHelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<EnifHelpScreen> {
  TextEditingController controller = TextEditingController();
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
    return Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            leading: const Back(color: Colors.white),
            title: const Text('Help',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600))
            // text: ,
            // textColor: ColorConstant.whiteColor,
            ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.h,
                  const OverlaySettings(),
                  CustomTextField(
                      maxLines: 1,
                      fillColor: Colors.transparent,
                      onChanged: (text) {
                        _faqViewModel.search(text ?? '');
                      },
                      suffix: SizedBox(
                        width: 40,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Center(
                              child: SizedBox.square(
                                  dimension: 18,
                                  child: SvgPicture.asset(
                                    SvgAssets.search,
                                    fit: BoxFit.contain,
                                    package: 'enif',
                                    colorFilter: ColorFilter.mode(
                                        context.textColor, BlendMode.srcIn),
                                  )),
                            )),
                      ),
                      controller: controller,
                      labelText: 'Search for help'),
                  15.h,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Text("${(0)} collections",
                  //         style: AppTextStyle.heading14Style()),
                  //     const Spacer(),
                  //     Image.asset(ImageHelper.arrowImg,
                  //         package: 'enif', scale: 2.5),
                  //   ],
                  // ).addPadding(const EdgeInsets.symmetric(horizontal: 8)),
                  // const Divider(
                  //   thickness: .5,
                  // ).addPadding(const EdgeInsets.symmetric(horizontal: 10)),
                  // 10.h,

                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FaqList(mini: false, faqViewModel: _faqViewModel),
                  ))
                ])));
  }
}
