import 'package:flutter/material.dart';
import 'package:flutter_assignment/screen/home_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: MyBagScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}