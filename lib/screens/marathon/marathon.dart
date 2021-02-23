import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ozindi_damyt/drawer/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'marathon_db.dart';

class MarathonPage extends StatefulWidget {
  final String dbName;
  const MarathonPage({Key key, this.dbName}) : super(key: key);

  @override
  _MarathonPageState createState() => _MarathonPageState();
}

class _MarathonPageState extends State<MarathonPage> {
  final marathon = <MarathonDb>[];
  List<MarathonDb> _marathonListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onMarathonAddedSubscription;
  StreamSubscription<Event> _onMarathonChangedSubscription;
  Query _marathonQuery;

  @override
  void initState() {
    super.initState();

    _marathonListNew = new List();
    _marathonQuery = _database.reference().child("marathons");

    _onMarathonAddedSubscription =
        _marathonQuery.onChildAdded.listen(onEntryAdded);
    _onMarathonChangedSubscription =
        _marathonQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    setState(() {
      _marathonListNew.add(MarathonDb.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _marathonListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _marathonListNew[_marathonListNew.indexOf(oldEntry)] =
          MarathonDb.fromSnapshot(event.snapshot);
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
        title: Text('Марафон'),
      ),
      body: ListView.builder(
          itemCount: _marathonListNew.length,
          itemBuilder: (context, i) {
            return marathonItem(context, _marathonListNew[i]);
          }),
    );
  }

  Widget marathonItem(BuildContext context, MarathonDb marathonDb) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            final url = marathonDb.report;
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: MediaQuery.of(context).size.width * 100,
              height: MediaQuery.of(context).size.height / 4,
              child: Center(
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.srcOver),
                        fit: BoxFit.cover,
                        image: NetworkImage(marathonDb.photo),
                      ),
                    ),
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.only(top: 6, left: 15),
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 5, left: 5, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(bottom: 3, left: 3),
                                  child: Text(
                                    marathonDb.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Comfortaa',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(bottom: 5, left: 3),
                                  // width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    marathonDb.desc,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      padding: EdgeInsets.only(right: 5),
                                      child: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      marathonDb.date,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 3),
                                      child: Image.asset(
                                        'images/present.png',
                                        width: 25,
                                        height: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 10,
                                      child: AutoSizeText(
                                        marathonDb.present,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
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
