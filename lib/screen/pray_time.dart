import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../component.dart';
import '../provider/pray_time.dart';

class PrayTime extends StatelessWidget {
  decidePray(pray) {
    if (pray == 'fajr') {
      return 'الفجر';
    } else if (pray == 'sunrise') {
      return 'طلوع الشمس';
    } else if (pray == 'dhuhr') {
      return 'الظهر';
    } else if (pray == 'asr') {
      return 'العصر';
    } else if (pray == 'maghrib') {
      return 'المغرب';
    } else if (pray == 'isha') {
      return 'العشاء';
    } else {
      return 'انتهت صلوات اليوم';
    }
  }

  @override
  Widget build(BuildContext context) {

    var formatter = Provider.of<PrayerTi>(context).formatter;
    var date = Provider.of<PrayerTi>(context).date;
    var theDay = Provider.of<PrayerTi>(context).myDay;

    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: co,
        appBar: AppBar(
          title:  Text(
            'أوقات الصلاة حسب موقعك الجغرافي',
            style: GoogleFonts.amiri(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          backgroundColor: co,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildContainerPray(
                          screenWidth, formatter.format(date).toString()),
                      buildContainerPray(screenWidth, theDay),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildContainerPray(
                      screenWidth, decidePray(next.toString().split('.')[1])),
                  buildContainerPray(screenWidth, 'الصلاة القادمة'),
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildContainerPray(
                      screenWidth,
                      countdown == null
                          ? '_____'
                          : DateFormat.jm().format(countdown).toString()),
                  buildContainerPray(screenWidth, 'موعد الصلاة القادمة'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(
                        15,
                      )),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildContainerTime(screenWidth, prayerTimes.fajr),
                          buildContainerText('صلاة الفجر'),
                        ],
                      ),
                    ),
                    //   buildContainer(prayerTimes.fajr,'صلاة الفجر'),
                    const Divider(
                      thickness: 1,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildContainerTime(screenWidth, prayerTimes.sunrise),
                          buildContainerText('شروق الشمس'),
                        ],
                      ),
                    ),
                    //  buildContainer(prayerTimes.sunrise,'شروق الشمس'),
                    const Divider(
                      thickness: 1,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildContainerTime(screenWidth, prayerTimes.dhuhr),
                          buildContainerText('صلاة الظهر'),
                        ],
                      ),
                    ),
                    // buildContainer(prayerTimes.dhuhr,'صلاة الظهر'),
                    const Divider(
                      thickness: 1,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildContainerTime(screenWidth, prayerTimes.asr),
                          buildContainerText('صلاة العصر'),
                        ],
                      ),
                    ),
                    // buildContainer(prayerTimes.asr,'صلاة العصر'),
                    const Divider(
                      thickness: 1,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildContainerTime(screenWidth, prayerTimes.maghrib),
                          buildContainerText('صلاة المغرب'),
                        ],
                      ),
                    ),
                    // buildContainer(prayerTimes.maghrib,'صلاة المغرب'),
                    const Divider(
                      thickness: 1,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildContainerTime(screenWidth, prayerTimes.isha),
                          buildContainerText('صلاة العشاء'),
                        ],
                      ),
                    ),
                    //   buildContainer(prayerTimes.isha,'صلاة العشاء'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainerPray(screenWidth, title) {
    return Container(
      color: co,
      width: screenWidth / 2.5,
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.topRight,
          child: FittedBox(
            child: Text(
              title,
              style: GoogleFonts.amiri(
                fontSize: 18,
                color: Colors.white,

              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
    );
  }

  FittedBox buildContainerTime(screenWidth, time) {
    return FittedBox(
      child: FittedBox(
        child: Row(
          children: [
            Container(
              width: screenWidth / 3.5,
              alignment: Alignment.centerRight,
              child: Text(
                DateFormat.jm().format(time).toString(),
                style: GoogleFonts.amiri(
                  color: co,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
                // textDirection: TextDirection.RTL,
              ),
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }

  Container buildContainerText(pray) {
    return Container(
      alignment: Alignment.centerRight,
      child: FittedBox(
        child: Text(
          pray,
          style: GoogleFonts.amiri(
            color: co,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
