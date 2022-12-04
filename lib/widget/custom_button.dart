import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);
 final void Function()onPress;
 final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      
      style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(15),
        backgroundColor: kPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: Size(150, 50)
      ),
      child: Text(
        title,
        style: GoogleFonts.amiri(fontSize: 19,color: Colors.white),
      ),
    );
  }
}