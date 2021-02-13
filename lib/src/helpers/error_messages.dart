import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class ErrorMessage {
  String message, title, desc;

  static void flash(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(0xffeb3b5a),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void giffy(title, desc, context) {
    showDialog(
        context: context,
        builder: (_) => AssetGiffyDialog(
              // key: keys[5],
              image: Image.asset(
                'assets/animate/animation_500_error.gif',
                fit: BoxFit.cover,
              ),
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              entryAnimation: EntryAnimation.BOTTOM_RIGHT,
              description: Text(
                desc,
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              onlyOkButton: true,
              buttonOkColor: Color(0xff6D214F),
              onOkButtonPressed: () {
                Navigator.of(context).pop();
              },
            ));
  }
}
