import 'package:app/controller/singleton.dart';
import 'package:app/pong/copycrab_db.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatefulWidget {
  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {

  Future<Order> _order;

  refresh(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Order',
          style: TextStyle(fontFamily: 'Opun'),
        ),
      ),
      body: ListView(children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20),
          color: Colors.grey,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.place,
                  size: 50,
                  color: Colors.red,
                ),
                Container(
                    child: Text(
                  '${Singleton().currentOrder.destination}',
                  style: TextStyle(fontFamily: 'Opun', fontSize: 16.5),
                )),
                IconButton(
                  icon: Icon(Icons.expand_more),
                  onPressed: () {},
                  iconSize: 50,
                ),
              ]),
        ),
        Container(
            child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20),
              color: Colors.cyan[100],
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('รายการที่สั่ง',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          fontSize: 18,
                        )),
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.cyan[300],
                        child: Text(
                          'สั่งเพิ่ม',
                          style: TextStyle(fontFamily: 'Opun', fontSize: 12),
                        ))
                  ]),
            ),
            FutureBuilder<List<Menu>>(
            future: fetchMenuById(Singleton().currentOrder.menus.keys.toList()),
            builder: (context, snapshot) {
              return snapshot.hasData? 
              Column(children: List.generate(snapshot.data.length,(index) => MenuItem(snapshot.data[index], refresh)).toList()) : 
              Center(child: CircularProgressIndicator()); 
            }
      ),
          ],
        )),
        Container(
            padding: EdgeInsets.only(left: 20),
            color: Colors.red[300],
            child: Row(
              children: <Widget>[
                Icon(Icons.local_atm, size: 50),
                SizedBox(width: 30),
                Text('Use a voucher',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      fontSize: 15,
                    ))
              ],
            )),
        Container(
            child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            color: Colors.blue[100],
            child: Row(children: <Widget>[
              Text('รายละเอียดการชำระเงิน',
                  style: TextStyle(fontFamily: 'Opun', fontSize: 18)),
            ]),
          ),
          Container(
              child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('ราคา',
                          style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                      Text('${Singleton().currentOrder.subTotal}',
                          style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('ส่วนลด',
                          style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                      Text('0',
                          style: TextStyle(
                              fontFamily: 'Opun',
                              fontSize: 15,
                              color: Colors.red)),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('ค่าส่ง',
                          style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                      Text('${Singleton().currentOrder.fee}',
                          style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  color: Colors.cyanAccent[700],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('ราคาสุทธิ',
                          style: TextStyle(fontFamily: 'Opun', fontSize: 16.5)),
                      Text('${Singleton().currentOrder.subTotal + Singleton().currentOrder.fee}',
                          style: TextStyle(fontFamily: 'Opun', fontSize: 16.5)),
                    ],
                  ))
            ],
          )),
        ])),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          width: 300,
          height: 80,
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.lightGreenAccent[700],
            onPressed: () {
              setState(() async {
                _order = createOrder();
                Singleton().currentOrder = CurrentOrder();
                Navigator.popUntil(context, ModalRoute.withName('/selectRestaurant'));
              });
            },
            child: Text("ORDER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                )),
          ),
        ),
      ]),
    );
  }
}


class MenuItem extends StatefulWidget {
  final Function() notifyParent;
  final menu;
  MenuItem(this.menu, this.notifyParent);
  @override
  _MenuItemState createState() => _MenuItemState(menu);
}

class _MenuItemState extends State<MenuItem> {
  Menu _menu;
  int _amount;
  double _total;
  _MenuItemState(this._menu);

  @override
  void initState() {
    // TODO: implement initState
    _amount = Singleton().currentOrder.menus[_menu.id];
    _total = _menu.price*_amount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[50],
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height / 8,
              margin: EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/foods/${_menu.imageName}',
                ),
              )),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          Expanded(
            child: Text('${_menu.name}',
                style: TextStyle(
                  fontFamily: 'Opun',
                  fontSize: 18,
                )),
          ),
          Container(
              child: Column(
            children: <Widget>[
              Center(
                child: Text('$_total',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      fontSize: 18,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: <Widget>[
                  Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0)),
                        color: Colors.orange[300],
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.remove,
                            size: 15,
                          ),
                          onPressed: () {
                            setState(() {
                              _amount -= 1;
                              Singleton().currentOrder.menus[_menu.id] = _amount;
                              _total = _menu.price*_amount;
                              Singleton().currentOrder.subTotal -= _menu.price;
                              widget.notifyParent();
                            });
                          })),
                  Container(
                    color: Colors.orange[800],
                    width: 30,
                    height: 30,
                    child: Center(
                      child: Text('$_amount',
                          style: TextStyle(
                            fontFamily: 'Opun',
                            fontSize: 12,
                          )),
                    ),
                  ),
                  Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0)),
                        color: Colors.orange[300],
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 15,
                          ),
                          onPressed: () {
                            setState(() {
                              _amount += 1;
                              Singleton().currentOrder.menus[_menu.id] = _amount;
                              _total = _menu.price*_amount;
                              Singleton().currentOrder.subTotal += _menu.price;
                              widget.notifyParent();
                            });
                          })),
                ]),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
