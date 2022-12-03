import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kh_project/screen/zikr.dart';

import '../../model/azkar_list.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Zikr(title: Dummy_Zikr[index].title),
            ),
          );
        },
        child: Card(
          color: Colors.grey.shade200,
          margin: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              Dummy_Zikr[index].title,
              style: GoogleFonts.amiri(fontSize: 23),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      itemCount: Dummy_Zikr.length,
    );
  }
}
