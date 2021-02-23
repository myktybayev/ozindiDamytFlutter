import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ozindi_damyt/screens/gibratty_angimeler/angime.dart';
import 'package:ozindi_damyt/drawer/drawer.dart';
import 'package:ozindi_damyt/screens/gibratty_angimeler/angime.dart';
import 'package:ozindi_damyt/screens/gibratty_angimeler/angime.dart';
import 'package:ozindi_damyt/screens/gibratty_angimeler/angime.dart';
import 'package:ozindi_damyt/screens/gibratty_angimeler/angime.dart';
import 'package:ozindi_damyt/screens/gibratty_angimeler/angime.dart';
import 'dart:ui';

import 'package:ozindi_damyt/screens/kitapkhana/bir-kitap-about.dart';

import 'angime.dart';
import 'angime.dart';
import 'angime.dart';
import 'angime.dart';
import 'angime.dart';
import 'angime.dart';
import 'angime.dart';

class GibrattyAngimeMain extends StatefulWidget {
  @override
  _GibrattyAngimeMainState createState() => _GibrattyAngimeMainState();
}

class _GibrattyAngimeMainState extends State<GibrattyAngimeMain> {
  List<Angime> _angimeListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _angimeQuery;

  @override
  void initState() {
    super.initState();

    _angimeListNew = new List();
    _angimeQuery = _database.reference().child("angimeler");

    _onHobbyAddedSubscription = _angimeQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _angimeQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    setState(() {
      _angimeListNew.add(Angime.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _angimeListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _angimeListNew[_angimeListNew.indexOf(oldEntry)] =
          Angime.fromSnapshot(event.snapshot);
    });
  }





  @override
  Widget AngimeItem(BuildContext context, Angime angime) {
    return Container(
        child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            drawer: DrawerMenu(),
            appBar: AppBar(
              title: Text(
                "Ғибратты әңгімелер",
                style: TextStyle(color: Colors.black),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  tooltip: 'search',
                  onPressed: () {
                    // showSearch(context: context, delegate: DataSearch());
                  },
                ),
              ],
              //<Widget>[]
              backgroundColor: Colors.white,
              elevation: 50.0,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: new Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              //IconButton
              brightness: Brightness.dark,
            ),
            body: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _angimeListNew.length,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                itemBuilder: (context, i) {
                
                  // return angimeItem(context, _bookList[i]);
                })));
  }

  Widget angimeItem(Angime angime) {
    Size size=MediaQuery.of(context).size;
  double height=MediaQuery.of(context).size.height;
  double width=MediaQuery.of(context).size.width;
  double text=MediaQuery.textScaleFactorOf(context);
  print(width);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),

        elevation: 10.0,
        child: SizedBox(
          height: width/3.5,

          child: InkWell(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 2,
                        child: Column(
                          children: [


                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        angime.photo,
                                        height: 80,
                                        width: width/4,
                                      )),
                              )
                          ],
                        )),
                    Flexible(
                      flex: 4,
                      child:

                          Column(
                            children: [ Text(angime.title,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17)),
                          ],),
                          /*
                          Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text('5.0',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                )
                            ],
                          ), */


                    ),
                    Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  tooltip: 'оқу',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Angime_about(angime: angime)),
                                    );
                                  }), //Ic

                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

Widget AngimeList(BuildContext context, List<Angime> _angimeList) {
  if (_angimeList.length > 0) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _angimeList.length,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          itemBuilder: (context, i) {
           
          }),
    );
  } else {
    return AngimeNotFound(context);
  }
}

Widget AngimeNotFound(BuildContext context) {
  return Container(
    width: MediaQuery
        .of(context)
        .size
        .width,
    margin: EdgeInsets.only(left: 15, top: 10),
    child: Text("Кітаптар әлі жүктелмеді, интернет байланысыңызды тексеріңіз!",
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 14.0)
    ),
  );
}

class Angime_about extends StatelessWidget {
  final Angime angime;

  Angime_about({Key key, @required this.angime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double text=MediaQuery.textScaleFactorOf(context);
    print(width);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Stack(
          children: <Widget>[
            SizedBox(
              height: width/1.8,
              child: Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(angime.photo),
                        fit: BoxFit.cover)
                ),
              ),
            ),
            Column(
              children: [


                Flexible(
                    child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Text(angime.desc,
                              style: TextStyle(fontSize: 13),),
                          )
                        ]
                    )),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

