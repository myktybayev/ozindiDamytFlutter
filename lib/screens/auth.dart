
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ozindi_damyt/screens/kitapkhana/book.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;
  FirebaseApp app;

  @override
  Widget build(BuildContext context) {
    final referenceDatabase = FirebaseDatabase.instance;

    void _buttonAction(){
      final ref = referenceDatabase.reference();
      _email = _emailController.text;
      _password = _passwordController.text;
      _emailController.clear();
      _passwordController.clear();
    }

    Widget _input(Icon icon, String hint, TextEditingController controller, bool obscure){
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 3)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 1)
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.black),
                child: icon,
              ),
            )
          ),
        ),
      );
    }

    Widget _logo(){
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text('Library', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black)),
          ),
        ),
      );
    }

    Widget _button(String text, void func()){
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Colors.blueAccent,
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20),
        ),
        onPressed: (){
          func();
        },
      );
    }

    Widget _form(String label, void func()){
      return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 100),
              child:_input(Icon(Icons.email), 'Email', _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input(Icon(Icons.lock), 'Password', _passwordController, true),
            ),
            // SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            ),
          ],
        ),
      );
    }



    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          _logo(),
          (
              showLogin
              ? Column(
                children: [
                  _form('LOGIN', _buttonAction),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Text('Not registered yet? Register!', style: TextStyle(fontSize: 20, color: Colors.black)),
                      onTap: (){
                        setState(() {
                          showLogin = false;
                        });
                      },
                    ),
                  )
                ],
              )
              :
              Column(
                children: [
                  _form('REGISTER', _buttonAction),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Text('Already registered? Login!', style: TextStyle(fontSize: 20, color: Colors.black)),
                      onTap: (){
                        setState(() {
                          showLogin = true;
                        });
                      },
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}

Widget subtitle(BuildContext context, Book book){
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch(book.author){
    case '3':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case '4':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case '5':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }

  return Row(
    children: <Widget>[
      Expanded(
          flex: 1,
          child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            value: indicatorLevel,
            valueColor: AlwaysStoppedAnimation(color),
          )
      ),
      SizedBox(width: 10),
      Expanded(
          flex: 3,
          child: Text(book.author, style: TextStyle(color: Colors.black),))
    ],
  );
}
