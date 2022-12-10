import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kh_project/constant.dart';
import 'package:kh_project/provider/theme_provider.dart';
import 'package:kh_project/screen/bnv_screen/azkar_app.dart';
import 'package:kh_project/screen/bnv_screen/azkary.dart';
import 'package:provider/provider.dart';

import '../model/bnb_model.dart';
import 'bnv_screen/home_app.dart';
import 'bnv_screen/share_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<BNBModel> listScreen = <BNBModel>[
    BNBModel(title: '', body: const HomeApp()),
    BNBModel(title: '', body: const AzkaryScreen()),
    BNBModel(title: 'الأذكار و الأدعية ', body: const AzkarScreen()),
    BNBModel(title: 'صدقة جارية', body: const ShareAppScreen()),
  ];
  IconData iconMode = Icons.dark_mode_outlined;

  BannerAd? bannerAd;
  bool isLoaded = false;

  InterstitialAd? interstitialAd;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
            interstitialAd = ad;
          });
          print('interstitial loaded');
        },
        onAdFailedToLoad: (error) {
          print('interstitial Ad failed to load ;');
        },
      ),
    );
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
          });
          print('Banner Ad Loaded ');
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );
    bannerAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ThemeProvider>(context);
    Color v = Provider.of<ThemeProvider>(context) == ThemeData.dark()
        ? controller.kBlack
        : controller.kWhite;
    return Scaffold(
      backgroundColor:v,
      appBar: currentIndex != 1
          ? AppBar(
              backgroundColor: controller.kPrimary,
              centerTitle: currentIndex == 3 ? false : true,
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        iconMode = iconMode == Icons.sunny
                            ? Icons.dark_mode_outlined
                            : Icons.sunny;
                      });
                      controller.changeTheme();
                    },
                    icon: Icon(iconMode,color: v))
              ],
              actionsIconTheme:IconThemeData(color: controller.kWhite),
              elevation: 1,
              title: Text(
                listScreen[currentIndex].title,
                style: GoogleFonts.amiri(
                  fontSize: 23,
                  color: v
                ),
              ),
            )
          : null,
      body: Stack(
        children: [
          listScreen[currentIndex].body,
          isLoaded
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 50,
                    child: AdWidget(ad: bannerAd!),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.teal.shade900.withOpacity(0.9),
              spreadRadius: 2,
              blurRadius: 5,
              // offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.teal.shade800,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            if (isLoaded) {
              interstitialAd!.show();
            }
          },
          unselectedItemColor: controller.kWhite,
          selectedItemColor: controller.kWhite,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_filled),
              label: currentIndex == 0 ? 'الرئيسية' : '',
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.motion_photos_on_outlined),
                label: currentIndex == 1 ? 'اذكاري' : '',
                activeIcon: const Icon(Icons.motion_photos_on)),
            BottomNavigationBarItem(
              icon: const Icon(Icons.gradient_sharp),
              label: currentIndex == 2 ? 'الأذكار' : '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: currentIndex == 3 ? 'مشاركة' : '',
            ),
          ],
        ),
      ),
    );
  }
}
