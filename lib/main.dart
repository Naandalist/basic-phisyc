import 'package:basicPhisyc/src/screens/login_screen.dart';
// import 'package:basicPhisyc/src/screens/welcome.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:basicPhisyc/src/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Nunito'),
      home: LoginScreen(),
    );
  }
}
