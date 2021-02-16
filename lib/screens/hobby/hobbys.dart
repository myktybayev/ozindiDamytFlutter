import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ozindi_damyt/drawer/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hobby_db.dart';

class HobbysPage extends StatefulWidget {
  final String dbName;
  const HobbysPage({Key key, this.dbName}) : super(key: key);

  @override
  _HobbysPageState createState() => _HobbysPageState();
}

class _HobbysPageState extends State<HobbysPage> {
  List<HobbyDb> _hobbyListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onHobbyAddedSubscription;
  StreamSubscription<Event> _onHobbyChangedSubscription;
  Query _hobbyQuery;

  @override
  void initState() {
    super.initState();

    _hobbyListNew = new List();
    _hobbyQuery = _database.reference().child("hobby");

    _onHobbyAddedSubscription = _hobbyQuery.onChildAdded.listen(onEntryAdded);
    _onHobbyChangedSubscription =
        _hobbyQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    setState(() {
      _hobbyListNew.add(HobbyDb.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _hobbyListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _hobbyListNew[_hobbyListNew.indexOf(oldEntry)] =
          HobbyDb.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        actions: [
          /*
          IconButton(icon: Icon(Icons.search), onPressed: () {})
          */
        ],
        title: Text('Хобби'),
        elevation: 50,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: _hobbyListNew.length,
          itemBuilder: (context, i) {
            return hobbyItem(context, _hobbyListNew[i]);
          }),
    );
  }

  Widget hobbyItem(BuildContext context, HobbyDb hobbyDb) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            final url = hobbyDb.link;
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: Center(
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(6),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.srcOver),
                          image: NetworkImage(hobbyDb.photo),
                        ),
                      ),
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 6, left: 15),
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                hobbyDb.title,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.1),
                                  fontFamily: 'Comfortaa',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
