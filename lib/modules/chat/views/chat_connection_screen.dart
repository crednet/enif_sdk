import 'package:enif/constants/enif_colors.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/modules/chat/view_model/chat_connection_view_model.dart';
import 'package:enif/modules/chat/view_model/enif_controller.dart';
import 'package:enif/modules/common/custom_textfield.dart';
import 'package:enif/utils/phone_number_formatter.dart';
import 'package:enif/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/chat_users.dart';

class ChatConnectionScreen extends StatefulWidget {
  // final bool forceNew;
  const ChatConnectionScreen({super.key});

  @override
  State<ChatConnectionScreen> createState() => _ChatConnectionScreenState();
}

class _ChatConnectionScreenState extends State<ChatConnectionScreen>
    with Validator {
  late ChatConnectionViewModel _chatConnectionViewModel;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  @override
  void initState() {
    _chatConnectionViewModel = ChatConnectionViewModel();
    _nameController.text = EnifController().userParams.value?.name ?? '';
    _emailController.text = EnifController().userParams.value?.email ?? '';
    _phoneNoController.text = EnifController().userParams.value?.phoneNo ?? '';
    super.initState();
    if (EnifController().userParams.value?.email != null) {
      _chatConnectionViewModel.initChat(EnifController().userParams.value);
    }
  }

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _chatConnectionViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(builder: (context) {
        return Scaffold(
            backgroundColor: context.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: EnifColors.primary,
              title: const Text('Live Chat',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
            ),
            bottomNavigationBar: SizedBox(
                height: 115,
                child: Material(
                    color: context.isDark
                        ? const Color.fromARGB(255, 46, 45, 46)
                        : const Color(0xffE7E6EB),
                    child: SafeArea(
                        child: Column(children: [
                      .0.s,
                      30.0.h,
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: context.isDark
                            ? Colors.white54
                            : const Color(0xffDADADA),
                      ),
                      20.0.h,
                      ValueListenableBuilder(
                          valueListenable: _chatConnectionViewModel,
                          builder: (context, value, child) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: CupertinoButton(
                                  // padding: EdgeInsets.symmetric(),
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: Colors.black,
                                  onPressed: () {
                                    autovalidateMode = AutovalidateMode.always;
                                    if (Form.of(context).validate()) {
                                      _chatConnectionViewModel.initChat(null);
                                    }
                                  },
                                  child: Center(
                                      child: value.isLoading
                                          ? const SizedBox.square(
                                              dimension: 20,
                                              child: CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 2))
                                          : const Text('Continue Chatting',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.w600)))),
                            );
                          }),
                      20.0.h,
                    ])))),
            body: Column(
              children: [
                55.0.h,
                const Center(child: ChatUsers()),
                11.h,
                Text(
                  'How can we be of help today...',
                  style: TextStyle(fontSize: 12, color: context.textColor),
                ),
                .0.s,
                Material(
                  color: context.isDark
                      ? const Color.fromARGB(255, 46, 45, 46)
                      : const Color(0xffE7E6EB),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        30.0.h,
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Column(children: [
                              const Text('Tell us about you to start chatting',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                              22.0.h,
                              ValueListenableBuilder(
                                  valueListenable: _chatConnectionViewModel,
                                  builder: (context, value, child) =>
                                      CustomTextField(
                                        controller: _nameController,
                                        maxLines: 1,
                                        enabled: !value.isLoading,
                                        autovalidateMode: autovalidateMode,
                                        onChanged: _chatConnectionViewModel
                                            .nameChanged,
                                        borderSide: BorderSide.none,
                                        keyboardType: TextInputType.name,
                                        fillColor: context.isDark
                                            ? const Color(0xff111111)
                                            : Colors.white,
                                        labelText: 'Enter name',
                                        validator: (text) {
                                          if ((text ?? '').length < 3) {
                                            return 'Please enter a valid name';
                                          }
                                          return null;
                                        },
                                      )),
                              ValueListenableBuilder(
                                  valueListenable: _chatConnectionViewModel,
                                  builder: (context, value, child) =>
                                      CustomTextField(
                                        controller: _emailController,
                                        maxLines: 1,
                                        enabled: !value.isLoading,
                                        autovalidateMode: autovalidateMode,
                                        validator: (email) =>
                                            emailValidator(email, true),
                                        onChanged: _chatConnectionViewModel
                                            .emailChanged,
                                        borderSide: BorderSide.none,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        fillColor: context.isDark
                                            ? const Color(0xff111111)
                                            : Colors.white,
                                        labelText: 'Email addresss ',
                                      )),
                              ValueListenableBuilder(
                                  valueListenable: _chatConnectionViewModel,
                                  builder: (context, value, child) =>
                                      CustomTextField(
                                          controller: _phoneNoController,
                                          autovalidateMode: autovalidateMode,
                                          validator: (text) {
                                            if ((text ?? '').length < 8) {
                                              return 'Please enter a valid phone number';
                                            }
                                            return null;
                                          },
                                          maxLines: 1,
                                          enabled: !value.isLoading,
                                          keyboardType: TextInputType.phone,
                                          inputFormatters: [
                                            PhoneNumberFormatter()
                                          ],
                                          onChanged: _chatConnectionViewModel
                                              .phoneNoChanged,
                                          borderSide: BorderSide.none,
                                          fillColor: context.isDark
                                              ? const Color(0xff111111)
                                              : Colors.white,
                                          labelText: 'Phone number')),
                              20.0.h,
                            ])),
                      ],
                    ),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
