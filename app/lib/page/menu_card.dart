import 'package:app/template/menu.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;

  MenuCard({this.menu});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(menu.imageUrl),
            ),
            title: Text(menu.title),
            subtitle: Text(menu.category),
            trailing: Text(menu.price),
          )
        ],
      ),
    );
  }
}