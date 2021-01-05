import 'package:app/controller/singleton.dart';
import 'package:flutter/material.dart';
import 'package:app/pong/copycrab_db.dart';
import 'package:app/pong/profile.dart';
import 'package:app/pong/fav_menu_edit.dart';

class SelectMenuForPromo extends StatelessWidget {
  final String username;
  SelectMenuForPromo(this.username);

  Future<String> _assign(String username) async{ //get restaurant name
    final resData = await fetchRestaurant(username);
    String resName = resData.name;
    return resName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent[100],
        title: FutureBuilder(
          future: _assign(this.username), 
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Text(snapshot.data, 
                style: TextStyle(fontFamily: 'Opun', color: Colors.black),textAlign: TextAlign.center,);
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      ),  
      body: FutureBuilder<List<Menu>>(
            future: fetchMenuByRestaurant(this.username),
            builder: (context, snapshot) {
              return snapshot.hasData? MenuForPromoList(menu: snapshot.data) : Center(child: CircularProgressIndicator()); 
            }
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent[100],
        elevation: 4.0,
        icon: Icon(Icons.home, color: Colors.black, size: 20, semanticLabel: 'Home',),
        label: Text('Home', style: TextStyle(fontFamily: 'Opun', color: Colors.black),),
      onPressed: () {
        Navigator.pop(context);
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
                  context,MaterialPageRoute(builder: (context) => AccountPage(Singleton().username)));
              },
            )
          ],
        )
      ),
    );
  }
}

class MenuForPromoList extends StatelessWidget {
  final List<Menu> menu;
  MenuForPromoList({this.menu});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //padding: EdgeInsets.all(10.0),
      separatorBuilder: (context, index) => SizedBox(
        height: 5.0,
      ),
      itemCount: menu.length,
      itemBuilder: (context,index){
        return MenuBox(menu[index]);
      });
  }
}

class MenuBox extends StatelessWidget {
  final Menu menu;
  MenuBox(this.menu);
  
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
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Expanded(
            flex: 2,
            child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(image: AssetImage('assets/foods/' + this.menu.imageName),
                                alignment: Alignment.topLeft,)),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  this.menu.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15.0,
                    fontFamily: 'Opun'
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                 this.menu.price.toString()+'.-',
                 style: TextStyle(
                   fontSize: 30.0, 
                   fontFamily: 'Opun'
                   ),
                 textAlign: TextAlign.end,
                ),
                RaisedButton(
                  //padding: EdgeInsets.only(top: 20),
                  onPressed: (){
                    Singleton().menuForPromo = this.menu;
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  child: Text('Select', style: TextStyle(fontFamily: 'Opun', color: Colors.white),))
              ]
            ) 
          )
        ],
      ) ,
      )
    );
  }
}