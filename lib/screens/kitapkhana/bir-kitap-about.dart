import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ozindi_damyt/screens/kitapkhana/book.dart';
import 'dart:ui';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class Kitap_about extends StatelessWidget {
  final Book book;

  Kitap_about({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Stack(
          children: <Widget>[
            SizedBox(
              height: 210,
              child: Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(book.photo),
                        fit: BoxFit.cover)
                ),
              ),
            ),
            Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left:10, top: 30),
                    child: Transform.rotate(
                      angle: 0 * pi/180,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 45),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 20,top: 65),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 12, // blur radius
                            )]),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                book.photo,
                                width: 120,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                      ),
                    )),
                    Expanded(
                      flex: 2,
                      child:Container(
                        margin: EdgeInsets.only(left: 20, top: 100, right: 20),
                        // width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                Text(book.name,
                                style:
                                TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text(book.author,
                                  style:
                                  TextStyle(
                                      fontSize: 14),)),

                            Column(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(top: 5,right: 5),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.red,size: 16,),
                                      Icon(Icons.star, color: Colors.red,size: 16,),
                                      Icon(Icons.star, color: Colors.red,size: 16,),
                                      Icon(Icons.star, color: Colors.red,size: 16,),
                                      Icon(Icons.star_half, color: Colors.red,size: 16,),
                                      Container(
                                          margin: EdgeInsets.only(left: 8),
                                          child: Text('4.8',style: TextStyle(fontSize: 14),)),
                                    ],
                                  ),
                                ),

                              ],
                            ),



                          ],
                        )
                    ),
                    )
                  ],
                ),
                Flexible(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Text(book.desc,
                            style: TextStyle(fontSize: 13),),
                        )
                      ]
                )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(
                    height: 40,
                    width:  150,
                    child: RaisedButton(
                        color: Colors.red,
                        hoverColor: Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: const Text('Жүктеу',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),

                        onPressed: () async {
                          String url = book.url;
                          if (await canLaunch(url)) {
                            print(url);
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          };
                        }
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