import 'dart:async';

import 'package:fl_sevengen_society_user_app/theme/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/onboarding');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/splash/bgImage.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleAndLogo(),
                bottomImage(size),
              ],
            ),
          ),
        ],
      ),
    );
  }

  titleAndLogo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        heightBox(fixPadding * 10.0),
        const Icon(
          Icons.home_work_outlined,
          color: primaryColor,
          size: 48.0,
        ),
        heightSpace,
        const Text(
          "SEVENGEN",
          style: semibold28Primary,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30.0,
              height: 2,
              color: primaryColor,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: fixPadding / 2),
              child: Text(
                "Society",
                style: medium18Primary,
              ),
            ),
            Container(
              width: 30.0,
              height: 2,
              color: primaryColor,
            ),
          ],
        )
      ],
    );
  }

  bottomImage(Size size) {
    return Image.asset(
      "assets/splash/image.png",
      height: size.height * 0.4,
      width: double.maxFinite,
      fit: BoxFit.cover,
    );
  }
}
