import 'package:app/pong/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:app/pong/copycrab_db.dart';

class RolePages extends StatefulWidget {
  final String username;
  final String password;
  final String email;

  RolePages(this.username, this.password, this.email);

  @override
  _RolePagesState createState() => _RolePagesState();
}

class _RolePagesState extends State<RolePages> {
  Future<Customer> _futureCustomer;
  Future<Driver> _futureDriver;
  Future<Restaurant> _futureRestaurant;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          Expanded(
            child: Container(
              child: Stack(
                children: <Widget> [
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white)
                    ),),
                  Center(child: Text('DRIVER', 
                                style: TextStyle(
                                fontFamily: 'Opun',
                                fontSize: 50,
                                fontWeight: FontWeight.bold
                              ),)),
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(), 
                    child: Ink.image(
                      image: AssetImage('assets/driver.jpg'), 
                      fit: BoxFit.fill,
                      child: InkWell(
                      onTap: () {
                        setState(() {
                              _futureDriver = createDriver(widget.username.toString(), widget.password.toString(), widget.email.toString());
                        });
                      },), 
                  ),),
                ]
              )
            ), 
          ),
          Expanded(
            child: Container(
              child: Stack(
                children: <Widget> [
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white)
                    ),),
                  Center(child: Text('CUSTOMER', 
                                style: TextStyle(
                                fontFamily: 'Opun',
                                fontSize: 50,
                                fontWeight: FontWeight.bold
                              ),)),
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(), 
                    child: Ink.image(
                      image: AssetImage('assets/customer.jpg'), 
                      fit: BoxFit.fill,
                      child: InkWell(
                      onTap: () {
                        setState(() {
                              _futureCustomer = createCustomer(widget.username.toString(), widget.password.toString(), widget.email.toString());
                              Navigator.push(context,MaterialPageRoute(builder: (context) => EditCustomerAccount(widget.username.toString())));
                        });        
                      },), 
                  ),),
                ]
              )
            ), 
          ),
          Expanded(
            child: Container(
              child: Stack(
                children: <Widget> [
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white)
                    ),),
                  Center(child: Text('RESTAURANT', 
                                style: TextStyle(
                                fontFamily: 'Opun',
                                fontSize: 50,
                                fontWeight: FontWeight.bold
                              ),)),
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(), 
                    child: Ink.image(
                      image: AssetImage('assets/food.jpg'), 
                      fit: BoxFit.fill,
                      child: InkWell(
                      onTap: () {
                        setState(() {
                              _futureRestaurant = createRestaurant(widget.username.toString(), widget.password.toString(), widget.email.toString());
                        });
                      },), 
                  ),),
                ]
              )
            ), 
          ), 
        ]
      ),
    );
  }
}