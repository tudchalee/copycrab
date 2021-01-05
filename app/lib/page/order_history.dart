import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}
bool like = false;
class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'My Orders',
          style: TextStyle(fontFamily: 'Opun'),
        ),
      ),
      body: Column(children: <Widget>[
        FavCard(rest: 'After You', imagePath: 'a.jpg',date:'07-May-2020  17:40',orderid :'OrderID #1011', menu: 'Caramel Pancake', price: 125, note: 'Add Syrup'),
        FavCard(rest: 'Acai Story', imagePath: 'acai2.jpg',date:'10-May-2020  13:35',orderid :'OrderID #1523', menu: 'Acai Bowl', price: 85, note: '-'),
        Container(
            color: Colors.orangeAccent,
            alignment: Alignment(-1.0, -1.0),
            child: Text('WAIT FOR BOTTOMAPPBAR')),
      ]),
    );
  }
}

class FavCard extends StatelessWidget {
  const FavCard({
    Key key, this.rest, this.imagePath, this.date, this.orderid, this.menu, this.price, this.note,
  }) : super(key: key);

  final rest, imagePath, date, orderid, menu, price, note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 3,
      color: Colors.white10,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('$rest', style: TextStyle(fontFamily: 'Opun', fontSize: 25)),
                Container(
                    height: MediaQuery.of(context).size.height / 6,
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/$imagePath',
                      ),
                    )
                    ),
                    Text('$date', style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('$orderid',
                    style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                Text('$menu',
                    style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                Text('Price : $price Baht',
                    style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                Text('Note : $note',
                    style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)),
                  color: Colors.green[400],
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {},
                  child: Text(
                    "Order again",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            )
          ]
        ),
    );
  }
}
