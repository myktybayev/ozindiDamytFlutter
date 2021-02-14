import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'drawer/drawer.dart';
import 'screens/kitapkhana/library.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OzindiDamyt',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(headline6: TextStyle(color: Colors.black))
      ),
      home: LibraryPage()
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   final appBar = AppBar(
//     title: Text('Кітапхана'),
//   );
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBar,
//       drawer: DrawerMenu(),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             LibraryPage()
//           ],
//         ),
//       ),
//     );
//   }
// }