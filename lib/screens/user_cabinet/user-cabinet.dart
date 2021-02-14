
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ozindi_damyt/screens/user_cabinet/question.dart';
import 'package:ozindi_damyt/screens/user_cabinet/sport.dart';
import 'package:ozindi_damyt/screens/user_cabinet/user-books.dart';

import 'home.dart';
import 'home2.dart';
import 'marathon.dart';



class UserCabinet extends StatefulWidget {
  @override
  _UserCabinetState createState() => _UserCabinetState();
}

class _UserCabinetState extends State<UserCabinet> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    UserHome2(),
    UserBooks(),
    Marafon(),
    sport_user(),
    Suraq_user(),

  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,size: 25,
            ),
            title: Text('Басты мәзір'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_outlined ,
            ),
            title: Text(
              'Кітап оқу',
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.event_available_outlined,
            ),
            title: Text(
              'Марафон',
            ),
          ),
          BottomNavigationBarItem(

            icon: Icon(
              Icons.directions_run_rounded ,

            ),
            title: Text(
              'Спорт',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_outlined,
            ),
            title: Text(
              'Quiz',
            ),
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
