import 'package:fl_sevengen_society_guard_app/localization/localization_const.dart';
import 'package:fl_sevengen_society_guard_app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/auth/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace,
            height5Space,
            backbutton(context),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                children: [
                  registerText(),
                  heightSpace,
                  pleaseText(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  userNameField(),
                  heightSpace,
                  height5Space,
                  phoneField(),
                  heightSpace,
                  height5Space,
                  emailField(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  height5Space,
                  registerButton(),
                  heightSpace,
                  heightSpace,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  pleaseText() {
    return Text(
      getTranslate(context, 'register.please_text'),
      textAlign: TextAlign.center,
      style: medium14Grey77,
    );
  }

  registerText() {
    return Text(
      getTranslate(context, 'register.REGISTER'),
      style: semibold21Primary,
      textAlign: TextAlign.center,
    );
  }

  registerButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/otp');
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
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'register.register'),
          style: semibold18White,
        ),
      ),
    );
  }

  emailField() {
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
          ),
        ],
      ),
      child: TextField(
        cursorColor: primaryColor,
        style: semibold16Black33,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIconConstraints: const BoxConstraints(maxWidth: 60),
          prefixIcon: Container(
            width: 60.0,
            margin: languageValue == 4
                ? const EdgeInsets.only(left: 15.0)
                : const EdgeInsets.only(right: 15.0),
            decoration: BoxDecoration(
              border: languageValue == 4
                  ? const Border(left: BorderSide(color: greyColor, width: 1.5))
                  : const Border(
                      right: BorderSide(color: greyColor, width: 1.5),
                    ),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.mail_outline,
              size: 20,
            ),
          ),
          hintText: getTranslate(context, 'register.email_address'),
          hintStyle: medium16Grey,
        ),
      ),
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
          ),
        ],
      ),
      child: TextField(
        cursorColor: primaryColor,
        style: semibold16Black33,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIconConstraints: const BoxConstraints(maxWidth: 60),
          prefixIcon: Container(
            width: 60.0,
            margin: languageValue == 4
                ? const EdgeInsets.only(left: 15.0)
                : const EdgeInsets.only(right: 15.0),
            decoration: BoxDecoration(
              border: languageValue == 4
                  ? const Border(
                      left: BorderSide(color: greyColor, width: 1.5),
                    )
                  : const Border(
                      right: BorderSide(color: greyColor, width: 1.5),
                    ),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.phone_android,
              size: 20,
            ),
          ),
          hintText: getTranslate(context, 'register.mobile_number'),
          hintStyle: medium16Grey,
        ),
      ),
    );
  }

  userNameField() {
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
          ),
        ],
      ),
      child: TextField(
        cursorColor: primaryColor,
        style: semibold16Black33,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIconConstraints: const BoxConstraints(maxWidth: 60),
          prefixIcon: Container(
            width: 60.0,
            margin: languageValue == 4
                ? const EdgeInsets.only(left: 15.0)
                : const EdgeInsets.only(right: 15.0),
            decoration: BoxDecoration(
              border: languageValue == 4
                  ? const Border(
                      left: BorderSide(color: greyColor, width: 1.5),
                    )
                  : const Border(
                      right: BorderSide(color: greyColor, width: 1.5),
                    ),
            ),
            alignment: Alignment.center,
            child: const Icon(
              CupertinoIcons.person,
              size: 20,
            ),
          ),
          hintText: getTranslate(context, 'register.user_name'),
          hintStyle: medium16Grey,
        ),
      ),
    );
  }

  backbutton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      padding: const EdgeInsets.all(fixPadding * 2.0),
      icon: const Icon(
        Icons.arrow_back,
        color: black33Color,
      ),
    );
  }
}
