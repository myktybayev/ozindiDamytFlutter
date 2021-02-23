import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ozindi_damyt/drawer/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ozindi_damyt/screens/quiz/quiz_db.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizPage extends StatefulWidget {
  final String dbName;
  const QuizPage({Key key, this.dbName}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final quiz = <QuizDb>[];
  List<QuizDb> _quizListNew;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onQuizAddedSubscription;
  StreamSubscription<Event> _onQuizChangedSubscription;
  Query _quizQuery;

  @override
  void initState() {
    super.initState();

    _quizListNew = new List();
    _quizQuery = _database.reference().child("quizzes");

    _onQuizAddedSubscription = _quizQuery.onChildAdded.listen(onEntryAdded);
    _onQuizChangedSubscription =
        _quizQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    setState(() {
      _quizListNew.add(QuizDb.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _quizListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _quizListNew[_quizListNew.indexOf(oldEntry)] =
          QuizDb.fromSnapshot(event.snapshot);
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
        title: Text('Quizziz'),
      ),
      body: ListView.builder(
          itemCount: _quizListNew.length,
          itemBuilder: (context, i) {
            return quizItem(context, _quizListNew[i]);
          }),
    );
  }

  Widget quizItem(BuildContext context, QuizDb quizDb) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(right: 10, left: 10, top: 10),
        child: Container(
          // width: MediaQuery.of(context).size.width / 20,
          height: MediaQuery.of(context).size.height / 6,
          child: Center(
            child: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                // height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: NetworkImage(quizDb.photo),
                              fit: BoxFit.fitHeight,
                            )),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.,
                          children: [
                            Container(
                              child: Flexible(
                                flex: 2,
                                child: Text(
                                  quizDb.title,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: RaisedButton(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                child: Text(
                                  'Тестті тапсыру',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                onPressed: () async {
                                  final url = quizDb.link;
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
              ),
            ),
          ),
        ),
      ),
    )
    );
  }
}
