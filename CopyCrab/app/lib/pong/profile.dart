import 'dart:math';

import 'package:app/controller/singleton.dart';
import 'package:app/page/add_coupon.dart';
import 'package:app/page/fav_menu.dart';
import 'package:app/page/mainRolePage.dart';
import 'package:app/page/new_menu.dart';
import 'package:app/pong/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:app/pong/signup_and_login.dart';
import 'package:app/pong/copycrab_db.dart';
import 'package:app/page/new_promo.dart';
import 'package:app/page/order_history.dart';

class AccountInfoBox extends StatelessWidget { //show account info from db
  final Customer customer;
  final String username;
  AccountInfoBox({this.customer, this.username});

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
                        Text(this.customer.name, style: TextStyle(fontFamily: 'Opun', fontSize: 15, fontWeight: FontWeight.w900),),
                        Text(this.customer.email, style: TextStyle(fontFamily: 'Opun', fontSize: 10),),
                        Text(this.customer.phone, style: TextStyle(fontFamily: 'Opun', fontSize: 10),)
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
                            context, MaterialPageRoute(builder: (context) => EditCustomerAccount(username)));
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

class AccountPage extends StatelessWidget { //customer role account page

  final String username;
  AccountPage(this.username);

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
          FutureBuilder<Customer> (
            future: fetchCustomer(username),
            builder: (context, snapshot) {
                return snapshot.hasData? AccountInfoBox(customer: snapshot.data, username: username) : Center(child: CircularProgressIndicator());
            },
          ),
          Container( 
            width: 450,
            height: 40,           
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddCoupon()));
              },
              child: Text('Enter Promotion Code', style: TextStyle(fontFamily: 'Opun', fontSize: 20, fontWeight: FontWeight.w500)),
              color: Colors.orangeAccent[100]
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
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => OrderHistory()));
              },
              child: Text('Order History', style: TextStyle(fontFamily: 'Opun', fontSize: 20, fontWeight: FontWeight.w500)),
              color: Colors.blue[100]
            )
          ),
          SizedBox(
            height: 10
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
                            image: AssetImage('assets/driver.jpg'), 
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
                            MaterialPageRoute(builder: (context) => DriverProfile(username)));
                          }, 
                          child: Center(
                          child: Text('SWITCH TO\n DRIVER',
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
                            MaterialPageRoute(builder: (context) => RestaurantMainPage(Singleton().username)));
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
          height: 10
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
      ),
      ),
    );
  }
}

class DriverProfile extends StatelessWidget { //driver role account page
  final String username;
  DriverProfile(this.username);
  
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
                              MaterialPageRoute(builder: (context) => CustomerMainPage(this.username)));
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

/*class RestaurantProfile extends StatefulWidget {
  @override
  _RestaurantProfileState createState() => _RestaurantProfileState();
}

class _RestaurantProfileState extends State<RestaurantProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Copycrab', style: TextStyle(fontFamily: 'Opun', color: Colors.black), textAlign: TextAlign.center),
      ),
      body: Column(
          children: <Widget> [
            OrderCard(orderID: '12345',imagePath:'Kamu.png',menu:'Dino Float',amount:'2 รายการ',price:'233 บาท',note:'love'),
            OrderCard(orderID: '12346',imagePath:'Kamu.png',menu:'Dino Float',amount:'2 รายการ',price:'233 บาท',note:'love'),
          ]
      ),
    );
  }
}
class OrderCard extends StatelessWidget {
  const OrderCard({
    Key key, this.orderID, this.imagePath, this.menu, this.amount, this.price, this.note,
  }) : super(key : key);
  final orderID,imagePath,menu,amount,price,note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 3.6,
      color: Colors.white10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children:<Widget>[
              Text('OrderID : $orderID',style: TextStyle(fontFamily: 'Opun', fontSize: 18)),
              Container(
                height: MediaQuery.of(context).size.height / 6,
                margin: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/$imagePath'),
                  )
                ),
            ]
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('$menu',style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
              Text('$amount',style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
              Text('ราคาสุทธิ : $price',style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
              Text('NOTE : $note',style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  color: Colors.lightGreenAccent[700],
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {},
                  child: Text(
                    "COMPLETE",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                )
            ]
          )
        ]
      )
    );
  }
}*/