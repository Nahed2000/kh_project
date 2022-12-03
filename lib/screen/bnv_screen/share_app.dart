import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kh_project/constant.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';

class ShareAppScreen extends StatelessWidget {
  const ShareAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 80,horizontal: 20),
                color: kPrimary,
                child: Text(
                  'شارك التطبيق لمن تعرفه الأن ليصبح "صدقة جارية " خاصة بك ! بحيث يتناقله\n ألاف الناس من بعدك',
                  style: GoogleFonts.amiri(fontSize: 23, color: kWhite),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: kWhite,
              ),
            ),
            //
          ],
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Share.share('ios:'
                  '\n'
                  'https://apple.co/33qsudl '
                  '\n'
                  'الاندرويد: '
                  '\n'
                  '  https://play.google.com/store/apps/details?id=com.azker96.azker1196');
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                backgroundColor: kWhite,
                minimumSize: const Size(180, 90),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: Colors.black26, width: 1))
                // shadowColor: Color(10)
                ),
            child: Text(
              'مشاركة  التطبيق',
              style: GoogleFonts.amiri(color: kBlack, fontSize: 22),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.21,
          left: MediaQuery.of(context).size.width * 0.16,
          child: Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                StoreRedirect.redirect(
                  androidAppId: "com.azker96.azker1196",
                  iOSAppId: "1004470625",
                );
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  backgroundColor: kWhite,
                  minimumSize: const Size(180, 90),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: Colors.black26, width: 1),
                  )),
              child: Text(
                'تقييم التطبيق',
                style: GoogleFonts.amiri(color: kBlack, fontSize: 22),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
