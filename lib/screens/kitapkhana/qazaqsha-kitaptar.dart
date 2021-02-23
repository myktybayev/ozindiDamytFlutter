import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ozindi_damyt/screens/kitapkhana/book.dart';
import 'package:firebase_database/firebase_database.dart';

import 'bir-kitap-about.dart';

class FilterByLanguageKitaptar extends StatefulWidget {
  final String kitapLanguage;

  const FilterByLanguageKitaptar({Key key, @required this.kitapLanguage}) : super(key: key);

  @override
  _FilterByLanguageKitaptarState createState() => _FilterByLanguageKitaptarState();
}

class _FilterByLanguageKitaptarState extends State<FilterByLanguageKitaptar> {
  List<Book> _bookList;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamSubscription<Event> _onBookAddedSubscription;
  StreamSubscription<Event> _onBookChangedSubscription;
  Query _bookQuery;

  // final books = <Book>[
  //   Book(name: 'Абай жолы ', author: 'Author',page_number: 100,rating: "3.5", photo: 'https://adebiportal.kz/images/w350-cct-si/upload/iblock/3ae/3ae4a3897f409d28af79d414be178d53.jpg'),
  //   Book(name: 'Қара сөз', author: 'Author1',page_number: 100,rating: "4", photo: 'https://adebiportal.kz/images/w350-cct-si/upload/iblock/f77/f7728c4a593ea0449a3720e8d8ee735c.jpg'),
  //   Book(name: 'Көшпенділер', author: 'Author2',page_number: 100,rating: "5", photo: 'https://s.f.kz/prod/428/427296_550.jpg'),
  //   Book(name: 'Көшпенділер', author: 'Author2',page_number: 100,rating: "5", photo: 'https://s.f.kz/prod/428/427296_550.jpg'),
  //   Book(name: 'Көшпенділер', author: 'Author2',page_number: 100,rating: "5", photo: 'https://s.f.kz/prod/428/427296_550.jpg'),
  //   Book(name: 'Көшпенділер', author: 'Author2',page_number: 100,rating: "5", photo: 'https://s.f.kz/prod/428/427296_550.jpg')
  // ];
  String titleText = "Қазақша кітаптар";

  @override
  void initState() {
    super.initState();

    _bookList = new List();
    _bookQuery = _database
        .reference()
        .child("library")
        .orderByChild("language")
        .equalTo(widget.kitapLanguage);

    if(widget.kitapLanguage == 'rus'){
      titleText = "Орысша кітаптар";
    }

    // .orderByChild("name")
    // .equalTo(widget.userId);

    // _bookList.add(books[0]);
    // _bookList.add(books[1]);
    // _bookList.add(books[2]);
    // _bookList.add(books[3]);
    // _bookList.add(books[4]);
    // _bookList.add(books[5]);

    _onBookAddedSubscription = _bookQuery.onChildAdded.listen(onEntryAdded);
    _onBookChangedSubscription = _bookQuery.onChildChanged.listen(onEntryChanged);
  }

  Book categories;

  onEntryAdded(Event event) {
    setState(() {
      _bookList.add(Book.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    print('onEntryChanged');

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
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(titleText,style: TextStyle(color: Colors.black),),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          //     tooltip: 'back',
          //     onPressed: () {},
          //   ),
          // ],
          backgroundColor: Colors.white,
          elevation: 50.0,
          brightness: Brightness.dark,
        ),

        //

        body: StreamBuilder(
                  stream: _bookQuery.onValue,
                  builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                  } else {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        child: GridView.extent(
                          // crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 10.0,
                            maxCrossAxisExtent: 150,
                          children: List.generate(_bookList.length, (index) {
                              return Container(

                                child: SizedBox(
                                  child: Container(

                                          child: bookItem(context, _bookList[index])),

                                ),
                              );
                          }
                          )),
                      );
                  }
                  })
    ));
  }

  Widget progess(){
    CircularProgressIndicator circularProgressIndicator = CircularProgressIndicator();
    return circularProgressIndicator;
  }

  Widget bookItem(BuildContext context, Book book){
    Size size=MediaQuery.of(context).size;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double text=MediaQuery.textScaleFactorOf(context);
    print(width);
    return Container(
        child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: GestureDetector(
                      child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3), //color of shadow
                                  spreadRadius: 2, //spread radius
                                  blurRadius: 12, // blur radius
                                )
                              ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'images/book-cover.png',
                                  image: book.photo,
                                  width: width/5.5,
                                  height: width/4,
                                  fit: BoxFit.fill,
                                ),
                                  // child: FadeInImage.assetNetwork(
                                  //     placeholder: 'images/book-cover.png',
                                  //     width: 70,
                                  //     height: 90,
                                  //     fit: BoxFit.cover,
                                  //   book.photo,
                                  // )
                              ),
                            ),
                            Text(
                              book.name,
                              maxLines: 1,
                              textAlign: TextAlign.center,

                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: width/32),
                            ),
                            Text(
                              book.author,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: width/32),
                            ),
                          ]
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Kitap_about(book: book)),
                        );
                      }
                  ),
                ),
              )
      );
  }

  Widget bookNotFound(BuildContext context){
    return Container(
      // color: Colors.green,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 15, top: 10),
      child: Text("Кітаптар әлі жүктелмеді",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20.0)
      ),
    );
  }
}



