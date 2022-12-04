import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kh_project/constant.dart';


getClipboard(context,title,text){

  Clipboard.setData(ClipboardData(text: title))
      .then((value) {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content:  Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.amiri(
            fontSize: 18,
          color: kPrimary
        ),
      ),
      duration:const Duration(seconds: 1),
      backgroundColor: Colors.white,
    ));

  });

}