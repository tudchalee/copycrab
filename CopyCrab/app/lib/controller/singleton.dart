

import 'package:app/pong/copycrab_db.dart';

class Singleton {
  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }
  Singleton._internal();
  
  String username;
  CurrentOrder currentOrder = CurrentOrder();
  Menu menuForPromo;
  DateTime expPromo;
  List<int> favMenus = [];

  void addOrderMenu(int menu){
    if(currentOrder.menus.containsKey(menu))
      this.currentOrder.menus[menu] += 1;
    else
      this.currentOrder.menus[menu] = 1;
  }

}