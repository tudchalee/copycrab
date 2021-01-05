import 'package:app/controller/singleton.dart';
import 'package:app/pong/copycrab_db.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}
bool like = false;
class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'My Orders',
          style: TextStyle(fontFamily: 'Opun'),
        ),
      ),
      body: FutureBuilder<List<Order>>(
            future: fetchOrder(Singleton().username),
            builder: (context, snapshot) {
              return snapshot.hasData? 
              ListView(children: List.generate(snapshot.data.length,(index) => HistCard(snapshot.data[index])).toList()) : 
              Center(child: CircularProgressIndicator()); 
            }
      ),
    );
  }
}

class HistCard extends StatelessWidget {
  final Order order;
  const HistCard(this.order);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 150,
      color: Colors.white10,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    height: 100,
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/animals.png',
                      ),
                    )
                    ),
                    Text('${order.date}', style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
              ],
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Order ref: ${order.id}',
                    style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                Text('Note : ${order.note}',
                    style: TextStyle(fontFamily: 'Opun', fontSize: 15)),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)),
                  color: Colors.green[400],
                  textColor: Colors.white,
                  padding: EdgeInsets.all(2.0),
                  onPressed: () {},
                  child: Text(
                    "Order again",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            )
          ]
        ),
    );
  }
}
