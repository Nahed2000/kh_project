import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../clipBoard.dart';
import '../../constant.dart';
import '../../model/azkar_list.dart';
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

  final random = Random();

  @override
  Widget build(BuildContext context) {
    String elementAlhamed =
        Azkar.listHamed[random.nextInt(Azkar.listHamed.length)];
    String elementAyat =
        Azkar.randomAyat[random.nextInt(Azkar.randomAyat.length)];
    List elementNameOfAllah =
        Azkar.namesOfAllah[random.nextInt(Azkar.namesOfAllah.length)];
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
                  const Spacer(),
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
                        'عطر فمك ب${greeting()}',
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
                ),
              ),
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
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                spreadRadius: 2,
              )
            ], borderRadius: BorderRadius.circular(15), color: kWhite),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'بلغوا عني لو أية',
                      style: GoogleFonts.amiri(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Share.share(elementAyat);
                        },
                        icon: const Icon(Icons.share))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  elementAyat,
                  style: GoogleFonts.amiri(
                    fontSize: 25,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => setState(() {
                    elementAyat;
                  }),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: kPrimary,
                    child: Icon(
                      Icons.cached_rounded,
                      color: kWhite,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                spreadRadius: 2,
              )
            ], borderRadius: BorderRadius.circular(15), color: kWhite),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/names_of_allah_screen'),
                    icon: const Icon(
                      Icons.list_sharp,
                    ),
                  ),
                ),
                Text(
                  "أسماء الله الحسنى",
                  style: GoogleFonts.amiri(
                    fontSize: 35,
                  ),
                ),
                // " "
                DefaultTextStyle(
                  style: GoogleFonts.amiri(fontSize: 70.0, color: kBlack),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText(elementNameOfAllah[0],
                          duration: Duration(seconds: 2)),
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        elementNameOfAllah;
                      }),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: kPrimary,
                        child: Icon(
                          Icons.cached_rounded,
                          color: kWhite,
                          size: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => dialog(context, elementNameOfAllah[0],
                          elementNameOfAllah[1]),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: kPrimary,
                        child: Icon(
                          Icons.arrow_forward,
                          color: kWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(color: Colors.black, blurRadius: 1)
            ], borderRadius: BorderRadius.circular(15), color: kWhite),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'أشكرك يا ربي على نعمة',
                  style: GoogleFonts.amiri(
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  elementAlhamed,
                  style: GoogleFonts.amiri(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/alhamed_screen'),
                  child: CircleAvatar(
                    backgroundColor: kPrimary,
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: kWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
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

  dialog(context, name, mean) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          name,
          style: TextStyle(
            color: kPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
        content: Text(
          mean,
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.right,
        ),
        actions: [
          TextButton(
            onPressed: () => getClipboard(context, mean, 'تم نسخ المعنى'),
            child: Text(
              'نسخ',
              style: TextStyle(
                color: kPrimary,
                fontSize: 18,
              ),
            ),
          ),
          TextButton(
            // color: Colors.teal,
            autofocus: true,
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'إغلاق',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
