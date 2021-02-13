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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Nunito'),
        home: LoginScreen(),
      ),
    );
  }
}
