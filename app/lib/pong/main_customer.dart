import 'package:flutter/material.dart';
import 'package:app/pong/copycrab_db.dart';
import 'package:app/pong/profile.dart';
import 'package:app/pong/list_menu.dart';
import 'package:app/pong/fav_menu_edit.dart';

class CustomerPage extends StatelessWidget {
  final String username;
  CustomerPage(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent[100],
        title: Text('Main Page', style: TextStyle(color: Colors.black, fontFamily: 'Opun'), textAlign: TextAlign.center)),
      body: FutureBuilder<List<Restaurant>>(
            future: fetchListRestaurant(),
            builder: (context, snapshot) {
              return snapshot.hasData? RestaurantList(restaurants: snapshot.data, cusUser: this.username) : Center(child: CircularProgressIndicator()); 
            }
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent[100],
        elevation: 4.0,
        icon: Icon(Icons.home, color: Colors.black, size: 20, semanticLabel: 'Home',),
        label: Text('Home', style: TextStyle(fontFamily: 'Opun', color: Colors.black),),
      onPressed: () {
        Navigator.push(
          context,MaterialPageRoute(builder: (context) => CustomerPage(this.username)));
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

class RestaurantList extends StatelessWidget {
  final List<Restaurant> restaurants;
  final String cusUser;
  RestaurantList({this.restaurants, this.cusUser});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //padding: EdgeInsets.all(10.0),
      separatorBuilder: (context, index) => SizedBox(
        height: 5.0,
      ),
      itemCount: restaurants.length,
      itemBuilder: (context,index){
        return RestaurantBox(restaurants[index],cusUser);
      });
  }
}

class RestaurantBox extends StatelessWidget {
  final Restaurant restaurant;
  final String cusUser;
  RestaurantBox(this.restaurant, this.cusUser);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      padding: EdgeInsets.only(left:20, right: 20),
      child: Card(
        color: Colors.white10,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: RaisedButton(onPressed: (){
          Navigator.push(
          context,MaterialPageRoute(builder: (context) => ListMenuPage(this.restaurant.username, this.cusUser)));
        },
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Expanded(
              flex: 2,
              child: ClipRRect(
                    child: Icon(Icons.restaurant, size: 100, color: Colors.black)),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    this.restaurant.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15.0,
                      fontFamily: 'Opun'
                    ),
                  ),
                //Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                /*FutureBuilder(
                  future: _assign(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return Text(snapshot.data,
                          style: TextStyle(
                          fontSize: 13.0, 
                          fontFamily: 'Opun'
                          ),
                          //textAlign: TextAlign.end,
                          );
                    }
                    else {
                      return Center(child: CircularProgressIndicator(),);
                    }
                  }),*/
              ],
              ),
            ),
            ),
        ],
        ) ,)
        )
    );
  }
}