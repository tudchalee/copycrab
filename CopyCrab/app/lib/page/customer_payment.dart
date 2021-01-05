import 'package:flutter/material.dart';
import 'package:app/pong/copycrab_db.dart';

class CustomerPayment extends StatefulWidget {
  @override
  _CustomerPaymentState createState() => _CustomerPaymentState();
}

class _CustomerPaymentState extends State<CustomerPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Restaurant', style: TextStyle(fontFamily: 'Opun'),),
      ),
      body: Column(
        children: <Widget> [
          //wait database 
          Container(
             width: 300,
             height: 50,
             child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                color: Colors.lightGreenAccent[700],
                onPressed: (){
                },
                child: Text(
                     "ORDER",
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                  )
                ),
             ),
                        ),
        ]
      ),
    );
  }
}