import 'dart:async'; 
import 'dart:convert'; 
import 'package:app/controller/singleton.dart';
import 'package:app/template/menu.dart';
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

Future deleteMenu(int id) async {
  await http.delete("http://34.87.111.156:8888/menus?menu-id=[$id]");
}

Future deletePromo(int id) async {
  await http.delete("http://34.87.111.156:8888/promotions?menu-promo-id=[$id]");
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

Future<List<Menu>> fetchMenuById(List<int> menus) async { 
  final menusParam = menus.join(',');
  final response = await http.get("http://34.87.111.156:8888/menus?menu-id=[$menusParam]"); 
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

List<Menu> parseMenuByID(String responseBody) {
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Menu>((json) => Menu.fromJson(json)).toList(); 
}
Future<List<Menu>> fetchMenuByID(int id) async {
  final response = await http.get('http://34.87.111.156:8888/menus?menu-id=' + id.toString());
  print(response.statusCode);
  if (response.statusCode == 200) {
    return parseMenuByID(response.body);
  } else {
    throw Exception('Failed to load customer');
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
  final DateTime expiredDate;
  final Map menu;
  final Map promotion;
  final int id;

  MenuPromotion({this.key, this.expiredDate, this.menu, this.promotion, this.id});
  factory MenuPromotion.fromJson(Map<String, dynamic> json) { 
      return MenuPromotion ( 
        key: json['key'], 
        expiredDate: DateTime.parse(json['expiredDate']), 
        menu: json['menu'],
        promotion: json['promotion'],
        id: json['id']
      );
   }
}

Future<MenuPromotion> postMenuPromotion(String code) async { 
   final http.Response response = await http.post('http://34.87.111.156:8888/promotions',
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: json.encode({
      "expiredDate": Singleton().expPromo.toString(),
      "menu":{
        "id": Singleton().menuForPromo.id
      },
      "promotion":{
        "code": code
      }

    }),
  );

  if (response.statusCode == 200) {
    return MenuPromotion.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create user.');
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

List<MenuPromotion> parseMenuPromotionByRes(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<MenuPromotion>((json) => MenuPromotion.fromJson(json)).toList(); 
}

Future<List<MenuPromotion>> fetchMenuPromotionByRes(String username) async { 
   final response = await http.get("http://34.87.111.156:8888/promotions?username="+ username); 
   if (response.statusCode == 200) { 
      return parseMenuPromotionByRes(response.body); 
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

Future<Promotion> fetchPromotionByCode(String code) async {
  final response = await http.get('http://34.87.111.156:8888/promotions?code=' + code);
  if (response.statusCode == 200) {
    return Promotion.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load customer');
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

Future<Menu> createMenu(String name, double price, List<String> cats) async { 
  final x = {
        "menu": {
        "name": "$name",
        "price": price,
        "imageName": "chanom.jpg",
        "restaurant": {
            "username": "${Singleton().username}"
        }
    },
    "category": cats
};

  final response = await http.post("http://34.87.111.156:8888/menus",
  headers: <String, String>{'Content-Type': 'application/json',},
  body: json.encode(x));
  if(response.statusCode ==200)
    return Menu.fromJson(json.decode(response.body));
  return null;
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

Future<List<int>> fetchFavMenus() async { 
   final response = await http.get("http://34.87.111.156:8888/favorites/${Singleton().username}");
   if (response.statusCode == 200) { 
      final parse = json.decode(response.body).cast<Map<String, dynamic>>();
      return parse.map((json)=>json['menu']['id']).toList();
   } else { 
      throw Exception('Unable to fetch promtion from the REST API');
   } 
}


Future<Order> createOrder() async { 
  Map<String, dynamic> order = {
    "order": {
      "date": "${DateTime.now()}",
      "destination": "${Singleton().currentOrder.destination}",
      "fee": Singleton().currentOrder.fee,
      "rateScore": null,
      "paymentMethod": null,
      "customer": {
          "username": "${Singleton().username}"
      },
      "driver": {
          "username": "fakedriver"
      },
      "customerVoucher": null
    }
  };
  Map<String, dynamic> menus ={
    "menu": Singleton().currentOrder.menus.entries.map((e) => {
			"menu":{
				"id": e.key
			},
			"amount": e.value,
			"note": null
    }).toList()
  };

  order.addAll(menus);

  final response = await http.post("http://34.87.111.156:8888/orders",
  headers: <String, String>{'Content-Type': 'application/json',},
  body: json.encode(order));
  if(response.statusCode ==200)
    return Order.fromJson(json.decode(response.body));
  return null;
}



List<Order> parseOrder(String responseBody) { //Use for pull a list of restaurant api
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Order>((json) => Order.fromJson(json)).toList(); 
}

Future<List<Order>> fetchOrder(String username) async { 
   final response = await http.get("http://34.87.111.156:8888/orders/history/$username");
   print(response.statusCode);
   if (response.statusCode == 200) { 
      return parseOrder(response.body); 
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

class CurrentOrder{
  int id;
  Map<int, int> menus = {};
  DateTime date;
  String destination = 'KMUTT ตึกแดง';	
  final fee = 10;	
  double rateScore;	
  String paymentMethod;	
  String customer;	
  String restaurant;
  String driver;	
  String voucher;
  String note;

  double subTotal = 0;
}

class Order {
  int id;
  DateTime date;
  String destination = 'KMUTT ตึกแดง';	
  final fee = 10;	
  double rateScore;	
  String paymentMethod;	
  String customer;	
  String driver;	
  String voucher;
  String note;

  Order({this.id, this.date, this.destination, this.customer, this.driver, this.note});
  factory Order.fromJson(Map<String, dynamic> json) { 
      return Order ( 
        id: json['id'],
        date: DateTime.parse(json['date']) ,
        destination: json['destination'], 
        customer: json['customer']['username'], 
        driver: json['driver']['username'],
        note: json['note'] ?? '-'
      );
   }
}

class Voucher {
  String code;
  String type;
  double value;
  String detail;
  DateTime expired;

  Voucher({this.code, this.type, this.value, this.detail, this.expired});
  factory Voucher.fromJson(Map<String, dynamic> json) { 
      return Voucher ( 
        code: json['code'],
        expired: DateTime.parse(json['expiredDate']) ,
        type: json['type'], 
        value: json['value'], 
        detail: json['detail'],
      );
   }
}

List<Voucher> parseVoucher(String responseBody) { //Use for pull a list of restaurant api
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Voucher>((json) => Voucher.fromJson(json)).toList(); 
}

Future<List<Voucher>> fetchVoucher() async { 
   final response = await http.get("http://34.87.111.156:8888/vouchers");
   print(response.statusCode);
   if (response.statusCode == 200) { 
      return parseVoucher(response.body); 
   } else { 
      throw Exception('Unable to fetch promtion from the REST API');
   } 
}

Future postVoucher(String code) async {
  await http.post('http://34.87.111.156:8888/vouchers',
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: json.encode({
      "key": '${Singleton().username}_$code',
      "isUsed": false,
      "expiredDate": DateTime.now().toString(),
      "customer": {
        "username": Singleton().username
      },
      "voucher": {
        "code": code
      }
    })
  );
}