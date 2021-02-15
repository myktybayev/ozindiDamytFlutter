import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ozindi_damyt/screens/gibratty_angimeler/angime.dart';
import 'package:ozindi_damyt/drawer/drawer.dart';
import 'dart:ui';

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
  Widget build(BuildContext context) {
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
              brightness: Brightness.dark,
            ),
            body: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _angimeListNew.length,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                itemBuilder: (context, i) {
                  return angimeItem(_angimeListNew[i]);
                  // return angimeItem(context, _bookList[i]);
                })));
  }

  Widget angimeItem(Angime angime) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(top: 15),
      elevation: 10.0,
      child: SizedBox(
        height: 100.0,
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    angime.photo,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(angime.title,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                    ),
                  )),
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 30,
                  ),
                  tooltip: 'оқу',
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
