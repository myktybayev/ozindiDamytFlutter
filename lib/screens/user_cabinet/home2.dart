import 'package:flutter/material.dart';
import 'dart:math';

import '../../main.dart';

class UserHome2 extends StatefulWidget {
  @override
  UserHome2State createState() => UserHome2State();
}

class UserHome2State extends State<UserHome2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 5),
          child: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 9),
              child: FlexibleSpaceBar(
                centerTitle: true,
                title: Center(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Dostyq User',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'user@gmail.com',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Атырау Достық',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.blue,
                              child: Image.asset('images/user_icon.png')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              readBook(),
              /*
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 25),
              elevation: 6.0,
              child: SizedBox(
                height: 60.0,
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.book_outlined,
                      ),
                      Row(
                        children: [
                          Container(
                              child: Container(
                            child: Text('Кітап оқу',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17)),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                  child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('843',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                              )),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [Text('бет ')],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            */
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 25),
                elevation: 6.0,
                child: SizedBox(
                  height: 60.0,
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.comment_outlined,
                        ),
                        Row(
                          children: [
                            Container(
                                child: Container(
                              child: Row(
                                children: [
                                  Text('Quiz',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                ],
                              ),
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                    child: Container(
                                  margin: EdgeInsets.only(left: 50),
                                  child: Text('280',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                )),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [Text('балл ')],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 25),
                elevation: 6.0,
                child: SizedBox(
                  height: 60.0,
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.directions_run_rounded,
                        ),
                        Row(
                          children: [
                            Container(
                                child: Container(
                              child: Text('Спорт',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                    child: Container(
                                  margin: EdgeInsets.only(left: 50),
                                  child: Text('152',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                )),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [Text('мин ')],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget readBook() {
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

    return bookItem();
  }

  Widget bookItem() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 25),
      elevation: 6.0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: InkWell(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image.network(
                          'https://cdn.kitap.kz/storage//uploads/books/1096/Img_book.jpg',
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 4,
                        ))),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 20, left: 20),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Flexible(
                        child: Text('Қартқожа',
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text('Қартқожа',
                              maxLines: 1, style: TextStyle(fontSize: 15)),
                        ),
                      )
                    ])),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                          child: new Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new FloatingActionButton(
                                onPressed: () {},
                                heroTag: null,
                                // onPressed: add,
                                child: new Icon(
                                  Icons.remove_circle,
                                  color: Colors.grey,
                                ),
                                backgroundColor: Colors.white,
                              ),

                              _input(TextEditingController()),
                              // TextField(
                              //   onChanged: (text) {
                              //     print("First text field: $text");
                              //   },
                              // ),
                              // TextField(
                              //   decoration: InputDecoration(
                              //     border: OutlineInputBorder(),
                              //     labelText: 'Password',
                              //   ),
                              // ),

                              new FloatingActionButton(
                                onPressed: () {},
                                heroTag: null,
                                // onPressed: minus,
                                child: new Icon(
                                  Icons.add_circle_outlined,
                                  color: Colors.grey,
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _input(TextEditingController controller) {
    return Container(
      // padding: EdgeInsets.only(left: 1, right: 1),
      width: MediaQuery.of(context).size.width / 7,
      height: MediaQuery.of(context).size.height,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        obscureText: false,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        // maxLength: 4,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1)),
        ),
        // maxLength: 4,
      ),
    );
  }
}
