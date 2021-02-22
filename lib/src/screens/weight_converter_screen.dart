import 'package:flutter/material.dart';
import 'package:basicPhisyc/src/helpers/error_messages.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class WeightConverterScreen extends StatefulWidget {
  @override
  _WeightConverterScreenState createState() => _WeightConverterScreenState();
}

class _WeightConverterScreenState extends State<WeightConverterScreen> {
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
  String _startWeight;
  String _convertedWeight;
  double _numberForm;
  String _resultMessage;

  final List<String> _weightsUnit = [
    'kilogram',
    'hektogram',
    'dekagram',
    'gram',
    'desigram',
    'centigram',
    'miligram',
  ];

  final Map<String, int> _weightsUnitMap = {
    'kilogram': 0,
    'hektogram': 1,
    'dekagram': 2,
    'gram': 3,
    'desigram': 4,
    'centigram': 5,
    'miligram': 6,
  };

  dynamic _tableFormula = {
    '0': [0.000001, 0.00001, 0.0001, 0.001, 0.01, 0.1, 1],
    '1': [0.00001, 0.0001, 0.001, 0.01, 0.1, 1, 10],
    '2': [0.0001, 0.001, 0.01, 0.1, 1, 10, 100],
    '3': [0.001, 0.01, 0.1, 1, 10, 100, 1000],
    '4': [0.01, 0.1, 1, 10, 100, 1000, 10000],
    '5': [0.1, 1, 10, 100, 1000, 10000, 100000],
    '6': [1, 10, 100, 1000, 10000, 100000, 1000000],
  };

  TextEditingController _numberFormController = TextEditingController();

  void convert(double value, String from, String to) {
    int nFrom = _weightsUnitMap[from];
    int nTo = _weightsUnitMap[to];
    var multiplier = _tableFormula[nFrom.toString()][nTo];
    var result = value * multiplier;

    _resultMessage =
        '${_numberFormController.text} $_startWeight sama dengan ${result.toString()} $_convertedWeight';

    setState(() {
      _resultMessage = _resultMessage;
    });

    showDialog(
        context: context,
        builder: (_) => AssetGiffyDialog(
              image: Image.asset(
                'assets/animate/animation_men_wearing_jacket.gif',
                fit: BoxFit.cover,
              ),
              title: Text(
                _resultMessage,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              onlyOkButton: true,
              buttonOkColor: Color(0xff6D214F),
              onOkButtonPressed: () {
                Navigator.of(context).pop();
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Konversi Berat'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacer(),
            Row(
              children: [
                DropdownButton(
                  style: inputStyle,
                  hint: Text(
                    "Pilih Satuan",
                    style: inputStyle,
                  ),
                  items: _weightsUnit.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _startWeight = value;
                    });
                  },
                  value: _startWeight,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward,
                  color: Color(0xff6D214F),
                  size: 24.0,
                ),
                Spacer(),
                DropdownButton(
                  hint: Text(
                    "Pilih Satuan",
                    style: inputStyle,
                  ),
                  style: inputStyle,
                  items: _weightsUnit.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: inputStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _convertedWeight = value;
                    });
                  },
                  value: _convertedWeight,
                ),
              ],
            ),
            Spacer(),
            TextField(
              controller: _numberFormController,
              keyboardType: TextInputType.number,
              style: inputStyle,
              decoration: InputDecoration(
                  hintText: "0.00",
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
              // onChanged: (text) {
              //   var rv = double.tryParse(text);
              //   if (rv != null) {
              //     setState(() {
              //       _numberForm = rv;
              //     });
              //   }
              // },
            ),
            Spacer(
              flex: 1,
            ),
            FlatButton(
              color: Colors.white,
              onPressed: () {
                if (_startWeight == null || _convertedWeight == null) {
                  ErrorMessage.flashCenter('Satuan harus Dipilih');
                } else if (double.parse(_numberFormController.text) < 1) {
                  ErrorMessage.flashCenter('Input Harus Lebih dari Nol');
                } else if (_startWeight == _convertedWeight) {
                  ErrorMessage.flashCenter('Satuan Tidak Boleh Sama');
                } else {
                  convert(double.parse(_numberFormController.text),
                      _startWeight, _convertedWeight);
                }
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
                child: Text('Konversi Berat',
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
}
