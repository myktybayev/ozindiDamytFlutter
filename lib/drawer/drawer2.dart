import 'package:flutter/material.dart';
import 'package:ozindi_damyt/authentication/authentication_provider.dart';
import 'package:ozindi_damyt/screens/gibratty_angimeler/gibratty_angime_main3.dart';
import 'package:ozindi_damyt/screens/kino/cinema.dart';
import 'package:ozindi_damyt/screens/kino/cinema_page.dart';
import 'package:ozindi_damyt/screens/podcast/podcasts.dart';
import 'package:ozindi_damyt/screens/user_cabinet/user-cabinet.dart';
import '../screens/kitapkhana/library.dart';
import 'package:provider/provider.dart';

class DrawerMenu2 extends StatefulWidget {
  @override
  _DrawerMenu2State createState() => _DrawerMenu2State();
}

class _DrawerMenu2State extends State<DrawerMenu2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 305,
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              children: [
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: UserAccountsDrawerHeader(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(1, 1, 1, 0)),
                      accountName: Text('Dostyq User'),
                      accountEmail: Text('user@gmail.com'),
                      currentAccountPicture: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.blue,
                          child: Image.asset('images/user_icon.png')),
                      /*
                      FadeInImage.assetNetwork(
                      placeholder: 'images/user_icon.png',
                      image: book.photo,
                      width: 70,
                      height: 90,
                      fit: BoxFit.cover,
                  ),
                   */
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => UserCabinet()));
                  },
                ),
              ],
            ),
            ListTile(
              focusColor: Colors.blueGrey,
              leading: Image.asset('images/kitaphana.png',
                color: Colors.black,
                width: 30,
                height: 30,
              ),
              title: Text('Кітапхана',style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
                  return LibraryPage();
                }));
              },
            ),
            ListTile(
              leading: Image.asset('images/gibratty_angime.png',
                        color: Colors.black,
                        width: 30,
                        height: 30,
              ),
              title: Text(
                'Ғибратты әңгімер',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return GibrattyAngimeMain();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.mic_rounded,
                color: Colors.black,
              ),
              title: Text(
                'Подкаст',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return PodcastPage();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.accessibility_new_sharp,
                color: Colors.black,
              ),
              title: Text(
                'Марафон',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  // return Marathon();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.waves_sharp, color: Colors.black),
              title: Text(
                'Quizz',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  // return Quiz();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle_outlined, color: Colors.black),
              title: Text(
                'Профориентация',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  // return Pro();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.now_widgets_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Хобби',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  // return Hobby();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.sports_tennis_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Спорт',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  // return Sport();
                }));
              },
            ),
            ListTile(
              leading: Image.asset(
                'images/kino.png',
                color: Colors.black,
                width: 30,
                height: 30,
              ),
              title: Text(
                'Кино',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return CinemaPage();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.announcement_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Жаңа ұсыныстар',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  // return Mas();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              title: Text(
                'Шығу',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                context.read<AuthenticationProvider>().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
