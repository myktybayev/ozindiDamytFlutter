import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

class UserBooks extends StatefulWidget {
  @override
  UserBooksState createState() => UserBooksState();
}

class UserBooksState extends State<UserBooks> {
  int _n = 0;

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: new Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(null),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Кітап оқу",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
          actions: <Widget>[
            //IconButton
            //IconButton
          ], //<Widget>[]
          backgroundColor: Colors.white,
          elevation: 50.0,
          //IconButton
        ),
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: SizedBox(
                          height: 50,
                          width: 160,
                          child: RaisedButton(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              highlightElevation: 20.0,
                              hoverColor: Colors.white,
                              color: Colors.white,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Text('Оқылған',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15))),
                                    Container(
                                        child: Text('кітаптар',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15))),
                                  ],
                                ),
                              ),
                              textColor: Colors.black,
                              disabledTextColor: Colors.black,
                              disabledColor: Colors.grey,
                              onPressed: () {}),
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          height: 50,
                          width: 160,
                          child: RaisedButton(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              highlightElevation: 20.0,
                              hoverColor: Colors.white,
                              color: Colors.white,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Text('Оқылған',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15)))),
                                    Container(
                                        child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Text('әңгімелер',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15)))),
                                  ],
                                ),
                              ),
                              textColor: Colors.black,
                              disabledTextColor: Colors.black,
                              disabledColor: Colors.grey,
                              onPressed: () {}),
                        ),
                      ),
                    ],
                  ),
                ),

                bookItem(),
                bookItem(),

              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget bookItem(){
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 25),
      elevation: 6.0,
      child: SizedBox(
        height: 150.0,
        child: InkWell(
          child: Row(
            children: [
              Padding(
                  padding:
                  const EdgeInsets.only(left: 20, bottom: 10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.0),
                      child: Image.network(
                        'https://cdn.kitap.kz/storage//uploads/books/1096/Img_book.jpg',
                        height: 100,
                        width: 70,
                      ))
              ),

              Flexible(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Flexible(
                            flex: 1,

                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Flexible(
                                    child: Text('Қартқожа',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text('Қартқожа',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 15)),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text('Бітірген күні: 01.02.21',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 15)),
                                    ),
                                  ),

                            ])
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
