// import 'package:basicPhisyc/src/screens/count_area_screen.dart';
import 'package:basicPhisyc/src/screens/count_area_screen.dart';
import 'package:basicPhisyc/src/screens/count_volume_screen.dart';
import 'package:basicPhisyc/src/screens/weight_converter_screen.dart';
import 'package:flutter/material.dart';
import 'package:basicPhisyc/src/helpers/data_lists.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget menuCard(data) {
    return FlatButton(
        onPressed: () => {_tapCard(data.title)},
        child: Container(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              // width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 15.0, top: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0x59B33771), Color(0xff6D214F)]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/3d-modeling.png'),
                        ))),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 160,
                        child: Text(
                          data.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ),
                      Container(
                        width: 160,
                        child: Text(
                          data.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.black,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          // height: MediaQuery.of(context).size.height * .4,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff6D214F), Color(0xff6D214F)])),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                    width: MediaQuery.of(context).size.width * .6,
                    height: MediaQuery.of(context).size.width * .6,
                    decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                      image: AssetImage(
                          'assets/animate/animation_500_counting.gif'),
                    ))),
              ),
              Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("Mari Berhitung Fisika Dasar",
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Colors.white)))),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.width * .6) -
              91,
          child: ListView(
              scrollDirection: Axis.vertical,
              children: dataList.map((item) {
                return menuCard(item);
              }).toList()),
        ),
      ],
    ));
  }

  void _tapCard(choosen) {
    if (choosen == 'Konversi Nilai') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        // return CountAreaScreen();
        return WeightConverterScreen();
      }));
    } else if (choosen == 'Hitung Luas') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        // return CountAreaScreen();
        return CountAreaScreen();
      }));
    } else if (choosen == 'Hitung Volume') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        // return CountAreaScreen();
        return CountVolumeScreen();
      }));
    }
  }

  List<DataList> dataList = [
    DataList(
      title: 'Hitung Luas',
      description: 'Persegi panjang',
      image: 'assets/animate/animation_500_counting.gif',
    ),
    DataList(
      title: 'Hitung Volume',
      description: 'Balok',
      image: 'assets/animate/animation_500_counting.gif',
    ),
    DataList(
      title: 'Konversi Nilai',
      description: 'Ukuran Berat',
      image: 'assets/animate/animation_500_counting.gif',
    ),
  ];
}
