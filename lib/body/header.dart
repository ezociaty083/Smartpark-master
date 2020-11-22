import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  Map<dynamic, dynamic> iotmap;
  int sensorInt1, sensorInt2;

  String sensorStatus1;
  String strsensor1 = 'Wait Status!';
  String strsensor2 = 'Wait Status!';

  @override
  void initState() {
    super.initState();
    getValueFirebase();
  }

  void getValueFirebase() async {
    DatabaseReference databaseReference =
        await firebaseDatabase.reference().once().then((objValue) {
      iotmap = objValue.value;
      setState(() {
        sensorInt1 = iotmap['channel_1'];
        sensorInt2 = iotmap['channel_2'];

        if (sensorInt1 == 1) {
          strsensor1 = 'ไม่ว่าง';
        } else {
          strsensor1 = 'ว่าง';
        }

        if (sensorInt2 == 1) {
          strsensor2 = 'ไม่ว่าง';
        } else {
          strsensor2 = 'ว่าง';
        }
        print("Sensor1 = $sensorInt1");
        print("Sensor2 = $sensorInt2");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.2 - 80,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 5),
                        blurRadius: 50,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'PARKING SPACE',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top:10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildChannel('Channel 1', '$strsensor1'),
            buildChannel('Channel 2', ' $strsensor2'),
          ],
        ),

        // Padding(
        //   padding: const EdgeInsets.only(top: 15, left: 150),
        //   child: Row(
        //     children: <Widget>[
        //     ],
        //   ),
        // )
      ],
    );
  }
}

Widget buildChannel(String title, String sensor) {
  return Row(
    children: <Widget>[
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.blueGrey[300],
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: Colors.blueGrey[200]),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[800],
                offset: Offset(0, 2),
                blurRadius: 20,
              )
            ]),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              '$title',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            // Spacer(),
            Text(
              '$sensor',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ],
  );
}
