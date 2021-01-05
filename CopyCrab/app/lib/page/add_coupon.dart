import 'package:app/pong/copycrab_db.dart';
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
        body: FutureBuilder<List<Voucher>>(
            future: fetchVoucher(),
            builder: (context, snapshot) {
              return snapshot.hasData? 
              Column(children: List.generate(snapshot.data.length,(index) => VoucherCard(snapshot.data[index])).toList()) : 
              Center(child: CircularProgressIndicator()); 
            }
      ),
      );
  }
}

class VoucherCard extends StatefulWidget {
  Voucher voucher;
  VoucherCard(this.voucher);
  @override
  _VoucherCardState createState() => _VoucherCardState(voucher);
}

class _VoucherCardState extends State<VoucherCard> {
  bool isAdd = false;
  Voucher voucher;
  _VoucherCardState(this.voucher);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                                'assets/animals.png',
                              ),
                            )),
                        Text('${voucher.expired}',
                            style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Text('code: ${voucher.code}',
                            style: TextStyle(fontFamily: 'Opun', fontSize: 18)),
                        Text('${voucher.detail}',
                                  style: TextStyle(fontFamily: 'Opun', fontSize: 18),
                                  overflow: TextOverflow.clip,
                                  softWrap: true,),
                        Padding(padding: EdgeInsets.only(top: 15)),
                        isAdd ? Container(): RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              postVoucher(voucher.code);
                              isAdd = true;
                            });
                          },
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
            );
  }
}