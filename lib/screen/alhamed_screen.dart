import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kh_project/model/azkar_list.dart';

class AlhamedScreen extends StatefulWidget {
  const AlhamedScreen({Key? key}) : super(key: key);

  @override
  State<AlhamedScreen> createState() => _AlhamedScreenState();
}

class _AlhamedScreenState extends State<AlhamedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'الحمدلله على ',
              style: GoogleFonts.amiri(fontSize: 70.0, color: Colors.white),
            ),
            DefaultTextStyle(
              style: GoogleFonts.amiri(fontSize: 70.0, color: Colors.yellow),
              child: AnimatedTextKit(
                animatedTexts:
                    Azkar.listHamed.map((e) => ScaleAnimatedText(e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
