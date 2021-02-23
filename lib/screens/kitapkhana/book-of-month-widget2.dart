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
    _bookQuery = _database
        .reference()
        .child("monthOfBook");

    _onBookAddedSubscription = _bookQuery.onChildAdded.listen(onEntryAdded);
    _onBookChangedSubscription = _bookQuery.onChildChanged.listen(onEntryChanged);
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
    Size size=MediaQuery.of(context).size;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double text=MediaQuery.textScaleFactorOf(context);
    print(width);

    if (_bookList.length > 0) {
      return Container(
          margin: EdgeInsets.symmetric(vertical: 1.0),
          height: width/2,
          child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Kitap_about(book: _bookList[0])),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Center(
                        child: Card(
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child:  Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/month_book_back.png')),
                              // image: NetworkImage('https://news.wisc.edu/content/uploads/2019/12/aerial_UW_wide16_3086.jpg'),)
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3), //color of shadow
                                      spreadRadius: 2, //spread radius
                                      blurRadius: 12, // blur radius
                                    )
                                  ]),

                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: FadeInImage.assetNetwork(
                                        placeholder: 'images/book-cover.png',
                                        width: 70,
                                        height: 110,
                                        fit: BoxFit.cover,
                                        image:_bookList[0].photo
                                    )
                                  ),
                                ),
                                Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Column(crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: [
                                                    Container(

                                                        child:
                                                        Text('Осы айдың', style: TextStyle(fontSize: width/17, fontWeight: FontWeight.bold, fontFamily: 'Comfortaa', color: Colors.white))),
                                                    Container(

                                                        child: Text('үздік кітабі ', style: TextStyle(fontSize: width/17, fontWeight: FontWeight.bold, fontFamily: 'Comfortaa', color: Colors.white))),
                                                  ],
                                                ),
                                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(

                                                    child:
                                                    Text(_bookList[0].name,
                                                        // 'Тастамашы Ана!',
                                                        style: TextStyle(
                                                            fontSize: width/20,
                                                            color: Colors.white,
                                                            fontFamily: 'Comfortaa',
                                                            fontWeight: FontWeight.bold))),

                                                Container(margin: EdgeInsets.only(top: 5),

                                                    child: Text(_bookList[0].author,
                                                        // 'А.Баймұхамедов ',
                                                        style: TextStyle(
                                                            fontSize: width/30,
                                                            fontFamily: 'Comfortaa',
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white))),
                                              ],
                                            ),

                                        ],
                                      ),
                                    )),
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
              ]

          ));
    }else{
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
        action: SnackBarAction(
            label: 'X', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}