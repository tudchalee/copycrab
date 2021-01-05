import 'package:flutter/material.dart';

class SummaryDriver extends StatefulWidget {
  @override
  _SummaryDriverState createState() => _SummaryDriverState();
}

class _SummaryDriverState extends State<SummaryDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Your Order',
          style: TextStyle(fontFamily: 'Opun'),
        ),
      ),
       body: ListView(children: <Widget>[
        SizedBox(height: 30,),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 400,
                padding: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue[400],
                      ),
                child: Row(
                  children: <Widget>[
                    Text('ORDER NO : 001',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 20,
                        )),
                  ]),
              )
            ],
          ),
        ),
        SizedBox(height: 30),
        Container(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 400,
              decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.cyan[100],
                      ),
              child: Column(
                  children: <Widget>[
                    Text('Total : 750 BATH',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 30,
                        )),
                    Text('Status : Paid',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 30,
                        )),
                  ]),
            ),  
          ],
        )),
        SizedBox(height: 50),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Ready to next order?',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      fontSize: 25,
                    ))
              ],
            )),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          RaisedButton(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.lightGreenAccent[700],
            onPressed: () {},
            child: Text("YES",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ),
          RaisedButton(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.red[700],
            onPressed: () {},
            child: Text("NO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ),
            ],
          ),
        ),
      ]),
    );
  }
}