import 'package:flutter/material.dart';
import 'package:app/pong/fav_menu_edit.dart';
import 'package:app/pong/main_customer.dart';
import 'package:app/pong/profile.dart';

class RouteCustomer extends StatefulWidget {
  final String username;
  RouteCustomer(this.username);
  @override
  _RouteCustomerState createState() => _RouteCustomerState(this.username);
}

class _RouteCustomerState extends State<RouteCustomer> {
  final String username;
  _RouteCustomerState(this.username); 

  @override   
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.orangeAccent[100],
        title: Text('Main Page', style: TextStyle(color: Colors.black, fontFamily: 'Opun'), textAlign: TextAlign.center)),*/
      //body: CustomerPage(this.username),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent[100],
        elevation: 4.0,
        icon: Icon(Icons.home, color: Colors.black, size: 20, semanticLabel: 'Home',),
        label: Text('Home', style: TextStyle(fontFamily: 'Opun', color: Colors.black),),
        onPressed: () {
        Navigator.push(
          context,MaterialPageRoute(builder: (context) => CustomerMainPage(this.username)));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.event_note, size: 20,),
              onPressed: () {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => Favourite()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person, size: 20),
              onPressed: () {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => AccountPage(this.username)));
              },
            )
          ],
        )
      ),
    );
  }
}