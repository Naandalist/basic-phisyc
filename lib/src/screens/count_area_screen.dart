import 'package:flutter/material.dart';
import 'package:basicPhisyc/src/helpers/error_messages.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class CountAreaScreen extends StatefulWidget {
  @override
  _CountAreaScreenState createState() => _CountAreaScreenState();
}

class _CountAreaScreenState extends State<CountAreaScreen> {
  final TextStyle inputStyle = TextStyle(
    fontSize: 18,
    color: Colors.black87,
    fontFamily: "Nunito",
    fontWeight: FontWeight.w700,
  );

  final TextStyle labelStyle = TextStyle(
    fontSize: 20,
    color: Colors.black,
  );

  TextEditingController _panjangController = TextEditingController();
  TextEditingController _lebarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Hitung Luas Persegi'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacer(),
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              style: inputStyle,
              decoration: InputDecoration(
                  hintText: "Panjang persegi dalam satuan meter",
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff6D214F), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff6D214F), width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFFFFF),
                  filled: true),
              onChanged: (text) {},
            ),
            Spacer(),
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              style: inputStyle,
              decoration: InputDecoration(
                  hintText: "Lebar persegi dalam satuan meter",
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff6D214F), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff6D214F), width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFFFFF),
                  filled: true),
              onChanged: (text) {},
            ),
            Spacer(
              flex: 1,
            ),
            FlatButton(
              color: Colors.white,
              onPressed: () {
                _validateAndCount(
                    _panjangController.text, _lebarController.text);
              },
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
                child: Text('Hitung Luas',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Spacer(
              flex: 9,
            ),
          ],
        ),
      ),
    );
  }

  bool isNumeric(String string) {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

    return numericRegex.hasMatch(string);
  }

  void _validateAndCount(p, l) {
    if (p.isEmpty) {
      ErrorMessage.flashCenter("Panjang Harus Diisi");
    } else if (l.isEmpty) {
      ErrorMessage.flashCenter("Lebar Harus Diisi");
    } else if (!isNumeric(p)) {
      ErrorMessage.flashCenter("Panjang Harus Diisi Dengan Valid");
    } else if (!isNumeric(l)) {
      ErrorMessage.flashCenter("Lebar Harus Diisi Dengan Valid");
    } else if (double.parse(p) < 1) {
      ErrorMessage.flashCenter("Panjang Harus Lebih Dari 0");
    } else if (double.parse(l) < 1) {
      ErrorMessage.flashCenter("Lebar Harus Lebih Dari 0");
    } else if (double.parse(p) > 0 && double.parse(l) > 0) {
      double result = double.parse(p) * double.parse(l);
      showDialog(
          context: context,
          builder: (_) => AssetGiffyDialog(
                image: Image.asset(
                  'assets/animate/animation_men_wearing_jacket.gif',
                  fit: BoxFit.cover,
                ),
                title: Text(
                  'Luas Persegi adalah ${result.toStringAsFixed(2)} m²',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
                ),
                onlyOkButton: true,
                buttonOkColor: Color(0xff6D214F),
                onOkButtonPressed: () {
                  Navigator.of(context).pop();
                },
              ));
    } else {
      ErrorMessage.flashCenter("Nilai Input Tidak Valid");
    }
  }
}
