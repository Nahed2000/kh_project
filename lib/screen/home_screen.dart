import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kh_project/constant.dart';
import 'package:kh_project/screen/bnv_screen/azkar_app.dart';
import 'package:kh_project/screen/bnv_screen/azkary.dart';

import '../model/bnb_model.dart';
import 'bnv_screen/home_app.dart';
import 'bnv_screen/share_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<BNBModel> listScreen = <BNBModel>[
    BNBModel(title: '', body: HomeApp()),
    BNBModel(title: '', body: AzkaryScreen()),
    BNBModel(title: 'الأذكار و الأدعية ', body: AzkarScreen()),
    BNBModel(title: 'صدقة جارية', body: ShareAppScreen()),
  ];
    IconData iconMode = Icons.dark_mode_outlined;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: currentIndex != 1
          ? AppBar(
              backgroundColor: kPrimary,
              centerTitle: currentIndex == 3 ? false : true,
              actions: [
                IconButton(onPressed: () {
                  setState(() {
                    iconMode = iconMode==Icons.sunny?Icons.dark_mode_outlined:Icons.sunny;
                  });
                }, icon: Icon(iconMode))
              ],
              actionsIconTheme: IconThemeData(color: kWhite),
              elevation: 1,
              title: Text(
                listScreen[currentIndex].title,
                style: GoogleFonts.amiri(
                  fontSize: 23,
                ),
              ),
            )
          : null,
      body: listScreen[currentIndex].body,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.teal.shade900.withOpacity(0.9),
              spreadRadius: 2,
              blurRadius: 5,
              // offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.teal.shade800,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_filled),
              label: currentIndex == 0 ? 'الرئيسية' : '',
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.motion_photos_on_outlined),
                label: currentIndex == 1 ? 'اذكاري' : '',
                activeIcon: const Icon(Icons.motion_photos_on)),
            BottomNavigationBarItem(
              icon: const Icon(Icons.gradient_sharp),
              label: currentIndex == 2 ? 'الأذكار' : '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: currentIndex == 3 ? 'مشاركة' : '',
            ),
          ],
        ),
      ),
    );
  }
}
