import 'package:flutter/material.dart';
import 'package:ozindi_damyt/authentication/authentication_provider.dart';
import 'package:ozindi_damyt/screens/gibratty_angimeler/gibratty_angime_main3.dart';
import 'package:ozindi_damyt/screens/hobby/hobbys.dart';
import 'package:ozindi_damyt/screens/jana_usinis/jana_usinis.dart';
import 'package:ozindi_damyt/screens/kino/cinema_page.dart';
import 'package:ozindi_damyt/screens/marathon/marathon.dart';
import 'package:ozindi_damyt/screens/podcast/podcasts.dart';
import 'package:ozindi_damyt/screens/proforient/proforient.dart';
import 'package:ozindi_damyt/screens/quiz/quiz.dart';
import 'package:ozindi_damyt/screens/sport/sport.dart';
import 'package:ozindi_damyt/screens/user_cabinet/user-cabinet.dart';
import '../screens/kitapkhana/library.dart';
import 'package:provider/provider.dart';


class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {

  Widget CreateElements(String title, MaterialPageRoute materialPageRoute, String image_source){
    return ListTile(
      leading: Image.asset('images/'+image_source, color: Colors.black, width: 30, height: 30,),
      // CircleAvatar(
      //     foregroundColor: Colors.black,
      //     // backgroundImage: AssetImage('assets/images/'+image_source)),
      //     backgroundImage: new AssetImage('images/'+image_source)),

      title: Text(title, style: TextStyle(color: Colors.black),),
      onTap: (){
        Navigator.of(context).pop();
        Navigator.push(context, materialPageRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // decoration: BoxDecoration(gradient:
        // LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight,colors: <Color>[Color.fromRGBO(122, 41, 40, 1), Color.fromRGBO(165, 55, 54, 1),]),
        // ),

        child: ListView(
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color.fromRGBO(1, 1, 1, 0)),
                  accountName: Text('Dostyq User'),
                  accountEmail: Text('user@gmail.com'),
                  currentAccountPicture: Image.asset('images/user_icon.png'),
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UserCabinet()));
              },
            ),

            CreateElements('Кітапхана', MaterialPageRoute(builder: (BuildContext context) => LibraryPage()), 'kitaphana.png'),
            CreateElements('Ғибратты Әңгіме', MaterialPageRoute(builder: (BuildContext context) => GibrattyAngimeMain()), 'gibratty_angime.png'),
            CreateElements('Подкаст', MaterialPageRoute(builder: (BuildContext context) => PodcastPage()), 'mic.png'),
            CreateElements('Quizizz', MaterialPageRoute(builder: (BuildContext context) => QuizPage()), 'marafon.png'),
            CreateElements('Марафон', MaterialPageRoute(builder: (BuildContext context) => MarathonPage()), 'ic_marathon_white.png'),
            CreateElements('Профориентация', MaterialPageRoute(builder: (BuildContext context) => ProfOrient()), 'proforient.png'),
            CreateElements('Хобби', MaterialPageRoute(builder: (BuildContext context) => HobbysPage()), 'hobby.png'),
            CreateElements('Спорт', MaterialPageRoute(builder: (BuildContext context) => SportPage()), 'ic_sport_white.png'),
            CreateElements('Кино', MaterialPageRoute(builder: (BuildContext context) => CinemaPage()), 'kino.png'),
            CreateElements('Жаңа ұсыныстар', MaterialPageRoute(builder: (BuildContext context) => JanaUsinis()), 'feedback.png'),
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
            // CreateElements('Жарыс Жеңімпаздары', MaterialPageRoute(builder: (BuildContext context) => LibraryPage()), 'jenimpazar.png'),

          ],
        ),
      ),
    );
  }
}
