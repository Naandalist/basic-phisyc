import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ErrorMessage {
  String message;
  static void flash(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(0xffeb3b5a),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
