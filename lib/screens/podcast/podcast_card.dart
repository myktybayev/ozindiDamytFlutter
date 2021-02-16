import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PodcastCard extends StatefulWidget {
  @override
  _PodcastCardState createState() => _PodcastCardState();
}

class _PodcastCardState extends State<PodcastCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      height: MediaQuery.of(context).size.height / 5.7,
      width: MediaQuery.of(context).size.width ,
      child: GestureDetector(
        onTap: () async {
          const url = 'https://podcasts.google.com/';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.8,
            child: Center(
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.1),
                          BlendMode.srcOver),
                      fit: BoxFit.fitWidth,
                      image: AssetImage('images/podcast_back.jfif'),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 25,left: MediaQuery.of(context).size.width / 25, bottom: 5),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Подкаст',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Comfortaa',
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      'тыңдауға ыңғайлы',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Comfortaa',
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      'программа',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Comfortaa',
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          // right: MediaQuery.of(context).size.width / 37,
                        ),
                        child: Image.asset(
                          'images/googlepod.png',
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 10,
                          fit: BoxFit.fitWidth,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
