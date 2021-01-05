import 'package:app/pong/copycrab_db.dart';
import 'package:flutter/material.dart';

bool press = true;

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
          'My Favourite Menu',
          style: TextStyle(fontFamily: 'Opun'),
        ),
      ),
      body: Column(children: <Widget>[
        FavCard(Menu(999,"Dino float", 125, "Kamu.png", {})),
        FavCard(Menu(555,"Dino float", 125, "Kamu.png", {})),
        Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 3.4,
          color: Colors.white10,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Swensens',
                        style: TextStyle(fontFamily: 'Opun', fontSize: 25)),
                    Container(
                        height: MediaQuery.of(context).size.height / 6,
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/Swensens.jpg',
                          ),
                        )),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Mango Sunday',
                        style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                    Text('Price : 165 Baht',
                        style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                    Text('Note : Add Whip',
                        style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.favorite, size: 24),
                          tooltip: 'Favorite your menu',
                          color: press
                              ? Colors.redAccent[700]
                              : Colors.grey,
                          onPressed: () =>
                              setState(() => press = !press),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          color: Colors.green[400],
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {},
                          child: Text(
                            "Order",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ]),
        ),
        Container(
            color: Colors.orangeAccent,
            alignment: Alignment(-1.0, -1.0),
            child: Text('WAIT FOR BOTTOMAPPBAR')),
      ]),
    );
  }
}

class FavCard extends StatefulWidget {
  final menu;
  FavCard(this.menu);
  @override
  _FavCardState createState() => _FavCardState(menu);
}

class _FavCardState extends State<FavCard> {
  bool _isLike = true;
  Menu _menu;
  _FavCardState(this._menu);

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 4,
          color: Colors.white10,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Kamu',
                        style: TextStyle(fontFamily: 'Opun', fontSize: 25)),
                    Container(
                        height: MediaQuery.of(context).size.height / 7,
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/${_menu.imageName}',
                          ),
                        )),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('${_menu.name}',
                        style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                    Text('Price : ${_menu.price} Baht',
                        style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                    Text('Note : -',
                        style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.favorite, size: 24),
                          tooltip: 'Favorite your menu',
                          color: _isLike
                              ? Colors.redAccent[700]
                              : Colors.grey,
                          onPressed: () =>
                              setState(() => _isLike = !_isLike),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          color: Colors.green[400],
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {},
                          child: Text(
                            "Order",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ]),
        );
  }
}