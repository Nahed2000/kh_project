import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../component.dart';
import '../../provider/pray_time.dart';

class PrayTime extends StatelessWidget {
  decidePray(pray) {
    if (pray == 'fajr') {
      return 'الفجر';
    } else if (pray == 'sunrise') {
      return 'شروق الشمس';
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
          title: Text(
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
                      buildContainerPray(screenWidth, theDay),
                      buildContainerPray(
                          screenWidth, formatter.format(date).toString()),
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
                  buildContainerPray(screenWidth, 'الصلاة القادمة'),
                  buildContainerPray(
                      screenWidth, decidePray(next.toString().split('.')[1])),
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
                  buildContainerPray(screenWidth, 'موعد الصلاة القادمة'),
                  buildContainerPray(
                      screenWidth,
                      countdown == null
                          ? '_____'
                          : DateFormat.jm().format(countdown).toString()),
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
                          buildContainerText('صلاة الفجر'),
                          buildContainerTime(screenWidth, prayerTimes.fajr),
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
                          buildContainerText('شروق الشمس'),
                          buildContainerTime(screenWidth, prayerTimes.sunrise),
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
                          buildContainerText('صلاة الظهر'),
                          buildContainerTime(screenWidth, prayerTimes.dhuhr),
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
                          buildContainerText('صلاة العصر'),
                          buildContainerTime(screenWidth, prayerTimes.asr),
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
                          buildContainerText('صلاة المغرب'),
                          buildContainerTime(screenWidth, prayerTimes.maghrib),
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
                          buildContainerText('صلاة العشاء'),
                          buildContainerTime(screenWidth, prayerTimes.isha),
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
      // color: co,
      width: screenWidth / 2.5,
      child: Center(
        child: Container(
          // padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              title,
              style: GoogleFonts.amiri(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              // textAlign: TextAlign.right,
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
            const SizedBox(
              width: 30,
            ),
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
