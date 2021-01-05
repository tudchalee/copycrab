import 'package:app/page/menu_card.dart';
import 'package:app/pong/profile.dart';
import 'package:flutter/material.dart';
import 'package:app/pong/signup_and_login.dart';
import 'package:app/pong/edit_profile.dart';
import 'package:app/pong/order_detail.dart';
import 'package:app/pong/test_menu_widget.dart';
import 'package:app/pong/summary_driver.dart';
import 'package:app/pong/getorder_driver.dart';
import 'package:app/page/mainRolePage.dart';

class PongButtons extends StatelessWidget {
  final String resUsername = 'crabcafe';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text('Pong Buttons', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Opun', color: Colors.white, fontSize: 20),)
      ),
      body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
              Navigator.push(
                  context,MaterialPageRoute(builder: (context) => SignInPage()));},
              child: Text('sign up and log in')
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            RaisedButton(
              onPressed: (){
              Navigator.push(
                  context,MaterialPageRoute(builder: (context) => EditRestaurantAccount(resUsername)));},
              child: Text('edit restaurant')
            ),            
            Padding(padding: EdgeInsets.all(5.0)),
            RaisedButton(
              onPressed: (){
              Navigator.push(
                  context,MaterialPageRoute(builder: (context) => SelectPaymentMethod()));},
              child: Text('order detail')
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            RaisedButton(
              onPressed: (){
              Navigator.push(
                  context,MaterialPageRoute(builder: (context) => MenuCardWidget()));},
              child: Text('test menu widget')
            ),
            RaisedButton(
              onPressed: (){
              Navigator.push(
                  context,MaterialPageRoute(builder: (context) => CustomerMainPage('chinnxz')));},
              child: Text('summary driver')
            ),
            RaisedButton(
              onPressed: (){
              Navigator.push(
                  context,MaterialPageRoute(builder: (context) => GetorderDriver()));},
              child: Text('get order driver')
            ),
            RaisedButton(
              child: Text('Res main page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantMainPage('crabcafe')),
              );
              },
            ),
        ],
      )      
    );
  }
}