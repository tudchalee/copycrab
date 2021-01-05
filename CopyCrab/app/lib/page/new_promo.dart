import 'package:app/controller/singleton.dart';
import 'package:app/page/menuforpromo.dart';
import 'package:app/pong/copycrab_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/page/date_time.dart';
import 'package:app/pong/profile.dart';

class NewPromo extends StatefulWidget {
  final String username;
  NewPromo(this.username);
  @override
  _NewPromoState createState() => _NewPromoState(this.username);
}

class _NewPromoState extends State<NewPromo> {
  final String username;
  Menu menu;
  final code = TextEditingController();
  final exp = TextEditingController();

  _NewPromoState(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Promotion',
          style: TextStyle(fontFamily: 'Opun'),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              height: MediaQuery.of(context).size.height * 0.30,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.orangeAccent[100],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(menu == null? "   Select Menu": '${menu.name}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectMenuForPromo(Singleton().username))).then((value) {
                                    setState(() {
                                      if(Singleton().menuForPromo != null)
                                        menu = Singleton().menuForPromo;
                                    });
                                  });
                                },
                                child: Container(
                                  width: 105,
                                  height: 105,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(menu == null? 'assets/animals.png' : 'assets/foods/${menu.imageName}'),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              height: MediaQuery.of(context).size.height * 0.45,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.orangeAccent[100],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "   Insert Promotion Code",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 0.0, 30.0, 0.0),
                          child: TextField(
                              controller: code,
                              decoration: InputDecoration(
                                  labelText: "Promotion Code ex.AB12345",
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     Align(
                      //       alignment: Alignment.topLeft,
                      //       child: Text(
                      //         "    Discount: 20%",
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 18,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   children: <Widget>[
                      //     Align(
                      //       alignment: Alignment.topLeft,
                      //       child: Text(
                      //         "    Price After Applied: 45 Baht",
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 18,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "    Expired Date and Time",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 0.0, 30.0, 0.0),
                          child: DateTimeForm(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: Colors.lightGreenAccent[700],
                      onPressed: () {
                        setState(() {
                          postMenuPromotion(code.text);
                          Navigator.pop(context);
                        });
                      },
                      child: Text("SUBMIT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          )),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: Colors.red,
                      onPressed: () {},
                      child: Text("CANCEL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          )),
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
