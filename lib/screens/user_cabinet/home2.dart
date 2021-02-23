import 'package:flutter/material.dart';
import 'dart:math';

import '../../main.dart';

class UserHome2 extends StatefulWidget {
  @override
  UserHome2State createState() => UserHome2State();
}

class UserHome2State extends State<UserHome2> {

  bool showAddPage = false;
  @override
  Widget build(BuildContext context) {

  Size size=MediaQuery.of(context).size;
  double height=MediaQuery.of(context).size.height;
  double width=MediaQuery.of(context).size.width;
  double text=MediaQuery.textScaleFactorOf(context);

  print(width);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset:false,
        resizeToAvoidBottomPadding:false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(width/2),
          child: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 30),
              child: FlexibleSpaceBar(
                centerTitle: true,
                title: userInfo(),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child:Column(
          children: <Widget>[
            bookItem(),
            // quizItem(),
            // sportItem()
            ],
          ),
        ),
      ),
    );
  }

  Widget userInfo(){
    return
      Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 25,
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
                  ],
                ),
              ],
            ),
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
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                    child: Image.asset('images/user_icon.png')
                ),
              ],
            ),
          ],
        ),
      );
  }

  Widget bookItem(){
    Size size=MediaQuery.of(context).size;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double text=MediaQuery.textScaleFactorOf(context);
    print(width);

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
                        height: width/3,
                        width: width/4.5,
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
                                  )])),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Row(
                                children: [
                                      Container(
                                        child: SizedBox(
                                          height: width/14,
                                          child:
                                          (
                                              showAddPage
                                              ? addReadPage()
                                              : normalStateBookPage()
                                          )

                                        ),
                                      ),
                                    ],
                                  )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: SizedBox(
                              height: width/14,
                              child: FloatingActionButton(
                                heroTag: null,
                                onPressed: _btnAddPage,
                                backgroundColor: Colors.white,
                                child:
                                (
                                    showAddPage
                                        ? Icon(Icons.save, color: Colors.grey,)
                                        : Icon(Icons.add_circle_outlined, color: Colors.grey,)
                                ),
                              ),

                          ),
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

  void _btnAddPage(){
    setState(() {
      showAddPage = !showAddPage;
    });
  }

  Widget normalStateBookPage(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[

        Text('0', maxLines: 1,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18)),

        Text('/200 бет', maxLines: 1,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ],
    );
  }

  Widget addReadPage(){
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _input(TextEditingController()),

        Text('/200 бет', maxLines: 1,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        //
        // new FloatingActionButton(
        //   heroTag: null,
        //   onPressed: _btnSave,
        //   child: new Icon(
        //     Icons.save,
        //     color: Colors.grey,
        //   ),
        //   backgroundColor: Colors.white,
        // ),

      ],
    );
  }

  Widget _input(TextEditingController controller){

    Size size=MediaQuery.of(context).size;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double text=MediaQuery.textScaleFactorOf(context);

    print(width);
    return Container(
      padding: EdgeInsets.only(left: 1, right: 1),
      width: width/8,
      height: width/5,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        obscureText: false,
        style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        // maxLength: 4,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1)
            ),
        ),
        // maxLength: 4,
      ),
    );
  }


  Widget sportItem(){
    return Card(
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
    );
  }
  Widget quizItem(){
    return Card(
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
    );
  }
}
