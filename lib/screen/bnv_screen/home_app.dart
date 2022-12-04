import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../../widget/custom_button.dart';
import '../zikr.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  void initState() {
    // TODO: implement initState
    greeting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 80, horizontal: 20),
                      color: kPrimary,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(color: Colors.black, blurRadius: 1)
                  ], borderRadius: BorderRadius.circular(15), color: kWhite),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'مرحبا بك',
                        style: GoogleFonts.amiri(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'ابدأ يومك ب${greeting()}',
                        style: GoogleFonts.amiri(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CircleAvatar(
                        backgroundColor: kPrimary,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Zikr(title: greeting()),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: kWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              title: 'ورد الصباح',
              onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Zikr(title: 'أذكار الصباح'),
                  )),
            ),
            CustomButton(
              title: 'ورد المساء',
              onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Zikr(title: 'أذكار المساء'),
                  )),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              title: 'تسبيح',
              onPress: () => Navigator.pushNamed(context, '/tsbeh_screen'),
            ),
            CustomButton(
              title: 'مواقيت الصلاة',
              onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Zikr(title: 'أذكار المساء'),
                  )),
            ),
          ],
        )
      ],
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'أذكار الصباح';
    } else {
      return 'أذكار المساء';
    }
  }
}
