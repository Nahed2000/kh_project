import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workmanager/workmanager.dart';

import '../component.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
    getZikrStart();
    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.pushReplacementNamed(context, '/home_screen');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade100,
              Colors.teal.shade600,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              // backgroundColor: Colors.white,
              radius: 70,
              backgroundImage: AssetImage('assets/image/iconluncer.jpg'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              'سبح اسم ربك الأعلى ',
              style: GoogleFonts.amiri(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
