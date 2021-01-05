import 'dart:async'; 
import 'dart:convert'; 
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

//this file use for API from copycrab database

class Menu { //menu table
   final int id;
   final String name;
   final double price;
   final String imageName;
   final Map restaurant;
   
   Menu(this.id, this.name, this.price, this.imageName, this.restaurant); 

   factory Menu.fromJson(Map<String, dynamic> json) { 
      return Menu( 
         json['id'], 
         json['name'], 
         json['price'],
         json['imageName'],
         json['restaurant']
      );
   }
}

List<Menu> parseMenu(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Menu>((json) => Menu.fromJson(json)).toList(); 
}
Future<List<Menu>> fetchMenu() async { 
   final response = await http.get("http://34.87.111.156:8888/menus"); 
   if (response.statusCode == 200) { 
      return parseMenu(response.body); 
   } else { 
      throw Exception('Unable to fetch promtion from the REST API');
   } 
}

List<Menu> parseMenuByRestaurant(String responseBody) { //use to pull menu from each restaurant api
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Menu>((json) => Menu.fromJson(json)).toList(); 
}
Future<List<Menu>> fetchMenuByRestaurant(String username) async { 
   final response = await http.get("http://34.87.111.156:8888/menus?username=" + username); 
   if (response.statusCode == 200) { 
      return parseMenu(response.body); 
   } else { 
      throw Exception('Unable to fetch promtion from the REST API');
   } 
}

/*class AccountInfo { //account table
  final int id;
  final String name;
  final String phone;
  final String email;
  final String sex;
  final String password;

  AccountInfo({this.id, this.name, this.phone, this.email, this.sex, this.password});

  factory AccountInfo.fromJson(Map<String, dynamic> json) { 
      return AccountInfo ( 
        id: json['id'], 
        name: json['name'], 
        phone: json['phone'],
        email: json['email'],
        sex: json['sex'],
        password: json['password']
      );
   }
}*/

/*List<AccountInfo> parseAccountInfo(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<AccountInfo>((json) =>AccountInfo.fromJson(json)).toList(); 
}

Future<List<AccountInfo>> fetchAccountInfo() async { 
   final response = await http.get("http://34.87.111.156:8888/customers"); 
   if (response.statusCode == 200) { 
      return parseAccountInfo(response.body); 
   } else { 
      throw Exception('Unable to fetch promtion from the REST API');
   } 
}*/

class MenuPromotion { //promotion of menu table
  final String key;
  final DateTime expDate;
  final Map menu;
  final Map promotion;

  MenuPromotion({this.key, this.expDate, this.menu, this.promotion});
  factory MenuPromotion.fromJson(Map<String, dynamic> json) { 
      return MenuPromotion ( 
        key: json['key'], 
        expDate: json['expDate'], 
        menu: json['menu'],
        promotion: json['promotion'],
      );
   }
}

List<MenuPromotion> parseMenuPromotion(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<MenuPromotion>((json) => MenuPromotion.fromJson(json)).toList(); 
}

Future<List<MenuPromotion>> fetchMenuPromotion() async { 
   final response = await http.get("http://34.87.111.156:8888/menu-promotions"); 
   if (response.statusCode == 200) { 
      return parseMenuPromotion(response.body); 
   } else { 
      throw Exception('Unable to fetch promtion from the REST API');
   } 
}

class Promotion { //promotion table
  final String code;
  final String type;
  final double value ;

  Promotion({this.code, this.type, this.value});
  factory Promotion.fromJson(Map<String, dynamic> json) { 
      return Promotion ( 
        code: json['code'], 
        type: json['type'], 
        value: json['value'],
      );
   }
}

List<Promotion> parsePromotion(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Promotion>((json) => MenuPromotion.fromJson(json)).toList(); 
}

Future<List<Promotion>> fetchPromotion() async { 
   final response = await http.get("http://34.87.111.156:8888/promotions"); 
   if (response.statusCode == 200) { 
      return parsePromotion(response.body); 
   } else { 
      throw Exception('Unable to fetch promtion from the REST API');
   } 
}

class Customer { //customer sign up info
  final String username;
  final String password;
  final String name;
  final String phone;
  final String email;
  final String sex;

  Customer({this.username, this.password, this.name, this.phone, this.email, this.sex});
  factory Customer.fromJson(Map<String, dynamic> json) { 
      return Customer ( 
        username: json['username'], 
        password: json['password'],
        name: json['name'],
        phone: json['phone'], 
        email: json['email'],
        sex: json['sex'],
      );
   }
}

Future<Customer> createCustomer(String username, String password, String email) async {
  final http.Response response = await http.post('http://34.87.111.156:8888/register/customer',
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password' : password,
      'name' : '?',
      'phone' : '?',
      'email' : email,
      'sex' : '?'
    }),
  );

  if (response.statusCode == 201) {
    return Customer.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create user.');
  }
}

Future<Customer> fetchCustomer(String username) async {
  final response = await http.get('http://34.87.111.156:8888/' + username + '/customer');
  if (response.statusCode == 200) {
    return Customer.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load customer');
  }
}

Future<Customer> updateCustomer(String username, String name, String email, String phone) async {
  final http.Response response = await http.post(
    'http://34.87.111.156:8888/'+ username + '/customer',
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username' : username,
      'name' : name,
      'email': email,
      'phone' : phone,
    }),
  );

  if (response.statusCode == 200) {
    return Customer.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update custoer info.');
  }
}

class Driver { //driver sign up info
  final String username;
  final String password;
  final String name;
  final String phone;
  final String email ;
  final String plateNumber;
  final String sex;

  Driver({this.username, this.password, this.name, this.phone, this.email, this.plateNumber, this.sex});
  factory Driver.fromJson(Map<String, dynamic> json) { 
      return Driver ( 
        username: json['username'], 
        password: json['password'],
        name: json['name'],
        phone: json['phone'], 
        email: json['email'],
        plateNumber: json['plateNumber'],
        sex: json['sex'],
      );
   }
}

Future<Driver> fetchDriver(String username) async {
  final response = await http.get('http://34.87.111.156:8888/' + username + '/driver');
  if (response.statusCode == 200) {
    return Driver.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load customer');
  }
}

Future<Driver> createDriver(String username, String password, String email) async {
  final http.Response response = await http.post('http://34.87.111.156:8888/register/driver',
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password' : password,
      'name' : '?',
      'phone' : '?',
      'email' : email,
      'plateNumber' : '?',
      'sex' : '?',
    }),
  );
  print(response.statusCode);
  if (response.statusCode == 201) {
    return Driver.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create user.');
  }
}

Future<Customer> updateDriver(String username, String name, String email, String phone, String plateNumber) async {
  final http.Response response = await http.post(
    'http://34.87.111.156:8888/'+ username + '/driver',
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username' : username,
      'name' : name,
      'email': email,
      'phone' : phone,
      'plateNumber' : plateNumber
    }),
  );

  if (response.statusCode == 200) {
    return Customer.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update custoer info.');
  }
}

class Restaurant { //restaurant info table
  final String username;
  final String password;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String license;

  Restaurant({this.username, this.password, this.name, this.address, this.phone, this.email, this.license});
  factory Restaurant.fromJson(Map<String, dynamic> json) { 
      return Restaurant ( 
        username: json['username'],
        password: json['password'], 
        name: json['name'], 
        address: json['address'],
        phone: json['phone'],
        email: json['email'],
        license: json['license']
      );
   }
}

Future<Restaurant> fetchRestaurant(String username) async {
  final response = await http.get('http://34.87.111.156:8888/' + username + '/restaurant');
  if (response.statusCode == 200) {
    return Restaurant.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load customer');
  }
}

List<Restaurant> parseRestaurantList(String responseBody) { //Use for pull a list of restaurant api
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Restaurant>((json) => Restaurant.fromJson(json)).toList(); 
}
Future<List<Restaurant>> fetchListRestaurant() async { 
   final response = await http.get("http://34.87.111.156:8888/restaurants");
   print(response.statusCode);
   if (response.statusCode == 200) { 
      return parseRestaurantList(response.body); 
   } else { 
      throw Exception('Unable to fetch promtion from the REST API');
   } 
}

List<Restaurant> parseRestaurant(String responseBody) { //Use for pull a list of restaurant api
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Restaurant>((json) => Restaurant.fromJson(json)).toList(); 
}
Future<List<Restaurant>> fetchAllRestaurant() async { 
   final response = await http.get("http://34.87.111.156:8888/restaurants");
   print(response.statusCode);
   if (response.statusCode == 200) { 
      return parseRestaurant(response.body); 
   } else { 
      throw Exception('Unable to fetch promtion from the REST API');
   } 
}

Future<Restaurant> createRestaurant(String username, String password, String email) async {
  final http.Response response = await http.post('http://34.87.111.156:8888/register/restaurant',
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password' : password,
      'name' : '?',
      'address' : '?',
      'phone' : '?',
      'email' : email,
      'license' : '?',
    }),
  );

  if (response.statusCode == 201) {
    return Restaurant.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create user.');
  }
}