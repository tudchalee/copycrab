import 'package:app/controller/singleton.dart';
import 'package:app/pong/list_menu.dart';
import 'package:app/pong/main_customer.dart';
import 'package:app/pong/signup_and_login.dart';
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
      title: 'COPY CRAB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => HOME(),
      '/login' : (context) => SignInPage(),
      '/register' : (context) => SignUpPage(),
      '/selectRestaurant' : (context) => CustomerMainPage(Singleton().username),
      '/selectMenu' : (context) => ListMenuPage(Singleton().currentOrder.restaurant),
      '/orderSummary' : (context) => OrderSummary(),
      '/currentMenu' : (context) => MenuPage(),
      '/addMenu' : (context) => NewMenu(Singleton().username),


    });
  }
}
class HOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('HOME'),
      ),*/
      backgroundColor: Colors.orangeAccent[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Image(image: AssetImage('crabcrab.jpg'),),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.pink,
              child: Text('Let\'s start !', style: TextStyle(fontFamily: 'Opun',color: Colors.white),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
            ),/*
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
                  MaterialPageRoute(builder: (context) => NewMenu(Singleton().username)),
                );
              },
            ),
            RaisedButton(
              child: Text('New Promotion'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPromo(Singleton().username)),
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
              child: Text('Final'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
              );
              },
            ),*/
          ],
        ),
      ),
    );
  }
}