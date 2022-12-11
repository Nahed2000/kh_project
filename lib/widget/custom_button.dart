import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kh_project/provider/theme_provider.dart';
import 'package:provider/provider.dart';


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

    var controller = Provider.of<ThemeProvider>(context,listen: false);

    return ElevatedButton(
      onPressed: onPress,
      
      style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(15),
        backgroundColor: controller.kPrimary,
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