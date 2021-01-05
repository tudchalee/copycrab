import 'package:app/controller/singleton.dart';
import 'package:app/page/order_history.dart';
import 'package:flutter/material.dart';
import 'package:app/pong/copycrab_db.dart';
import 'package:app/pong/profile.dart';
import 'package:app/pong/list_menu.dart';
import 'package:app/pong/fav_menu_edit.dart';
import 'package:app/page/new_menu.dart';
import 'package:app/pong/edit_profile.dart';
import 'package:app/page/new_promo.dart';
import 'package:app/pong/signup_and_login.dart';

class CustomerMainPage extends StatelessWidget {
  final String username;
  CustomerMainPage(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orangeAccent[100],
          title: Text('Main Page',
              style: TextStyle(color: Colors.black, fontFamily: 'Opun'),
              textAlign: TextAlign.center)),
      body: FutureBuilder<List<Restaurant>>(
          future: fetchListRestaurant(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? RestaurantList(
                    restaurants: snapshot.data, cusUser: this.username)
                : Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent[100],
        elevation: 4.0,
        icon: Icon(
          Icons.home,
          color: Colors.black,
          size: 20,
          semanticLabel: 'Home',
        ),
        label: Text(
          'Home',
          style: TextStyle(fontFamily: 'Opun', color: Colors.black),
        ),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => CustomerMainPage(this.username)));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.event_note,
              size: 20,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrderHistory()));
            },
          ),
          IconButton(
            icon: Icon(Icons.person, size: 20),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountPage(this.username)));
            },
          )
        ],
      )),
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
        itemBuilder: (context, index) {
          return RestaurantBox(restaurants[index], cusUser);
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
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Card(
            color: Colors.white10,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: RaisedButton(
              onPressed: () {
                Singleton()
                  ..currentOrder.restaurant = this.restaurant.username
                  ..currentOrder.customer = Singleton().username;
                Navigator.pushNamed(context, '/selectMenu');
              },
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                  Container(
                    height: 100,
                    child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/animals.png',
                ),
              )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        this.restaurant.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20.0,
                            fontFamily: 'Opun'),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

class RestaurantMainPage extends StatefulWidget {
  final String username;
  RestaurantMainPage(this.username);
  @override
  _RestaurantMainPageState createState() => _RestaurantMainPageState(this.username);
}

class _RestaurantMainPageState extends State<RestaurantMainPage> {
  String username;
  _RestaurantMainPageState(this.username);
  
  Future<Restaurant> _assignResName(String username) async{ //use to find restaurant's name
    final resData = await fetchRestaurant(username);
    return resData;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Copycrab', style: TextStyle(fontFamily: 'Opun', color: Colors.black), textAlign: TextAlign.center,)
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10
            ),
            Row(
              children: <Widget>[
                Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/person-male.png'),
                    fit: BoxFit.fill,
                  )
                 )
                ),
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.lightBlue[100],),
                    child: FutureBuilder(
                      future: _assignResName(this.username),
                        builder: (context, snapshot) {
                        if(snapshot.hasData){
                          Restaurant restaurant = snapshot.data;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(restaurant.name.toUpperCase(), 
                              style: TextStyle(
                                fontFamily: 'Opun', 
                                color: Colors.black,
                                fontSize: 20, 
                                fontWeight: FontWeight.w500), 
                                textAlign: TextAlign.center,),
                              Container(
                                width: 45,
                                height: 45,
                                child: Card(
                                  color: Colors.orangeAccent,
                                  child: IconButton(
                                    icon: Icon(Icons.edit), 
                                  onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditRestaurantAccount(restaurant.username)));
                            },)),
                          ),
                          ] ,
                        );
                      }
                    else {
                      return Center(child: CircularProgressIndicator(),);
                      }
                    }
                  )
                ),   
              ],
            ),
            SizedBox(
              height: 10
            ),
                 
            SizedBox(
              height: 10,
            ),           
            RandomMenuPromo(this.username),                 
            SizedBox(
              height: 10,
            ),            
            RandomMenu(this.username),   
          ]
      )
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent[100],
        elevation: 4.0,
        icon: Icon(
          Icons.home,
          color: Colors.black,
          size: 20,
          semanticLabel: 'Home',
        ),
        label: Text(
          'Home',
          style: TextStyle(fontFamily: 'Opun', color: Colors.black),
        ),
        onPressed: () {
          //Navigator.push(context,MaterialPageRoute(builder: (context) => RestaurantMain(this.username)));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.event_note,
              size: 20,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrderHistory()));
            },
          ),
          IconButton(
            icon: Icon(Icons.person, size: 20),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RestaurantMainPage(this.username)));
            },
          )
        ],
      )),
    );
  }
}

class RandomMenu extends StatelessWidget {
  
  final String username;
  RandomMenu(this.username);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMenuByRestaurant(this.username),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return ListRandomMenu(menus: snapshot.data);
        }
        else {
          return Center(child: CircularProgressIndicator(),);
        }
      });
  }
}

class ListRandomMenu extends StatelessWidget {
  final List<Menu> menus;
  ListRandomMenu({this.menus});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: 475,
            height: 170,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.orange[100],),
            child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget> [
                            Text('Menu', style: TextStyle(fontFamily: 'Opun', color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700),),
                            IconButton(
                              icon: Icon(Icons.add_circle_outline), 
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => NewMenu(Singleton().username)),);
                              },
                            ),
                          ]
                        )
                      ),
                      FlatButton(
                        onPressed: (){}, 
                        child: Text('see more', style: TextStyle(fontFamily: 'Opun', color: Colors.grey)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: listMyMenus(this.menus)
                  ),
                ]
              )
    );
  }
}

class MenuCard extends StatelessWidget {
  final Menu menu;
  MenuCard(this.menu);

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 120,
            height: 120,
            child:  Card(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
               child : Column(
                 children: <Widget> [
                    Expanded(
                      flex:3,
                      child: Image.asset('assets/foods/'+this.menu.imageName, fit: BoxFit.fitWidth, width: 120, height: 120,),),
                    Expanded(
                      flex: 1, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.menu.name, style: TextStyle(fontFamily: 'Opun', fontSize: 10, color: Colors.black, fontWeight: FontWeight.w700)),
                          Text(this.menu.price.toString(), style: TextStyle(fontFamily: 'Opun', fontSize: 10, color: Colors.black, fontWeight: FontWeight.w700))
                        ],
                      ))
                ]
              )
            )
            );
  }
}

List<Widget> listMyMenus(List<Menu> menu) {
  List<Widget> list = new List();

  if(menu.length >= 3) {
    list.add(new MenuCard(menu[0]));
    list.add(new MenuCard(menu[1]));
    list.add(new MenuCard(menu[2]));
  }
  else {
    int len = menu.length;
    for (int i=0 ; i<len ; i++){
      list.add(new MenuCard(menu[i]));
    }
  }
  return list;
}

class RandomMenuPromo extends StatelessWidget {
  
  final String username;
  RandomMenuPromo(this.username);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMenuPromotionByRes(this.username),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return ListRandomMenuPromo(menusPromo: snapshot.data);
        }
        else {
          return Center(child: CircularProgressIndicator(),);
        }
      });
  }
}

class ListRandomMenuPromo extends StatelessWidget {
  final List<MenuPromotion> menusPromo;
  ListRandomMenuPromo({this.menusPromo});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: 475,
            height: 170,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.orange[100],),
            child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget> [
                            Text('Promotion', style: TextStyle(fontFamily: 'Opun', color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700),),
                            IconButton(
                              icon: Icon(Icons.add_circle_outline), 
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => NewPromo(Singleton().username)),);
                              },
                            ),
                          ]
                        )
                      ),
                      FlatButton(
                        onPressed: (){}, 
                        child: Text('see more', style: TextStyle(fontFamily: 'Opun', color: Colors.grey)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: listMyMenusPromo(this.menusPromo)
                  ),
                ]
              )
    );
  }
}

List<Widget> listMyMenusPromo(List<MenuPromotion> menuPromo) {
  List<Widget> list = new List();

  if(menuPromo.length >= 3) {
    list.add(new MenuPromoCard(menuPromo[0]));
    list.add(new MenuPromoCard(menuPromo[1]));
    list.add(new MenuPromoCard(menuPromo[2]));
  }
  else {
    int len = menuPromo.length;
    for (int i=0 ; i<len ; i++){
      list.add(new MenuPromoCard(menuPromo[i]));
    }
  }
  return list;
}

class MenuPromoCard extends StatelessWidget {
  final MenuPromotion menuPromo;
  MenuPromoCard(this.menuPromo);

  Future <List<Menu>> _assignMenu() async{
    var menu = this.menuPromo.menu.values.toList();
    final List<Menu> menuData = await fetchMenuByID(menu[0]);
    return menuData;
  }

  Future<Promotion> _assignPromotion() async{
    var promotion = this.menuPromo.promotion.values.toList();
    final Promotion promoData = await fetchPromotionByCode(promotion[0]);
    return promoData;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
            width: 120,
            height: 120,
            padding: EdgeInsets.only(bottom: 10),
            child:  Card(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
               child :FutureBuilder(
                future: _assignMenu(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    List<Menu> menuData = snapshot.data;
                    return Column(
                            children: <Widget> [
                            Expanded(
                              flex:3,
                              child: Image.asset('assets/foods/'+ menuData[0].imageName, fit: BoxFit.fitWidth, width: 120, height: 120,),),
                            Expanded(
                              flex: 1,
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FutureBuilder(
                                    future: _assignPromotion(),
                                    builder: (context, snapshot) {
                                      if(snapshot.hasData) {
                                        Promotion promoData = snapshot.data;
                                        if(promoData.type == 'percent') {
                                           return Text('${menuData[0].name}: ลด ' + promoData.value.toString() + 'บาท', 
                                                style: TextStyle(fontFamily: 'Opun', fontSize: 8, color: Colors.black, fontWeight: FontWeight.w700));
                                        }
                                        else {
                                          return Text('${menuData[0].name}: ลด ' + promoData.value.toString() + '%', 
                                                style: TextStyle(fontFamily: 'Opun', fontSize: 8, color: Colors.black, fontWeight: FontWeight.w700));
                                        }
                                      }
                                      else {
                                        return Center(child: CircularProgressIndicator());
                                      }
                                    }
                                  ),              
                                ] ,
                              ))
                            ]
                          );
                  }
                  else {
                    print(snapshot);
                    return Center(child: CircularProgressIndicator());
                  }
                })
            )
            );
  }
}

class DriverMainPage extends StatelessWidget { //driver role account page
  final String username;
  DriverMainPage(this.username);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Account', style: TextStyle(fontFamily: 'Opun', color: Colors.black))
      ),
      body: Center(
        child: Column(
          children: <Widget> [
            FutureBuilder<Driver> (
            future: fetchDriver(username),
            builder: (context, snapshot) {
                return snapshot.hasData? DriverInfoBox(driver: snapshot.data, username: username) : Center(child: CircularProgressIndicator());
            },
            ),
            SizedBox(
            height: 50
            ),
            Container( 
              width: 450,
              height: 40,           
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                onPressed: () {},
                child: Text('Order History', style: TextStyle(fontFamily: 'Opun', fontSize: 20, fontWeight: FontWeight.w500)),
                color: Colors.blueAccent[100]
                )
            ),
            SizedBox(
              height: 10
            ),
            Container( 
              width: 450,
              height: 40,           
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                onPressed: () {},
                  child: Text('Transaction', style: TextStyle(fontFamily: 'Opun', fontSize: 20, fontWeight: FontWeight.w500)),
                color: Colors.blue[100]
              )
            ),
            SizedBox(
              height: 50
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(shape: BoxShape.circle), 
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget> [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: AssetImage('assets/customer.jpg'), 
                              fit: BoxFit.fill,
                            ),
                          ),                        
                          Opacity(
                            opacity: 0.5,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white)
                            ),),
                          FlatButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AccountPage(username)));
                            }, 
                            child: Center(
                              child: Text('SWITCH TO\n CUSTOMER',
                                textAlign: TextAlign.center, 
                                style: TextStyle(
                                  fontFamily: 'Opun',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                          ),)),)
                        ]
                      )
                    ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(shape: BoxShape.circle), 
              child: Stack(
                fit: StackFit.expand,
                children: <Widget> [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage('assets/food.jpg'), 
                          fit: BoxFit.fill,
                        ),
                        ),                        
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white)
                      ),),
                    FlatButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RestaurantMainPage(this.username)));
                      }, 
                      child: Center(
                        child: Text('APPLY TO\n RESTAURANT',
                          textAlign: TextAlign.center,  
                            style: TextStyle(
                            fontFamily: 'Opun',
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                    ),)),)
                    ]
                  )
               ),
            ],
          )
        ),
        SizedBox(
          height: 30
        ),
        Container(
          width: 200,
          height: 60,
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.deepOrangeAccent,
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
            child: Text(
              "LOG OUT",
              style: TextStyle(
                 color: Colors.white,
                 fontSize: 30,
                 fontFamily: 'Opun'
              )
            ),
          ),
          ),
          ]
        )
      )
    );
  }
}

class DriverInfoBox extends StatelessWidget { //show account info from db
  final Driver driver;
  final String username;
  DriverInfoBox({this.driver, this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 500,
            height: 100,
            child: Container(
              padding: EdgeInsets.only(left:10, right:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.person, size: 50,),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(this.driver.name, style: TextStyle(fontFamily: 'Opun', fontSize: 15, fontWeight: FontWeight.w900),),
                        Text(this.driver.email, style: TextStyle(fontFamily: 'Opun', fontSize: 10),),
                        Text(this.driver.phone, style: TextStyle(fontFamily: 'Opun', fontSize: 10),)
                      ],)
                  ),
                  Container(
                    width: 125,
                    height: 30,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        color: Colors.deepOrangeAccent,
                        onPressed: (){
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => EditDriverAccount(username)));
                        },
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Opun'
                          )
                        ),
                      ),
                  )
                ],
              ),
            )
          );
  }
}


