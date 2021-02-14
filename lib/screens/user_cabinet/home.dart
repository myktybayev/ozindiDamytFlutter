import 'package:flutter/material.dart';
import 'dart:math';

import '../../main.dart';


class  UserHome extends StatefulWidget {
  @override
  UserHomeState createState() => UserHomeState();
}

class UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(170.0),
          child: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 30),
              child: FlexibleSpaceBar(
                centerTitle: true,
                title: Center(
                  child: Column(
                    children: <Widget>[
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                // width: MediaQuery.of(context).size.width,
                                // alignment: Alignment.topLeft,
                                // color: Colors.green,
                                padding: EdgeInsets.only(left: 10),
                                child: IconButton(
                                  icon: Transform.rotate(
                                    angle: 0 * pi / 180,
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: 25,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyApp()),
                                    );
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0, top:12.0),
                                        child: Text(
                                          'Username',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0, top:10.0),
                                        child: Text(
                                          'user@gmail.com',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0, top:10.0),
                                        child: Text(
                                          'Atyrau Dostyk',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ]),
                                   Container(
                                          child: CircleAvatar(
                                          radius: 45,
                                          child: Image.network(
                                            'https://avatanplus.com/files/resources/original/5bb23ac06077d16630357f8b.jpg',
                                          ),
                                        ),
                                      ),

                                      ])
                            ],
                          ),
                        // ],
                      //),


                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Username',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'User@gmail.com',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 45,
                            child: Image.network(
                              'https://avatanplus.com/files/resources/original/5bb23ac06077d16630357f8b.jpg',
                            ),
                          ),
                        ],
                      ), */
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
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
                              child:
                              Container(


                                    child: Text('Кітап оқу',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),

                              )
                          ),

                        ],


                      ),
                      Row(

                        children: [
                          Row(
                            children: [
                              Container(
                                  child:
                                  Container(
                                    margin: EdgeInsets.only(left: 10),

                                    child: Text('843',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),

                                  )
                              ),

                            ],


                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [

                                Text('бет ')

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
                      Row(children: [
                          Container(
                              child:
                              Container(
                                child: Row(

                                  children: [
                                    Text('Quiz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                  ],
                                ),

                              )
                          ),

                        ],
                      ),
                      Row(

                        children: [
                          Row(
                            children: [
                              Container(
                                  child:
                                  Container(
                                    margin: EdgeInsets.only(left: 50),



                                    child: Text('280',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),

                                  )
                              ),

                            ],


                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [

                                Text('балл ')

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
                              child:
                              Container(


                                child: Text('Спорт',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),

                              )
                          ),

                        ],


                      ),
                      Row(

                        children: [
                          Row(
                            children: [
                              Container(
                                  child:
                                  Container(
                                    margin: EdgeInsets.only(left: 50),

                                    child: Text('152',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),

                                  )
                              ),

                            ],


                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [

                                Text('мин ')

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



          ],
        ),

      ),
    );
  }
}