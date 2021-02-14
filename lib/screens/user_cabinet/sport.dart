import 'package:flutter/material.dart';
import 'dart:math';
import 'package:icon_shadow/icon_shadow.dart';

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
                icon: new Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),
                onPressed: () => Navigator.of(context).pop(null),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Рейтинг",style: TextStyle(color: Colors.black),)),
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
class sport_user extends StatefulWidget {
  @override
  _sport_user createState() => _sport_user();
}

class _sport_user extends State<sport_user> {
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
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(null),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Спорт",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),

          // title: Container(
          //     margin: EdgeInsets.only(left: 20),
          //     child: Text("Спорт",style: TextStyle(color: Colors.black),)
          // ),


          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.trending_up_rounded , color: Colors.black,),
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );},
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
                    height: 90.0,
                    child: InkWell(
                      child: Row(

                        children: [

                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.directions_run_rounded, color: Colors.black,size: 22,),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('Жүгіру',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.event, color: Colors.black,size: 21,),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('19.01',style: TextStyle(fontSize: 15),)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.timer_outlined , color: Colors.black,size: 19,),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('56',style: TextStyle(fontSize: 15),)),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('мин',style: TextStyle(fontSize: 15),)),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,

                                  children: [


                                    Container(
                                      margin: EdgeInsets.only(left: 120,bottom: 10),
                                      child: Row(
                                        children: [

                                          Container(margin:EdgeInsets.only(left: 5),child: Text('6340',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                                          Container(margin:EdgeInsets.only(left: 5),child: Text('қадам',style: TextStyle(fontSize: 15),)),
                                        ],
                                      ),
                                    ),
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
                    height: 90.0,
                    child: InkWell(
                      child: Row(

                        children: [

                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.directions_run_rounded, color: Colors.black,size: 22,),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('Жүгіру',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.event, color: Colors.black,size: 21,),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('19.01',style: TextStyle(fontSize: 15),)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.timer_outlined , color: Colors.black,size: 19,),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('56',style: TextStyle(fontSize: 15),)),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('мин',style: TextStyle(fontSize: 15),)),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,

                                  children: [


                                    Container(
                                      margin: EdgeInsets.only(left: 120,bottom: 10),
                                      child: Row(
                                        children: [

                                          Container(margin:EdgeInsets.only(left: 5),child: Text('6340',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                                          Container(margin:EdgeInsets.only(left: 5),child: Text('қадам',style: TextStyle(fontSize: 15),)),
                                        ],
                                      ),
                                    ),
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
                    height: 90.0,
                    child: InkWell(
                      child: Row(

                        children: [

                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.directions_run_rounded, color: Colors.black,size: 22,),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('Жүгіру',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.event, color: Colors.black,size: 21,),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('19.01',style: TextStyle(fontSize: 15),)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.timer_outlined , color: Colors.black,size: 19,),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('56',style: TextStyle(fontSize: 15),)),
                                        Container(margin:EdgeInsets.only(left: 5),child: Text('мин',style: TextStyle(fontSize: 15),)),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,

                                  children: [


                                    Container(
                                      margin: EdgeInsets.only(left: 120,bottom: 10),
                                      child: Row(
                                        children: [

                                          Container(margin:EdgeInsets.only(left: 5),child: Text('6340',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                                          Container(margin:EdgeInsets.only(left: 5),child: Text('қадам',style: TextStyle(fontSize: 15),)),
                                        ],
                                      ),
                                    ),
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