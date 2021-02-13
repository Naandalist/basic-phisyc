import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "Text di tengah",
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
