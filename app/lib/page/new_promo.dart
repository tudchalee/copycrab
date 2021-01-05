import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/page/date_time.dart';

class NewPromo extends StatefulWidget {
  @override
  _NewPromoState createState() => _NewPromoState();
}


class _NewPromoState extends State<NewPromo> {
  List<bool> isSelected = [false, false, false, false];

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
                          child: Text(
                            "   Choose Menu",
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
                              Container(
                                width: 105,
                                height: 105,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage('assets/Swensens.jpg'),
                                  ),
                                ),
                              ),
                              Container(
                                width: 105,
                                height: 105,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/foods/bonchon.jpg'),
                                  ),
                                ),
                              ),
                              Container(
                                width: 105,
                                height: 105,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/foods/noodle.jpg'),
                                  ),
                                ),
                              ),
                              Container(
                                width: 105,
                                height: 105,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage('assets/foods/tum.jpg'),
                                  ),
                                ),
                              ),
                            ]),
                        ToggleButtons(
                          //borderColor: Colors.deepOrangeAccent[100],
                          fillColor: Colors.green,
                          //borderRadius: BorderRadius.circular(8.0),
                          //selectedBorderColor: Colors.deepOrange,
                          renderBorder: false,
                          children: <Widget>[
                            Container(
                                width:
                                    (MediaQuery.of(context).size.width - 48) /
                                        4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    //Icon(Icons.whatshot,size: 16.0,color: Colors.red,),
                                    //SizedBox(width: 4.0,),
                                    Text(
                                      "ไอศกรีม ฿75",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )),
                            Container(
                                width:
                                    (MediaQuery.of(context).size.width - 48) /
                                        4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    //Icon(Icons.invert_colors,size: 16.0,color: Colors.yellow[800],),
                                    //SizedBox(width: 4.0,),
                                    Text("ไก่ทอด L ฿130",
                                        style: TextStyle(color: Colors.black))
                                  ],
                                )),
                            Container(
                                width:
                                    (MediaQuery.of(context).size.width - 48) /
                                        4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // Icon(Icons.ac_unit,size: 16.0,color: Colors.blue,),
                                    //SizedBox(width: 4.0,),
                                    Text("ก๋วยเตี๋ยว ฿45",
                                        style: TextStyle(color: Colors.black))
                                  ],
                                )),
                            Container(
                                width:
                                    (MediaQuery.of(context).size.width - 48) /
                                        4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    //Icon(Icons.cake,size: 16.0,color: Colors.pink,),
                                    //SizedBox(width: 4.0,),
                                    Text("ส้มตำ ฿55",
                                        style: TextStyle(color: Colors.black))
                                  ],
                                )),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              for (int indexBtn = 0;
                                  indexBtn < isSelected.length;
                                  indexBtn++) {
                                if (indexBtn == index) {
                                  isSelected[indexBtn] = !isSelected[indexBtn];
                                } else {
                                  isSelected[indexBtn] = false;
                                }
                              }
                            });
                          },
                          isSelected: isSelected,
                        )
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
                              const EdgeInsets.fromLTRB(20.0,0.0, 30.0, 0.0),
                          child: TextField(
                              decoration: InputDecoration(labelText: "Promotion Code ex.AB12345",border: OutlineInputBorder()),
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                     SizedBox(
                        height: 25,
                      ),
                       Row(
                         children: <Widget>[
                         Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "    Discount: 20%",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                         ],
                       ),
                       SizedBox(
                        height: 20,
                      ),
                       Row(
                         children: <Widget>[
                         Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "    Price After Applied: 45 Baht",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                         ],
                       ),
                       SizedBox(
                        height: 20,
                      ),
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
                              const EdgeInsets.fromLTRB(20.0,0.0, 30.0, 0.0),
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
                      onPressed: () {},
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
