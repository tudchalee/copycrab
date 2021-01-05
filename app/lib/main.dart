import 'package:app/page/restaurant_list.dart';
import 'package:flutter/material.dart';

//TODO: change home_page.dart to <your_page>.dart
import 'package:app/page/home_page.dart';
import 'package:app/page/order_summary.dart';
import 'package:app/page/customer_payment.dart';
import 'package:app/page/fav_menu.dart';
import 'package:app/page/new_menu.dart';
import 'package:app/page/menu.dart';
import 'package:app/page/new_promo.dart';
import 'package:app/page/add_coupon.dart';

import 'package:app/pong/pong_button.dart';

import 'package:app/page/order_history.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOME',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HOME(),
    );
  }
}
class HOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              //TODO: Change 'Demo' to page name
              child: Text('Demo'),
              onPressed: () {
                Navigator.push(
                  context,
                  //TODO: Change MyHomePage to class name
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            RaisedButton(
              child: Text('Favourite Menu'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favourite()),
                );
              },
            ),
            RaisedButton(
              child: Text('Order Summary'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderSummary()),
                );
              },
            ),
            RaisedButton(
              child: Text('New Menu'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewMenu()),
                );
              },
            ),
            RaisedButton(
              child: Text('New Promotion'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPromo()),
                );
              },
            ),
            RaisedButton(
              child: Text('Current Menu'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
              },
            ),
            RaisedButton(
              child: Text('Add Coupon'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCoupon()),
                );
              },
            ),
            RaisedButton(
              child: Text('Customer Payment'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomerPayment()),
              );
              },),
            RaisedButton(
              child: Text('Order History'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderHistory()),
              );
              },
              ),
            RaisedButton(
              child: Text('Pong Button'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PongButtons()),
              );
              },
            ),
            RaisedButton(
              child: Text('Restaurants'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectRestaurant()),
              );
              },
            ),
          ],
        ),
      ),
    );
  }
}
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}