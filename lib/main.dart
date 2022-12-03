import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kh_project/db/db_controller.dart';
import 'package:kh_project/provider/azkary_provider.dart';
import 'package:kh_project/screen/home_screen.dart';
import 'package:kh_project/screen/lunch_screen.dart';
import 'package:provider/provider.dart';

import 'screen/bnv_screen/share_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AzkaryProvider>(
      create: (context) => AzkaryProvider(),
      builder: (context, child) => MaterialApp(
        title: 'Localizations Sample App',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar', 'AE'), // English, no country code
        ],
        debugShowCheckedModeBanner: false,
        // home: ShareAppScreen(),
        initialRoute: '/lunch_screen',
        routes: {
          '/lunch_screen': (context) => LunchScreen(),
          '/home_screen': (context) => HomeScreen()
        },
      ),
    );
  }
}
