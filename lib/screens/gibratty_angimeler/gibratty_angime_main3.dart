import 'dart:async';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ozindi_damyt/screens/gibratty_angimeler/angime.dart';
import 'package:ozindi_damyt/drawer/drawer.dart';
import 'package:like_button/like_button.dart';
import 'dart:ui';

import 'angime.dart';
import 'angime_about.dart';



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
    print('onEntryAdded');

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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    return Container(
        child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            drawer: DrawerMenu(),
            appBar: AppBar(
              title: Text(
                "Ғибратты әңгімелер",
                style: TextStyle(color: Colors.black,fontSize: width/20),
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
                  return angimeItem(context, _angimeListNew[i]);
                })));
  }

  Widget angimeItem(BuildContext context, Angime angime) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
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
          height: width / 3.5,
          child: InkWell(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      angime.photo,
                                      height: width/5,
                                      width: width/5,
                                      fit: BoxFit.cover,
                                    )),
                      ),
                        ),
                    Flexible(
                          child: Text(angime.title,
                              maxLines: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: width/20)),

                      ),
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

                    Flexible(
                            child: IconButton(
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
                                        builder: (context) =>
                                            Angime_about(angime: angime)),
                                  );
                                }), //Ic

                        ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget AngimeList(BuildContext context, List<Angime> _angimeList) {
  if (_angimeList.length > 0) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _angimeList.length,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          itemBuilder: (context, i) {}),
    );
  } else {
    return AngimeNotFound(context);
  }
}

Widget AngimeNotFound(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.only(left: 15, top: 10),
    child: Text("Кітаптар әлі жүктелмеді, интернет байланысыңызды тексеріңіз!",
        textAlign: TextAlign.left, style: TextStyle(fontSize: 14.0)),
  );
}
