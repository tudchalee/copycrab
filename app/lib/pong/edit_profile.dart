import 'package:flutter/material.dart';
import 'package:app/pong/profile.dart';
import 'package:app/pong/copycrab_db.dart';
import 'package:app/pong/role_page.dart';

class EditCustomerAccount extends StatelessWidget {

  final String username;
  EditCustomerAccount(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'Edit Account',
          style: TextStyle(fontFamily: 'Opun', color: Colors.black),
        ),
      ),
      body: FutureBuilder<Customer> (
        future: fetchCustomer(username),
        builder: (context, snapshot) {
          return snapshot.hasData ? CustomerEditBox(item: snapshot.data) : Center(child: CircularProgressIndicator());
      })
    );
  }
}

class CustomerEditBox extends StatelessWidget {

  final Customer item;
  CustomerEditBox({this.item});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            SizedBox(
                height: 10,
              ),
            Container(
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset('assets/person-male.png', height: 120, width: 120),
                ),
            ),
            SizedBox(
                height: 10,
              ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Name', style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w700, fontSize: 15),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300,20)),
                      child: TextFormField(
                        controller: name,
                        onSaved: (String name) {
                        }
                      ),)
                  ),
                ]
              )
            ),
            SizedBox(
                height: 10,
              ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('E-mail', style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w700, fontSize: 15),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300,20)),
                      child: TextFormField(
                       controller: email,
                       onSaved: (String email) {}
                      ),)
                  ),
                ]
              )
            ),
            SizedBox(
                height: 10,
              ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Phone Number', style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w700, fontSize: 15),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300,20)),
                      child: TextFormField(
                        controller: phone,
                        onSaved: (String phone) {
                        }
                      ),)
                  ),
                ]
              )
            ),
            SizedBox(
                height: 20,
              ),
            Container(
              width: 200,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                color: Colors.lightGreenAccent[700],
                onPressed: (){
                    updateCustomer(this.item.username, name.text, email.text, phone.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage(this.item.username)));
                },
                child: Text(
                  "SAVE",
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
      );
  }
}

class EditDriverAccount extends StatelessWidget {
  final String username;
  EditDriverAccount(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'Edit Account',
          style: TextStyle(fontFamily: 'Opun', color: Colors.black),
        ),
      ),
      body: FutureBuilder<Driver> (
        future: fetchDriver(username),
        builder: (context, snapshot) {
          return snapshot.hasData ? DriverEditBox(driver: snapshot.data) : Center(child: CircularProgressIndicator());
      })
    );
  }
}

class DriverEditBox extends StatelessWidget {

  final Driver driver;
  DriverEditBox({this.driver});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController plateNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            SizedBox(
                height: 10,
              ),
            Container(
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset('assets/person-male.png', height: 120, width: 120),
                ),
            ),
            SizedBox(
                height: 10,
              ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Name', style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w700, fontSize: 15),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300,20)),
                      child: TextFormField(
                        controller: name,
                        onSaved: (String name) {
                        }
                      ),)
                  ),
                ]
              )
            ),
            SizedBox(
                height: 10,
              ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('E-mail', style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w700, fontSize: 15),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300,20)),
                      child: TextFormField(
                       controller: email,
                       onSaved: (String email) {}
                      ),)
                  ),
                ]
              )
            ),
            SizedBox(
                height: 10,
              ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Phone Number', style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w700, fontSize: 15),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300,20)),
                      child: TextFormField(
                        controller: phone,
                        onSaved: (String phone) {
                        }
                      ),)
                  ),
                ]
              )
            ),
            SizedBox(
                height: 10,
              ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('License Plate Number', style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w700, fontSize: 15),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300,20)),
                      child: TextFormField(
                        controller: plateNumber,
                        onSaved: (String plateNumber) {
                        }
                      ),)
                  ),
                ]
              )
            ),
            SizedBox(
                height: 20,
              ),
            Container(
              width: 200,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                color: Colors.lightGreenAccent[700],
                onPressed: (){
                    updateDriver(this.driver.username, name.text, email.text, phone.text, plateNumber.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DriverProfile(this.driver.username)));
                },
                child: Text(
                  "SAVE",
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
      );
  }
}

class EditRestaurantAccount extends StatelessWidget {
  final String username;
  EditRestaurantAccount(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'Edit Account',
          style: TextStyle(fontFamily: 'Opun', color: Colors.black),
        ),
      ),
      body: FutureBuilder<Restaurant> (
        future: fetchRestaurant(username),
        builder: (context, snapshot) {
          return snapshot.hasData ? RestaurantEditBox(restaurant: snapshot.data) : Center(child: CircularProgressIndicator());
      })
    );
  }
}

class RestaurantEditBox extends StatelessWidget {

  final Restaurant restaurant;
  RestaurantEditBox({this.restaurant});

  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController license = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            SizedBox(
                height: 10,
              ),
            Container(
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset('assets/person-male.png', height: 120, width: 120),
                ),
            ),
            SizedBox(
                height: 10,
              ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Restaurant Name', style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w700, fontSize: 15),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300,20)),
                      child: TextFormField(
                        controller: name,
                        onSaved: (String name) {
                        }
                      ),)
                  ),
                ]
              )
            ),
            SizedBox(
                height: 10,
              ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Address', style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w700, fontSize: 15),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300,20)),
                      child: TextFormField(
                       controller: address,
                       onSaved: (String address) {}
                      ),)
                  ),
                ]
              )
            ),
            SizedBox(
                height: 10,
              ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Phone Number', style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w700, fontSize: 15),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300,20)),
                      child: TextFormField(
                        controller: phone,
                        onSaved: (String phone) {
                        }
                      ),)
                  ),
                ]
              )
            ),
            SizedBox(
                height: 10,
              ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('License Number', style: TextStyle(fontFamily: 'Opun', fontWeight: FontWeight.w700, fontSize: 15),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300,20)),
                      child: TextFormField(
                        controller: license,
                        onSaved: (String license) {
                        }
                      ),)
                  ),
                ]
              )
            ),
            SizedBox(
                height: 20,
              ),
            Container(
              width: 200,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                color: Colors.lightGreenAccent[700],
                onPressed: (){
                    updateDriver(this.restaurant.username, name.text, address.text, phone.text, license.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DriverProfile(this.restaurant.username)));
                },
                child: Text(
                  "SAVE",
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
      );
  }
}