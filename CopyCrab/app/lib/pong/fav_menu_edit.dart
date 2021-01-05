import 'package:flutter/material.dart';
import 'package:app/pong/main_customer.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Restaurant',
          style: TextStyle(fontFamily: 'Opun'),
        ),
      ),
      body: Column(children: <Widget>[
        FavCard(rest: 'Kamu', imagePath: 'Kamu.png', menu: 'Dino Float', price: 75, note: 'Add Kaimok'),
        FavCard(rest: 'Swensens', imagePath: 'Swensens.jpg', menu: 'Mango Sunday', price: 165, note: 'Add Whip'),
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
    Key key, this.rest, this.imagePath, this.menu, this.price, this.note,
  }) : super(key: key);

  final rest, imagePath, menu, price, note;

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
                Text('$rest', style: TextStyle(fontFamily: 'Opun', fontSize: 25)),
                Container(
                    height: MediaQuery.of(context).size.height / 6,
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/$imagePath',
                      ),
                    )),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                )
              ],
            )
          ]),
    );
  }
}
