import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ozindi_damyt/screens/gibratty_angimeler/angime.dart';
import 'package:like_button/like_button.dart';
import 'dart:ui';
import 'angime.dart';

class Angime_about extends StatelessWidget {
  final Angime angime;

  Angime_about({Key key, @required this.angime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[

            SizedBox(
              height: 210,
              child: Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    decoration:
                    BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(angime.photo), fit: BoxFit.cover)),
              ),
            ),

            Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 10, top: 30),
                    child: Transform.rotate(
                      angle: 0 * pi / 180,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                            color: Colors.white, size: 45),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LikeButton(
                        size:width/5,
                        circleColor:
                        CircleColor(start: Colors.redAccent, end: Colors.red[600]),
                        bubblesColor: BubblesColor(
                          dotPrimaryColor: Colors.pink,
                          dotSecondaryColor: Colors.red,
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                              Icons.favorite,
                              color: isLiked ? Colors.red : Colors.grey,
                              size: width/8
                          );
                        },



                      ),
                    ],
                  ),
                ),
              ],
            ),

            Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 215),
                  child: ListView(children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 15),
                      child: Text(
                        angime.desc,
                        style: TextStyle(fontSize: width/25),
                      ),
                    )
                  ]),
                )),







          ],
        ),
      ),
    );
  }
}