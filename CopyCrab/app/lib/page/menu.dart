import 'package:app/template/menu.dart';
import 'package:app/page/menu_card.dart';
import 'package:app/page/menu_list.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  final List<Menu> menu = MenuList.getMenu();

  Widget _buildMenuList() {
    return Container(
      child: menu.length > 0
          ? ListView.builder(
              itemCount: menu.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
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
                  child: MenuCard(menu: menu[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('No Items')),
    );
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Menu', style: TextStyle(fontFamily: 'Opun'),),
      ),
      body: _buildMenuList(),
    );
  }
}