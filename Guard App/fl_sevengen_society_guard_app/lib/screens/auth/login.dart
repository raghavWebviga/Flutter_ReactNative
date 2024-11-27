import 'dart:io';
import 'package:fl_sevengen_society_guard_app/localization/localization_const.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../theme/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  DateTime? backPressTime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        } else {
          return false;
        }
      },
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/auth/bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(fixPadding * 2.0),
            physics: const BouncingScrollPhysics(),
            children: [
              heightBox(fixPadding * 6),
              loginTitle(),
              heightSpace,
              pleaseText(),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              phoneField(),
              height5Space,
              verificationText(),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              height5Space,
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  loginButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/register');
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0, vertical: fixPadding * 1.4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.1),
              blurRadius: 12.0,
              offset: const Offset(0, 6),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'login.login'),
          style: semibold18White,
        ),
      ),
    );
  }

  verificationText() {
    return Text(
      getTranslate(context, 'login.login_text'),
      style: medium14Primary,
    );
  }

  phoneField() {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            blurRadius: 12.0,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: IntlPhoneField(
        cursorColor: primaryColor,
        style: semibold16Black33,
        dropdownIconPosition: IconPosition.trailing,
        dropdownIcon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: blackColor,
        ),
        textAlign: languageValue == 4 ? TextAlign.right : TextAlign.left,
        flagsButtonPadding:
            const EdgeInsets.symmetric(horizontal: fixPadding * 0.8),
        disableLengthCheck: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: getTranslate(context, 'login.enter_mobile_number'),
          hintStyle: medium16Grey,
        ),
      ),
    );
  }

  pleaseText() {
    return Text(
      getTranslate(context, 'login.please_text'),
      style: medium14Grey77,
      textAlign: TextAlign.center,
    );
  }

  loginTitle() {
    return Text(
      getTranslate(context, 'login.LOGIN'),
      style: semibold21Primary,
      textAlign: TextAlign.center,
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (backPressTime == null ||
        now.difference(backPressTime!) >= const Duration(seconds: 2)) {
      backPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: blackColor,
          content: Text(
            getTranslate(context, 'exit_app.exit_text'),
            style: semibold15White,
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1500),
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
