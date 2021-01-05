import 'package:flutter/material.dart';


class NewMenu extends StatefulWidget {
  @override
  _NewMenuState createState() => _NewMenuState();
  
}


class _NewMenuState extends State<NewMenu> {

bool pressCategory = false;
bool pressCategory1 = false;
bool pressCategory2 = false;
bool pressCategory3 = false;
bool pressCategory4 = false;
bool pressCategory5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Menu', style: TextStyle(fontFamily: 'Opun'),),
      ),
      body: Center(
         child: Column(
           children: <Widget>[
             SizedBox(
                height: 30,
             ),
                Container(
                width: 100.0,
                height: 100.0,
                child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            color: Colors.grey,
                            onPressed: (){}, //add menu picture
                child:Align(
                  alignment: Alignment.center,
                  child:Text("+",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                            )
                          ),
                ),
                ),
             ),
             SizedBox(
                height: 10,
             ),
             Container(
              child:Align(
                  alignment: Alignment.center,
                  child:Text("Menu Picture",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                            )
                          ),
                ),
             ),
             SizedBox(
                height: 20,
             ),
             Container(
               child: Padding(
                    padding: const EdgeInsets.fromLTRB(40.0,10.0,10.0,1.0),
              child:Align(
                  alignment: Alignment.topLeft,
                  child:Text("Menu Name",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:20,
                            )
                          ),
              ),
                ),
             ),
             Container(
                          child: Padding(
                    padding: const EdgeInsets.fromLTRB(40.0,1.0,40.0,1.0),
                        
                            child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "ex. Fried Rice"),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 18)),  
                                  ),
             ),
             SizedBox(
                height: 15,
             ),
             Container(
               child: Padding(
                    padding: const EdgeInsets.fromLTRB(40.0,10.0,10.0,1.0),
              child:Align(
                  alignment: Alignment.topLeft,
                  child:Text("Price (Baht)",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:20,
                            )
                          ),
              ),
                ),
             ),
                   Container(
                          child: Padding(
                    padding: const EdgeInsets.fromLTRB(40.0,1.0,40.0,5.0),  
                            child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "ex. 25"),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 18)),   
                                  ),
             ),
             SizedBox(
                height: 15,
             ),
             Container(
               child: Padding(
                    padding: const EdgeInsets.fromLTRB(40.0,10.0,10.0,1.0),
              child:Align(
                  alignment: Alignment.topLeft,
                  child:Text("Category",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:20,
                            )
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
                width: 120,
                         height: 30,
                          child: RaisedButton(
                            color: pressCategory ? Colors.orangeAccent : Colors.grey,
                          onPressed: (){setState(() {
                       pressCategory = !pressCategory;
                      });
                    },
                          child: Text(
                          "Thai Food",
                              style: TextStyle(
                              color: Colors.white,
                            fontSize: 15,
                          ),
                          ),
                          ),
                        ),
                        Container(
                           width: 120,
                         height: 30,
                          child: RaisedButton(
                            color: pressCategory1 ? Colors.orangeAccent : Colors.grey,
                          onPressed: (){setState(() {
                       pressCategory1 = !pressCategory1;
                      });
                    },
                          child: Text(
                          "Chinese Food",
                              style: TextStyle(
                              color: Colors.white,
                            fontSize: 13,
                          ),
                          ),
                          ),
                          ),
                          Container(
                           width: 120,
                         height: 30,
                          child: RaisedButton(
                            color: pressCategory2 ? Colors.orangeAccent : Colors.grey,
                          onPressed: (){setState(() {
                       pressCategory2 = !pressCategory2;
                      });
                    },
                          child: Text(
                          "Japanese Food",
                              style: TextStyle(
                              color: Colors.white,
                            fontSize: 12,
                          ),
                          ),
                          ),
                          ),
                          ]
                          ),
                    SizedBox(
                height: 15,
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                  Container(
                           width: 120,
                         height: 30,
                          child: RaisedButton(
                            color: pressCategory3 ? Colors.orangeAccent : Colors.grey,
                          onPressed: (){setState(() {
                       pressCategory3 = !pressCategory3;
                      });
                    },
                          child: Text(
                          "Street Food",
                              style: TextStyle(
                              color: Colors.white,
                            fontSize: 15,
                          ),
                          ),
                          ),
                          ),
                 Container(
                           width: 120,
                         height: 30,
                          child: RaisedButton(
                            color: pressCategory4 ? Colors.orangeAccent : Colors.grey,
                          onPressed: (){setState(() {
                       pressCategory4 = !pressCategory4;
                      });
                    },                          
                          child: Text(
                          "Drinks",
                              style: TextStyle(
                              color: Colors.white,
                            fontSize: 15,
                          ),
                          ),
                          ),
                          ),
                          Container(
                           width: 120,
                         height: 30,
                          child: RaisedButton(
                            color: pressCategory5 ? Colors.orangeAccent : Colors.grey,
                          onPressed: (){setState(() {
                       pressCategory5 = !pressCategory5;
                      });
                    },
                          child: Text(
                          "Dessert",
                              style: TextStyle(
                              color: Colors.white,
                            fontSize: 15,
                          ),
                          ),
                          ),
                          ),   
               ]
               ),
                SizedBox(
                height: 55,
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                  Container(
                           width: 200,
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            color: Colors.lightGreenAccent[700],
                            onPressed: (){ },
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                            )
                          ),),
                        ),
                  Container(
                           width: 200,
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            color: Colors.red,
                            onPressed: (){ },
                            child: Text(
                              "CANCEL",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                            )
                          ),),
                        ),
               ]
                          ),
           ]
           ),
      ),
    );
  }
}

  
