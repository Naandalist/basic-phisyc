import 'package:flutter/material.dart';
import 'package:basicPhisyc/src/helpers/bezier_container.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:basicPhisyc/src/helpers/error_messages.dart';

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
    // print(height * 0.05);
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
      ErrorMessage.flash("Username & Password field can't empty");
    } else if (_usernameController.text.isEmpty) {
      ErrorMessage.flash("Username field can't empty");
    } else if (_passwordController.text.isEmpty) {
      ErrorMessage.flash("Password field can't empty");
    } else if (_passwordController.text.length < 6) {
      ErrorMessage.flash("Password field can't less than 6 digits");
    } else {
      // print('Ready to login');
      ErrorMessage.giffy(
          'Login Failed', 'Invalid Username or Password.', context);
      // _errorGiffyMessage('Login Failed', 'Invalid Username or Password.')

    }
  }

  // void _errorFlashMessage(message) {
  //   Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Color(0xffeb3b5a),
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  // void _errorGiffyMessage(title, desc) {
  //   showDialog(
  //       context: context,
  //       builder: (_) => AssetGiffyDialog(
  //             // key: keys[5],
  //             image: Image.asset(
  //               'assets/animate/animation_500_error.gif',
  //               fit: BoxFit.cover,
  //             ),
  //             title: Text(
  //               title,
  //               textAlign: TextAlign.center,
  //               style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
  //             ),
  //             entryAnimation: EntryAnimation.BOTTOM_RIGHT,
  //             description: Text(
  //               desc,
  //               textAlign: TextAlign.center,
  //               style: TextStyle(),
  //             ),
  //             onlyOkButton: true,
  //             buttonOkColor: Color(0xff6D214F),
  //             onOkButtonPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ));
  // }
}
