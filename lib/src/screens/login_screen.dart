import 'package:basicPhisyc/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:basicPhisyc/src/helpers/bezier_container.dart';
import 'package:basicPhisyc/src/helpers/error_messages.dart';
import '../helpers/credentials.dart' as credentials;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Widget _entryUsernameField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Username',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              fontFamily: "Nunito",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: _usernameController,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'e.g. udacode17',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xff6D214F),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff6D214F), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff6D214F), width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFFFFF),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryPasswordField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Password',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              fontFamily: "Nunito",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: '••••••',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xff6D214F),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff6D214F), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff6D214F), width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFFFFF),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return RaisedButton(
      onPressed: () => _validateLogin(),
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0x59B33771),
              Color(0xff6D214F),
            ],
          ),
        ),
        child: Text('Login',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  Widget _title() {
    return Container(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Basic Phisyc",
                textScaleFactor: 1.5,
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Color(0xff6D214F)))));
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[_entryUsernameField(), _entryPasswordField()],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    print(credentials.registeredUsername);
    return Scaffold(
        body: Container(
      // height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .14,
              right: -MediaQuery.of(context).size.width * .3,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  // _submitButton(),
                  _submitButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void _validateLogin() {
    if (_usernameController.text.isEmpty && _usernameController.text.isEmpty) {
      ErrorMessage.flash("Username & Password Harus Diisi");
    } else if (_usernameController.text.isEmpty) {
      ErrorMessage.flash("Username harus Diisi");
    } else if (_passwordController.text.isEmpty) {
      ErrorMessage.flash("Password Harus Diisi");
    } else if (_passwordController.text.length < 6) {
      ErrorMessage.flash("Password Harus Lebih dari 6 Digit");
    } else if (_usernameController.text == credentials.registeredUsername ||
        _passwordController.text == credentials.registeredPassword) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    } else {
      ErrorMessage.giffy(
          'Login Gagal', 'Username atau Password Tidak Valid.', context);
    }
  }
}
