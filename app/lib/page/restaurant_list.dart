import 'package:flutter/material.dart';
import 'package:app/pong/copycrab_db.dart';


class SelectRestaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[100],
        title: Text('Select a restaurant', style: TextStyle(color: Colors.black, fontFamily: 'Opun'),)
      ),
      body: FutureBuilder<List<Restaurant>>(
            future: fetchAllRestaurant(),
            builder: (context, snapshot) {
              return snapshot.hasData? RestaurantList(restaurant: snapshot.data) : Center(child: CircularProgressIndicator()); 
            }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            backgroundColor: destination.color,
            title: Text(destination.title, style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w600),)
          );
        }).toList(),
        backgroundColor: Colors.orangeAccent[100],
      ),
    );
  }
}

class RestaurantList extends StatelessWidget {
  final List<Restaurant> restaurant;
  RestaurantList({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //padding: EdgeInsets.all(10.0),
      separatorBuilder: (context, index) => SizedBox(
        height: 5.0,
      ),
      itemCount: restaurant.length,
      itemBuilder: (context,index){
        return RestaurantBox(restaurant[index]);
      });
  }
}

class RestaurantBox extends StatelessWidget {
  final Restaurant restaurant;
  RestaurantBox(this.restaurant);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.only(left:20, right: 20),
      child: Card(
        color: Colors.white10,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(image: AssetImage('assets/animals.png'),
                                alignment: Alignment.topLeft,)),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.restaurant.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    fontFamily: 'Opun'
                  ),
                  textAlign: TextAlign.start,
                ),
                //Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
              ],
              ),
            ),
        ],
      ) ,
      )
    );
  }
}

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final Color color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Order', Icons.event_note, Colors.amberAccent) ,
  Destination('Home', Icons.home, Colors.amberAccent),
  Destination('Profile', Icons.person, Colors.amberAccent),
];