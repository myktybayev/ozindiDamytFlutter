import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ozindi_damyt/drawer/drawer.dart';
import 'package:ozindi_damyt/screens/podcast/podcast_card.dart';
import 'package:ozindi_damyt/screens/podcast/podcastdb.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';

import 'cinema.dart';


class CinemaPage extends StatefulWidget {
  final String dbName;

  const CinemaPage({Key key, this.dbName}) : super(key: key);
  @override
  _CinemaPageState createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  final podcasts = <PodcastDb>[];
  List<Cinema> _cinemaListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onPodcastAddedSubscription;
  StreamSubscription<Event> _onPodcastChangedSubscription;
  Query _cinemaQuery;

  @override
  void initState() {
    super.initState();

    _cinemaListNew = new List();
    _cinemaQuery = _database.reference().child("cinema");

    _onPodcastAddedSubscription =
        _cinemaQuery.onChildAdded.listen(onEntryAdded);
    _onPodcastChangedSubscription =
        _cinemaQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    setState(() {
      _cinemaListNew.add(Cinema.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _cinemaListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _cinemaListNew[_cinemaListNew.indexOf(oldEntry)] =
          Cinema.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Кинолар"),
        actions: [
          /*
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              tooltip: 'search',
              onPressed: () {}),
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {},
            tooltip: 'tune Icon',
          )
          */
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,
                  itemCount: _cinemaListNew.length,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  itemBuilder: (context, i) {
                    return cinemaItem(context, _cinemaListNew[i]);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget cinemaItem(BuildContext context, Cinema cinema) {
    return Container(
      child: GestureDetector(
        child: Column(
          children: [

            Expanded(flex: 1,
            child:
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 12,
                ),
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  cinema.photo,
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    ),
            Expanded(flex: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 2),
                child: Text(
                  cinema.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        onTap: () async {
          final url = cinema.link;
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
      ),
    );
  }
}
