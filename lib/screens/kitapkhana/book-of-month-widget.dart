import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ozindi_damyt/screens/kitapkhana/book.dart';
import 'package:firebase_database/firebase_database.dart';

import 'bir-kitap-about.dart';

class BookOfMonthWidget extends StatefulWidget {
  @override
  _BookOfMonthWidget createState() => _BookOfMonthWidget();
}

class _BookOfMonthWidget extends State<BookOfMonthWidget> {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  StreamSubscription<Event> _onBookAddedSubscription;
  StreamSubscription<Event> _onBookChangedSubscription;
  Query _bookQuery;
  List<Book> _bookList;

  @override
  void initState() {
    super.initState();

    _bookList = new List();
    _bookQuery = _database.reference().child("monthOfBook");

    _onBookAddedSubscription = _bookQuery.onChildAdded.listen(onEntryAdded);
    _onBookChangedSubscription =
        _bookQuery.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    print('BookOfMonthWidget onEntryAdded');
    setState(() {
      _bookList.add(Book.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    var oldEntry = _bookList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _bookList[_bookList.indexOf(oldEntry)] =
          Book.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_bookList.length > 0) {
      return Container(
          margin: EdgeInsets.symmetric(vertical: 1.0),
          child: Column(children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Kitap_about(book: _bookList[0])),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5.5,
                  child: Center(
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/month_book_back.png')),
                          // image: NetworkImage('https://news.wisc.edu/content/uploads/2019/12/aerial_UW_wide16_3086.jpg'),)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width / 18),

                                child: FadeInImage.assetNetwork(
                                    placeholder: 'images/book-cover.png',
                                    // width: MediaQuery.of(context).size.width  ,
                                    height: MediaQuery.of(context).size.height / 7,
                                    fit: BoxFit.contain,
                                    image: _bookList[0].photo),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 2, left: 15, bottom: 5),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 25),
                                        child: Text(
                                          'Осы айдың',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Comfortaa',
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(right: 25, top: 5),
                                        child: Text(
                                          'үздік кітабі ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Comfortaa',
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(_bookList[0].name,
                                              // 'Тастамашы Ана!',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                  fontFamily: 'Comfortaa',
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          margin:
                                              EdgeInsets.only(top: 5, left: 15),
                                          child: Text(_bookList[0].author,
                                              // 'А.Баймұхамедов ',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Comfortaa',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Container(
            //   // color: Colors.green,
            //   width: MediaQuery.of(context).size.width,
            //   margin: EdgeInsets.only(left: 15, top: 10),
            //   child: Text("Жаңа кітаптар",
            //       textAlign: TextAlign.left,
            //       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
            //   ),
            // ),
          ]));
    } else {
      return Center(
        child: Text('Интернет байланысыңызды тексеріңіз!'),
      );
    }
  }

  void _showToast(BuildContext context, Text text) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: text,
        action:
            SnackBarAction(label: 'X', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
