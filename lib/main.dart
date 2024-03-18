import 'package:catalog_app/pages/homePage.dart';
import 'package:catalog_app/pages/loginPage.dart';
import 'package:catalog_app/utils/routs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      initialRoute: MyRouts.homeRoute,
      routes: {
        '/': (context) => Login_Page(),
        MyRouts.loginRoute: (context) => Login_Page(),
        MyRouts.homeRoute: (context) => HomePage(),
      },
    );
  }
}
