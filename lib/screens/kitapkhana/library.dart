import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ozindi_damyt/screens/kitapkhana/book.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ozindi_damyt/drawer/drawer.dart';
import 'package:ozindi_damyt/screens/kitapkhana/qazaqsha-kitaptar.dart';

import 'bir-kitap-about.dart';
import 'book-of-month-widget.dart';

class LibraryPage extends StatefulWidget {

  final String dbName;

  const LibraryPage({ Key key, this.dbName }) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  List<Book> _bookListNew, _bookListMostReaded, _bookListRecommended;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Query _bookQueryNew, _bookQueryMostReaded, _bookQueryRecommended;


  @override
  void initState() {
    super.initState();
    _bookListNew = new List();
    _bookListMostReaded = new List();
    _bookListRecommended = new List();

    _bookQueryNew = _database
        .reference()
        .child("library_new");

    _bookQueryMostReaded = _database
        .reference()
        .child("library_most_readed");

    _bookQueryRecommended = _database
        .reference()
        .child("library_recommended");

    // .orderByChild("name")
    // .equalTo(widget.userId);

    _bookQueryNew.onChildAdded.listen(onEntryAdded);
    // _bookQueryNew.onChildChanged.listen(onEntryChanged);

    _bookQueryMostReaded.onChildAdded.listen(onEntryAdded2);
    // _bookQueryMostReaded.onChildChanged.listen(onEntryChanged2);

    _bookQueryRecommended.onChildAdded.listen(onEntryAdded3);
    // _bookQueryRecommended.onChildChanged.listen(onEntryChanged3);

  }

  onEntryAdded(Event event) {
    setState(() {
      _bookListNew.add(Book.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

    var oldEntry = _bookListNew.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _bookListNew[_bookListNew.indexOf(oldEntry)] =
          Book.fromSnapshot(event.snapshot);
    });
  }

  onEntryAdded2(Event event) {
    setState(() {
      _bookListMostReaded.add(Book.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged2(Event event) {
    print('onEntryChanged');

    var oldEntry = _bookListMostReaded.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _bookListMostReaded[_bookListMostReaded.indexOf(oldEntry)] =
          Book.fromSnapshot(event.snapshot);
    });
  }

  onEntryAdded3(Event event) {
    setState(() {
      _bookListRecommended.add(Book.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged3(Event event) {
    print('onEntryChanged');

    var oldEntry = _bookListRecommended.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _bookListRecommended[_bookListRecommended.indexOf(oldEntry)] =
          Book.fromSnapshot(event.snapshot);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            backgroundColor: Theme
                .of(context)
                .primaryColor,
            drawer: DrawerMenu(),
            appBar: AppBar(
              title: Text("Кітапхана", style: TextStyle(color: Colors.black),),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search, color: Colors.black,),
                  tooltip: 'search',
                  onPressed: () {},
                ), //IconButton
                IconButton(
                    icon: Icon(Icons.tune, color: Colors.black,),
                    tooltip: 'tune Icon',
                    onPressed: () {
                      createAlertDialog(context);
                    }
                ), //IconButton
              ],
              //<Widget>[]
              backgroundColor: Colors.white,
              elevation: 50.0,
              leading: Builder(
                builder: (context) =>
                    IconButton(
                      icon: new Icon(Icons.menu, color: Colors.black,),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
              ),
              //IconButton
              brightness: Brightness.dark,
            ),

            body: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 10, left: 20, right: 20),
                            child: BookOfMonthWidget(),
                          ),

                          Expanded(child:
                          ListView(
                              children: <Widget>[
                                bookTypeText(context, "Жаңа кітаптар"),
                                Container(height: 200, child: bookList(context, _bookListNew)),
                                bookTypeText(context, "Ұсынылған"),
                                Container(height: 200, child: bookList(context, _bookListMostReaded)),
                                bookTypeText(context, "Көп оқылған"),
                                Container(height: 200, child: bookList(context, _bookListRecommended)),
                              ])
                          )
                        ])
        ));
  }

  Widget bookList(BuildContext context, List<Book> _bookList) {
    if (_bookList.length > 0) {
      return Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _bookList.length,
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            itemBuilder: (context, i) {
              return bookItem(context, _bookList[i]);
            }),
      );
    } else {
      return bookNotFound(context);
    }
  }


  Widget bookNotFound(BuildContext context) {
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


  Widget bookTypeText(BuildContext context, String text) {
    return Container(
      // color: Colors.green,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.only(left: 15, top: 10),
      child: Text(text,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
      ),
    );
  }

  createAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Container(
          width: 40,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: RaisedButton(
                  color: Colors.red,
                  hoverColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          const Text('Қазақша ', style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),),
                          const Text('кітаптар', style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => FilterByLanguageKitaptar(kitapLanguage: "kz")));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: RaisedButton(
                  color: Colors.red,
                  hoverColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          const Text('Орысша ', style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),),
                          const Text('кітаптар', style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),),
                        ],
                      ),
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => FilterByLanguageKitaptar(kitapLanguage: "rus",)));
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget bookItem(BuildContext context, Book book) {
    return
      Container(
        width: 130,
        child: GestureDetector(
            child: Column(
              children: [
                Container(
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
                        width: 100,
                        height: 140,
                      image:book.photo
                    )
                    /*
                    child: Image.network(
                      book.photo,
                      width: 100,
                      height: 140,
                      fit: BoxFit.cover,
                    ),

                    */
                  ),
                ),
                Flexible(
                  child: Text(
                    book.name,
                    maxLines: 1,
                    textAlign: TextAlign.center,

                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Flexible(
                    child: Text(
                      book.author,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    )),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Kitap_about(book: book)),
              );
            }),
      );
  }
}