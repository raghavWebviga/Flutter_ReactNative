import 'dart:io';
import 'package:fl_sevengen_society_guard_app/localization/localization_const.dart';
import 'package:fl_sevengen_society_guard_app/screens/screens.dart';
import 'package:fl_sevengen_society_guard_app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  final pages = const [
    HomeScreen(),
    InOutScreen(),
    MessagesScreen(),
    SettingsScreen(),
  ];
  DateTime? backPressTime;

  @override
  Widget build(BuildContext context) {
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
        body: pages.elementAt(selectedIndex),
        bottomNavigationBar: bottomBar(),
      ),
    );
  }

  bottomBar() {
    return BottomNavigationBar(
      selectedItemColor: primaryColor,
      unselectedItemColor: greyB4Color,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: semibold14Primary,
      unselectedLabelStyle: semibold14GreyB4,
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      backgroundColor: whiteColor,
      elevation: 10.0,
      items: [
        BottomNavigationBarItem(
            icon: const Iconify(
              Ri.home_4_line,
              color: greyB4Color,
            ),
            activeIcon: const Iconify(
              Ri.home_4_line,
              color: primaryColor,
            ),
            label: getTranslate(context, 'bottom_bar.home')),
        BottomNavigationBarItem(
            icon: const Icon(
              CupertinoIcons.arrow_up_arrow_down,
              size: 22,
            ),
            label: getTranslate(context, 'bottom_bar.in_out')),
        BottomNavigationBarItem(
            icon: const Icon(
              Icons.chat_bubble_outline,
            ),
            label: getTranslate(context, 'bottom_bar.messages')),
        BottomNavigationBarItem(
            icon: const Icon(
              CupertinoIcons.gear,
            ),
            label: getTranslate(context, 'bottom_bar.settings')),
      ],
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
