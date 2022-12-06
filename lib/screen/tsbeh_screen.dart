import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kh_project/provider/azkary_provider.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class TsbehScreen extends StatefulWidget {
  const TsbehScreen({Key? key}) : super(key: key);

  @override
  State<TsbehScreen> createState() => _TsbehScreenState();
}

class _TsbehScreenState extends State<TsbehScreen> {
  int counterOfTasbeh = 0;

  void increment() {
    setState(() {
      counterOfTasbeh += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kPrimary,
        leading: const BackButton(),
        actions: [
          IconButton(
              onPressed: () {
                AudioPlayer().play(AssetSource('assets/sound_button.mp3'));
              },
              icon: const Icon(Icons.volume_up_outlined))
        ],
        iconTheme: IconThemeData(
          color: kWhite,
        ),
      ),
      body: Consumer<AzkaryProvider>(
        builder: (context, value, child) => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'سبح اسم ربك الأعلى ',
                  style: GoogleFonts.amiri(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Center(
                  child: Text(
                    '(سبحان الله | الحمدلله | الله أكبر | لا اله ال الله)',
                    style: GoogleFonts.amiri(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Text(
                  counterOfTasbeh.toString(),
                  style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'عدد التسبيح ',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.058,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: kWhite,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              counterOfTasbeh = 0;
                            });
                          },
                          icon: Icon(
                            Icons.restart_alt,
                            color: kPrimary,
                            size: 30,
                          )),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: kWhite,
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          increment();
                          value.sumIncrement();
                        },
                        icon: Icon(
                          Icons.add,
                          color: kPrimary,
                          size: 30,
                        )),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white)),
                  child: Text(
                    'مجموع التسبيحات ${value.sumNum}',
                    style: GoogleFonts.amiri(fontSize: 25, color: kWhite),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
