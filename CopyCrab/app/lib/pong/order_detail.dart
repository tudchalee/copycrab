import 'package:flutter/material.dart';

class SelectPaymentMethod extends StatefulWidget {
  @override
  _SelectPaymentMethodState createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  bool cashVal = false;
  bool promptVal = false;
  bool walletVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[100],
        title: Text('Payment Method', style: TextStyle(color: Colors.black, fontFamily: 'Opun'), textAlign: TextAlign.center)),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(20.0)),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Transform.scale(
                      scale: 1.5,
                      child: Checkbox(value: cashVal, onChanged: (bool value) {
                        setState(() {
                        cashVal = value;
                     });
                    }));
                  }),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Image(image: AssetImage('assets/cash.png'), width: 100, height: 100),
                      Text('CASH', style: TextStyle(fontFamily: 'Opun', fontSize: 20))
                ],),
                )     
              ],
            ),
            Expanded(
              child: Divider(
              height: 0.25,
              thickness: 0.75,
              color: Colors.grey
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(20.0)),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Transform.scale(
                      scale: 1.5,
                      child: Checkbox(value: promptVal, onChanged: (bool value) {
                        setState(() {
                        promptVal = value;
                     });
                    }));
                  }),
                Expanded(
                  child: Image(image: AssetImage('assets/prompt.png'),width: 100, height: 100))
              ],
            ),
            Expanded(
              child: Divider(
              height: 0.25,
              thickness: 0.75,
              color: Colors.grey
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(20.0)),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Transform.scale(
                      scale: 1.5,
                      child: Checkbox(value: walletVal, onChanged: (bool value) {
                        setState(() {
                        walletVal = value;
                     });
                    }));
                  }),
                Expanded(
                  child: Image(image: AssetImage('assets/wallet.png'),width: 100, height: 100))
              ],
            ),
            SizedBox(
              height: 20
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: 250,
                  height: 80,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    color: Colors.lightGreenAccent[700],
                    onPressed: () {},
                    child: Text("CONFIRM",
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Opun'
                    )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: 250,
                  height: 80,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    color: Colors.red,
                    onPressed: () {},
                    child: Text("CANCEL",
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Opun'
                    )),
                  ),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}