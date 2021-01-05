import 'package:app/pong/profile.dart';
import 'package:flutter/material.dart';
import 'package:app/pong/signup_and_login.dart';
import 'package:app/pong/edit_profile.dart';

class PongButtons extends StatelessWidget {
  final String resUsername = 'crabcafe';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text('Pong Buttons', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Opun', color: Colors.white, fontSize: 20),)
      ),
      body: Row(
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
                  context,MaterialPageRoute(builder: (context) => RestaurantProfile()));},
              child: Text('restaurant profile')
            ),
            RaisedButton(
              onPressed: (){
              Navigator.push(
                  context,MaterialPageRoute(builder: (context) => RestaurantMain()));},
              child: Text('restaurant 2')
            ),
        ],
      )      
    );
  }
}