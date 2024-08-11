import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_bloc/Chat/viiew/chat_history.dart';
import 'package:medical_bloc/Online_Pharmacy/view/arcticles.dart';
import 'package:medical_bloc/home/view/home.dart';
import 'package:medical_bloc/profile/view/profile.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';

class BottomAppBarCus extends StatefulWidget {
  @override
  _BottomBarCusState createState() => _BottomBarCusState();
}

class _BottomBarCusState extends State<BottomAppBarCus> {
  int selectedIndex = 0;

  final List<Widget> classes = [
    HomeScreen(),
    ChatHistory(),
    Arcticles(),
    ProfileScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: classes[selectedIndex],
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color with opacity
              spreadRadius: 2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, 3), // Offset in x and y direction
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(
                  'images/Homefill.svg',
                  'images/Home.svg',
                  0,
                ),
                buildNavItem(
                  'images/Messagefill.svg',
                  'images/Messages.svg',
                  1,
                ),
                buildNavItem(
                  'images/Calendarfill.svg',
                  'images/Calendar.svg',
                  2,
                ),
                buildNavItem(
                  'images/Profilefill.svg',
                  'images/Profile.svg',
                  3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(
    String fillIcon,
    String icon,
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            onTap: () => onTabTapped(index),
            child: selectedIndex == index
                ? SvgPicture.asset(fillIcon)
                : SvgPicture.asset(icon)),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
