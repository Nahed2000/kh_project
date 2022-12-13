import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../component.dart';
import '../../provider/All_surah.dart';
import '../../provider/theme_provider.dart';


class AyatSurah extends StatelessWidget {
  AyatSurah({Key? key, required this.title, required this.index})
      : super(key: key);
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    String basmla = Provider.of<AllSu>(context).basmla;
    String surah = Provider.of<AllSu>(context).getAllVerses(index);
    var controller = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor:  co,
          appBar: AppBar(
            title: Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: controller.kWhite,
                ),
            ),
            backgroundColor: co,
            centerTitle: true,
            elevation: 0,
          ),
          body: Column(
            children: [
              if (index != 1 && index != 9)
                Column(
                  children: [
                    const SizedBox(height: 10,),
                    Text(
                      basmla,
                      style: GoogleFonts.cairo(
                        fontSize: 20,
                        color: controller.kWhite,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  height: double.infinity,
                  // color: Colors.grey[200],
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: controller.kWhite,
                          boxShadow: [
                            BoxShadow(
                              color: co,
                              blurRadius: 3,
                              offset:const Offset(0.3, 0.5), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(6),
                        child: InteractiveViewer(
                          maxScale: 2,
                          minScale: 1,
                          child: SelectableText(
                            surah,
                            style:  GoogleFonts.amiri(
                              fontSize: 19,
                              // letterSpacing: 1.7,
                              wordSpacing: 1.7,
                            ),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,
                            textScaleFactor: 1.15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
