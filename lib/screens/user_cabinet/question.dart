import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: (IconThemeData(color: Colors.black)),
          title: Row(
            children: [
              IconButton(
                icon: new Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(null),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Рейтинг",
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
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
                  elevation: 10.0,
                  child: SizedBox(
                    height: 230.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Suraq_user extends StatefulWidget {
  @override
  _Suraq_userState createState() => _Suraq_userState();
}

class _Suraq_userState extends State<Suraq_user> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                  child: Text("Quiz нәтижелері",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.trending_up_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ), //IconButton
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
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
                  elevation: 10.0,
                  child: SizedBox(
                    height: 100.0,
                    child: InkWell(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 25, top: 15),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://daryn.online/media/2020/10/13/qazaqstan-tarikhy-ubt.png',
                                        height: 70,
                                        width: 70,
                                      ))),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      'Қазақстан тарихы',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.black,
                                      size: 21,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          '19.01',
                                          style: TextStyle(fontSize: 12),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.black,
                                      size: 21,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          '100/80',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                              ],
                            ),
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
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
                  elevation: 10.0,
                  child: SizedBox(
                    height: 100.0,
                    child: InkWell(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 25, top: 15),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://daryn.online/media/2020/10/13/qazaqstan-tarikhy-ubt.png',
                                        height: 70,
                                        width: 70,
                                      ))),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      'Қазақстан тарихы',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.black,
                                      size: 21,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          '19.01',
                                          style: TextStyle(fontSize: 12),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.black,
                                      size: 21,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          '100/80',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
