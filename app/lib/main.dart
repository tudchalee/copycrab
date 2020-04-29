import 'package:flutter/material.dart';

//TODO: change home_page.dart to <your_page>.dart
import 'package:app/page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //TODO: Create your page in folder 'page' and change 'MyHomePage' to your page classname   
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
