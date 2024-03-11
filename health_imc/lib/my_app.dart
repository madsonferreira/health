import 'package:flutter/material.dart';

import 'package:health_imc/pages/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          // textTheme: GoogleFonts.robotoFlexTextTheme()
        ),
        home: const MainPage());
  }
}
