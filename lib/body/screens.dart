
import 'package:flutter/material.dart';
import 'package:newApp/body/header.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}
class _AuthenState extends State<Authen> {

Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Header(),
      backgroundColor: Colors.blueGrey[100],
    );
  }
  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: Color(0xff5556666),
      title: Text('SMARTPARK'),
      leading: Icon(
            Icons.home,
            size: 30,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Authen(),
                ),
              );
            },
          ),
        ]
    );
}
}