import 'package:flutter/material.dart';
import 'package:newApp/body/screens.dart';

main(){
  runApp(HomeApp());
}
class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authen(),
      
    );
  }
} 