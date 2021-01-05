import 'package:app/pong/main_customer.dart';
import 'package:flutter/material.dart';
import 'package:app/pong/role_page.dart';
import 'package:app/pong/copycrab_db.dart';
import 'package:app/pong/selectRoutePage.dart';

import 'dart:async';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _obscureText = true;

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
    }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                height: MediaQuery.of(context).size.height * 0.99,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children : <Widget> [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            )
                          )
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                                color: Colors.grey[300], 
                                borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: TextField(
                                  controller: username,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person, 
                                      color: Colors.grey),
                                    hintText: "Username",),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 18)),
                          )
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                                color: Colors.grey[300], 
                                borderRadius: BorderRadius.circular(25)),
                          child:TextField(
                                controller: password,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock, 
                                    color: Colors.grey),
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                    icon: _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility), 
                                    onPressed: _toggle),
                                  ),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText,
                                style: TextStyle(fontSize: 18)
                              ),                          
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                                color: Colors.grey[300], 
                                borderRadius: BorderRadius.circular(25)),
                          child: TextField(
                                controller: email,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email, 
                                    color: Colors.grey),
                                  hintText: "Email"),
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(fontSize: 18))
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: 300,
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            color: Colors.orange,
                            onPressed: (){
                            Navigator.push(
                              context,MaterialPageRoute(builder: (context) => RolePages(username.text, password.text, email.text)));
                          },
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                            )
                          ),),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Have an account?'),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignInPage()),
                                    );
                                }, 
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    ),)
                                )
                            ]
                          ),
                        ),
                      ]
                    ),
                  ),
                )
              )
            ],
          ),
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  bool _obscureText = true;
  Future<Customer> customer;
  Future<Driver> driver;
  Future<Restaurant> restaurant;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
    }
  
  void _checkrole(String username) {
    customer = fetchCustomer(username);
    driver = fetchDriver(username);
    restaurant = fetchRestaurant(username);

    if(customer != null) {
      print('you are customer');
      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerPage(username)),);
    }
    else if (driver != null) {
      print('you are driver');
    }
    else if (restaurant != null) {
      print('you are restaurant');
    }
    else {
      print('you are error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                width: 150.0,
                height: 150.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset('assets/person-male.png', height: 120, width: 120),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                height: MediaQuery.of(context).size.height * 0.75,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children : <Widget> [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "LOG IN",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            )
                          )
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                                color: Colors.grey[300], 
                                borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: TextField(
                                  controller: username,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person, 
                                      color: Colors.grey),
                                    hintText: "Username"),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 18)),
                          )
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                                color: Colors.grey[300], 
                                borderRadius: BorderRadius.circular(25)),
                          child:TextField(
                                controller: password,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock, 
                                    color: Colors.grey),
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                    icon: _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility), 
                                    onPressed: _toggle),
                                  ),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText,
                                style: TextStyle(fontSize: 18)
                              ),                          
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 300,
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            color: Colors.grey[300],
                            onPressed: (){
                              _checkrole(username.text);
                            },
                            child: Text(
                              "LOG IN",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                            )
                          ),),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Don\'t have an account?'),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                                }, 
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    ),)
                                )
                            ]
                          ),
                        ),
                      ]
                    ),
                  ),
                )
              )
            ],
          ),
      ),
    );
  }
}