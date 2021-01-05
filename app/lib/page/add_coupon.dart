import 'package:flutter/material.dart';

class AddCoupon extends StatefulWidget {
  @override
  _AddCouponState createState() => _AddCouponState();
}

class _AddCouponState extends State<AddCoupon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text(
            'Get Voucher',
            style: TextStyle(fontFamily: 'Opun'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 3.6,
              color: Colors.white10,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height / 5.06,
                            color: Colors.white10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                'assets/Fuji.png',
                              ),
                            )),
                        Text('Expired Date : 31-04-2020',
                            style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Get 1 Free 1 @Fuji',
                            style: TextStyle(fontFamily: 'Opun', fontSize: 18)),
                        Text('Limit 1 per account',
                            style: TextStyle(fontFamily: 'Opun', fontSize: 18)),
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          hoverColor: Colors.greenAccent[400],
                          fillColor: Colors.white,
                          child: Icon(
                            Icons.add,
                            size: 35.0,
                          ),
                          padding: EdgeInsets.all(10.0),
                          shape: CircleBorder(),
                        )
                      ],
                    )
                  ]),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 3.6,
              color: Colors.white10,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height / 5.06,
                            color: Colors.white10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                'assets/CoCo.png',
                              ),
                            )),
                        Text('Expired Date : 31-08-2020',
                            style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Free Drinks @CoCo',
                            style: TextStyle(fontFamily: 'Opun', fontSize: 18)),
                        Text('Limit 2 per account',
                            style: TextStyle(fontFamily: 'Opun', fontSize: 18)),
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          hoverColor: Colors.greenAccent[400],
                          fillColor: Colors.white,
                          child: Icon(
                            Icons.add,
                            size: 35.0,
                          ),
                          padding: EdgeInsets.all(10.0),
                          shape: CircleBorder(),
                        )
                      ],
                    )
                  ]),
            ),
          ],
        ));
  }
}
