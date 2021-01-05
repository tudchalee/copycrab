import 'package:app/controller/singleton.dart';
import 'package:app/page/order_history.dart';
import 'package:flutter/material.dart';
import 'package:app/pong/copycrab_db.dart';
import 'package:app/pong/profile.dart';
import 'package:app/pong/fav_menu_edit.dart';
import 'package:app/page/mainRolePage.dart';

class ListMenuPage extends StatelessWidget {
  final String username;
  ListMenuPage(this.username);

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
              return snapshot.hasData? MenuList(menu: snapshot.data) : Center(child: CircularProgressIndicator()); 
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

class MenuList extends StatelessWidget {
  final List<Menu> menu;
  MenuList({this.menu});

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
  
  /*Future<String> _assign() async{
    var res = this.menu.restaurant.values.toList();
    final resData = await fetchRestaurant(res[0]);
    String resName = resData.name;
    return resName;
  }*/

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
                    Singleton().addOrderMenu(menu.id);
                    Singleton().currentOrder.subTotal += menu.price;
                    Navigator.pushNamed(context, '/orderSummary');
                  },
                  color: Colors.green,
                  child: Text('Order', style: TextStyle(fontFamily: 'Opun', color: Colors.white),))
              ]
            ) 
          )
        ],
      ) ,
      )
    );
  }
}

class ListMenuPageForRest extends StatelessWidget {
  final String username;
  ListMenuPageForRest(this.username);

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
              return snapshot.hasData? MenuListForRest(menu: snapshot.data) : Center(child: CircularProgressIndicator()); 
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
                  context,MaterialPageRoute(builder: (context) => OrderHistory()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person, size: 20),
              onPressed: () {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => RestaurantMainPage(this.username)));
              },
            )
          ],
        )
      ),
    );
  }
}

class MenuListForRest extends StatefulWidget {
  final List<Menu> menu;
  MenuListForRest({this.menu});

  @override
  _MenuListForRestState createState() => _MenuListForRestState(menu: this.menu);
}

class _MenuListForRestState extends State<MenuListForRest> {

  final List<Menu> menu;
  _MenuListForRestState({this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: menu.length > 0
          ? ListView.builder(
              itemCount: menu.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      deleteMenu(menu[index].id);
                      menu.removeAt(index);
                    });
                  },
                  secondaryBackground: Container(
                    child: Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.red,
                  ),
                  background: Container(),
                  child: MenuBoxForRest(menu: menu[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('No Items')),
    ); 
  }
}

class MenuBoxForRest extends StatelessWidget {
  final Menu menu;
  MenuBoxForRest({this.menu});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
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
              ]
            ) 
          )
        ],
      ) ,
      )
    );
  }
}

class ListMenuPromoPageForRest extends StatelessWidget {
  final String username;
  ListMenuPromoPageForRest(this.username);

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
      body: FutureBuilder<List<MenuPromotion>>(
            future: fetchMenuPromotionByRes(this.username),
            builder: (context, snapshot) {
              return snapshot.hasData? MenuPromoListForRest(menuPromotion: snapshot.data) : Center(child: CircularProgressIndicator()); 
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
                  context,MaterialPageRoute(builder: (context) => OrderHistory()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person, size: 20),
              onPressed: () {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => RestaurantMainPage(this.username)));
              },
            )
          ],
        )
      ),
    );
  }
}

/*class MenuPromoListForRest extends StatelessWidget {
  final List<MenuPromotion> menuPromotion;
  MenuPromoListForRest({this.menuPromotion});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //padding: EdgeInsets.all(10.0),
      separatorBuilder: (context, index) => SizedBox(
        height: 5.0,
      ),
      itemCount: menuPromotion.length,
      itemBuilder: (context,index){
        return MenuPromoBoxForRest(menuPromotion[index]);
      });
  }
}*/

class MenuPromoListForRest extends StatefulWidget {
  final List<MenuPromotion> menuPromotion;
  MenuPromoListForRest({this.menuPromotion});

  @override
  _MenuPromoListForRestState createState() => _MenuPromoListForRestState(menuPromotion: this.menuPromotion);
}

class _MenuPromoListForRestState extends State<MenuPromoListForRest> {

  final List<MenuPromotion> menuPromotion;
  _MenuPromoListForRestState({this.menuPromotion});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: menuPromotion.length > 0
          ? ListView.builder(
              itemCount: menuPromotion.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      deletePromo(menuPromotion[index].id);
                      menuPromotion.removeAt(index);
                    });
                  },
                  secondaryBackground: Container(
                    child: Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.red,
                  ),
                  background: Container(),
                  child: MenuPromoBoxForRest(menuPromotion[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('No Items')),
    ); 
  }
}

class MenuPromoBoxForRest extends StatelessWidget {
  final MenuPromotion menuPromotion;
  MenuPromoBoxForRest(this.menuPromotion);

  Future <List<Menu>> _assignMenu() async{
    var menu = this.menuPromotion.menu.values.toList();
    final List<Menu> menuData = await fetchMenuByID(menu[0]);
    return menuData;
  }

  Future<Promotion> _assignPromotion() async{
    var promotion = this.menuPromotion.promotion.values.toList();
    final Promotion promoData = await fetchPromotionByCode(promotion[0]);
    return promoData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 150,
      padding: EdgeInsets.only(left:20, right: 20),
      child: Card(
        color: Colors.white10,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: FutureBuilder(
            future: _assignMenu(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                List<Menu> menuData = snapshot.data;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(image: AssetImage('assets/foods/' + menuData[0].imageName),
                                          alignment: Alignment.topLeft,)),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            menuData[0].name,
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
                    FutureBuilder(
                      future: _assignPromotion(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData) {
                          Promotion menuPromo = snapshot.data;
                          return Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                menuPromo.code.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 30.0, 
                                  fontFamily: 'Opun'
                                  ),
                                textAlign: TextAlign.end,
                                ),
                                Text(
                                "Exp. Date: ${this.menuPromotion.expiredDate.year}-${this.menuPromotion.expiredDate.month}-${this.menuPromotion.expiredDate.day}",
                                style: TextStyle(
                                  fontSize: 20, 
                                  fontFamily: 'Opun'
                                  ),
                                textAlign: TextAlign.end,
                                ),
                              ]
                            ) 
                          );
                        }
                        else
                        {
                          return Center(child: CircularProgressIndicator(),);
                        }
                      }),
                    ]
                );
              }
              else {
                return Center(child: CircularProgressIndicator(),);
              }
            }),
        ) ,
      );
    }
}