import 'package:flutter/material.dart';

class GetorderDriver extends StatefulWidget {
  @override
  _GetorderDriverState createState() => _GetorderDriverState();
}

class _GetorderDriverState extends State<GetorderDriver> {
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
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(
              width: 400,
              decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amber[200],
                      ),
              child: Column(
                  children: <Widget>[
                    Text('Delivery Location',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 18,
                        )),
                    Text('ชั้น 6 ตึกแดง KMUTT    2.6 KM.',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 16,
                        )),
                  ]),
            ),  
          ],
        )),
          SizedBox(height: 20),
          Container(
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.amber[200],),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text('Order item(s)',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 18,
                        )),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        height: MediaQuery.of(context).size.height / 6,
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset('assets/Kamu.png',),
                           ),
                        ),
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.lightBlue[100],
                             ),
                          child: Text('Quantity : 1',style: TextStyle(fontFamily: 'Opun',fontSize: 16,),),
                        ),
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.lightBlue[100],
                             ),
                          child: Text('Note : ไม่ใส่พริก',style: TextStyle(fontFamily: 'Opun',fontSize: 16,),),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(
              width: 400,
              decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amber[200],
                      ),
              child: Column(
                  children: <Widget>[
                    Text('Payment Details',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 18,
                        )),
                    Text('Price',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 15,
                        )),
                    Text('Discount',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 15,
                        )),
                    Text('Delivery fee',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 15,
                        )),
                    Text('Total',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 16,
                        )),
                  ]),
            ),  
          ],
        )),
          SizedBox(height: 20),
           Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          RaisedButton(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.lightGreenAccent[700],
            onPressed: () {},
            child: Text("ACCEPT",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ),
          RaisedButton(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.red[700],
            onPressed: () {},
            child: Text("DECLINE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ),
            ],
          ),
        ),
        ],
      ),
    );
  }
}