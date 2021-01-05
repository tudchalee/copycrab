import 'package:flutter/material.dart';

class MenuCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: 150,
      height: 150,
      child:  Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child : Column(
          children: <Widget> [
            Expanded(
              flex: 3,
              child: Image.asset('assets/foods/chanom.jpg', fit: BoxFit.fitWidth, width: 150, height: 150,),),
            Expanded(flex: 1, child: Text('อาหาร'))
          ]
        )
      ),
    ),
    );
    
    
    
    /*;*/
  }
}